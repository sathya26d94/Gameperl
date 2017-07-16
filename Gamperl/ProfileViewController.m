//
//  ProfileViewController.m
//  Gamperl
//
//  Created by Sathiyamoorthy N on 15/07/17.
//  Copyright © 2017 SaTHYa. All rights reserved.
//

#import "ProfileViewController.h"
#import "MenuViewController.h"
#import "DashboardViewController.h"

@interface ProfileViewController () <MenuDelegates>
@property (nonatomic, strong) MenuViewController *menuViewContorller;
@property (nonatomic, strong) UIView *menuView;
@property (nonatomic, assign) BOOL showingMenuPanel, tappedOnce, showPanel;
@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupGestures];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)menuButtonTapped{
    
    UIButton *menuButton = [self.view viewWithTag:10001];
    [self menuTouched:menuButton];
}

- (IBAction)menuTouched:(id)sender {
    if (self.showingMenuPanel) {
        
        [self moveMenuToOriginalPosition];
    }else{
        
        if (self.tappedOnce == FALSE) {
            
            self.menuView = [self getMenuView];
            self.tappedOnce = TRUE;
        }
        
        [UIView animateWithDuration:.50 delay:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            self.menuView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
            UIView *getSideView = [self.menuView viewWithTag:20000];
            if (getSideView == nil) {
                
                UIView *sideView = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 45, 0, 45, self.view.bounds.size.height)];
                sideView.tag = 20000;
                [self.menuView addSubview:sideView];
                
                UITapGestureRecognizer *tapGestureRecognizer1 = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                                        action:@selector(moveMenuToOriginalPosition)];
                tapGestureRecognizer1.numberOfTapsRequired = 1;
                [sideView addGestureRecognizer:tapGestureRecognizer1];
            }
        }
                         completion:^(BOOL finished) {
                             if (finished) {
                                 
                             }
                         }];
    }
}

-(void)movePanelToHome{
    [self moveMenuToOriginalPosition];
}

-(void)menuSelected:(NSString*)menuName {
    [self moveMenuToOriginalPosition];
    if ([menuName isEqualToString:@"Dashboard"]) {
        UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        DashboardViewController *dashBoard = [sb instantiateViewControllerWithIdentifier:@"DashboardViewController"];
        [self presentViewController:dashBoard animated:true completion:nil];
    }
}

-(void)moveMenuToOriginalPosition {
    
    self.showingMenuPanel = FALSE;
    [UIView animateWithDuration:.50 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.menuView.frame = CGRectMake(-  [UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    }
                     completion:^(BOOL finished) {
                         if (finished) {
                             
                         }
                     }];
}

-(UIView *)getMenuView {
    BOOL isProfileEdited = [[NSUserDefaults standardUserDefaults] boolForKey:@"userProfileEdited"];
    if (isProfileEdited) {
        if (self.menuViewContorller != nil) {
            self.menuViewContorller = nil;
        }
    }
    if (self.menuViewContorller == nil){
        UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        self.menuViewContorller = [sb instantiateViewControllerWithIdentifier:@"MenuViewController"];
        [self.view addSubview:self.menuViewContorller.view];
        [self addChildViewController:self.menuViewContorller];
        [self.menuViewContorller didMoveToParentViewController:self];
        self.menuViewContorller.view.frame = CGRectMake(-[UIScreen mainScreen].bounds.size.width, 0, 0, [UIScreen mainScreen].bounds.size.height);
    }
    [self.menuViewContorller initMenuButton:false];
    self.menuViewContorller.delegate = self;
    self.showingMenuPanel = YES;
    [self showCenterViewWithShadow:YES withOffset:2];
    UIView *view = self.menuViewContorller.view;
    return view;
}

-(void)showCenterViewWithShadow:(BOOL)value withOffset:(double)offset {
    if (value) {
        
        [self.menuViewContorller.view.layer setCornerRadius:4];
        [self.menuViewContorller.view.layer setShadowColor:[UIColor blackColor].CGColor];
        [self.menuViewContorller.view.layer setShadowOpacity:0.8];
        [self.menuViewContorller.view.layer setShadowOffset:CGSizeMake(offset, offset)];
    } else {
        
        [self.menuViewContorller.view.layer setCornerRadius:0.0f];
        [self.menuViewContorller.view.layer setShadowOffset:CGSizeMake(offset, offset)];
    }
}

-(void)setupGestures {
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(movePanel:)];
    [panRecognizer setMinimumNumberOfTouches:1];
    [panRecognizer setMaximumNumberOfTouches:1];
    [panRecognizer setDelegate:self];
    
    [self.view addGestureRecognizer:panRecognizer];
}

-(void)movePanel:(id)sender {
    
    [[[(UITapGestureRecognizer*)sender view] layer] removeAllAnimations];
    
    CGPoint translatedPoint = [(UIPanGestureRecognizer*)sender translationInView:self.view];
    CGPoint velocity = [(UIPanGestureRecognizer*)sender velocityInView:[sender view]];
    
    if ([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        if(velocity.x < 0) {
            _showPanel = NO;
        }
        else {
            _showPanel = YES;
        }
    }
    
    if ([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded) {
        
        if (!_showPanel) {
            [self moveMenuToOriginalPosition];
        } else {
            
            [self menuButtonTapped];
            self.tappedOnce = TRUE;
        }
    }
    
    if ([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateChanged) {
        
        if(velocity.x < 0) {
            _showPanel = NO;
        }
        else {
            _showPanel = YES;
        }
        
        self.menuViewContorller.view.center = CGPointMake(self.menuViewContorller.view.center.x + translatedPoint.x, self.menuViewContorller.view.center.y);
        
        [(UIPanGestureRecognizer*)sender setTranslation:CGPointMake(0, 0) inView:self.view];
    }
    
}


@end
