//
//  MenuViewController.m
//  Gamperl
//
//  Created by Sathiyamoorthy N on 15/07/17.
//  Copyright © 2017 SaTHYa. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()
@property (weak, nonatomic) IBOutlet UIView *tapView;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;


@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                           action:@selector(movePanel)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [self.tapView addGestureRecognizer:tapGestureRecognizer];
}

-(void)initMenuButton:(BOOL)isUser {
    dispatch_async(dispatch_get_main_queue(), ^{
        if(isUser) {
            [_button1 setTitle:@"Title" forState:UIControlStateNormal];
            [_button2 setTitle:@"Title" forState:UIControlStateNormal];
            [_button3 setTitle:@"Title" forState:UIControlStateNormal];
            [_button1 setTitle:@"Title" forState:UIControlStateNormal];
            [_button1 setTitle:@"Title" forState:UIControlStateNormal];
            [_button1 setTitle:@"Title" forState:UIControlStateNormal];
        } else {
            [_button1 setTitle:@"Dashboard" forState:UIControlStateNormal];
            [_button2 setTitle:@"My Profile" forState:UIControlStateNormal];
            [_button3 setTitle:@"Get help" forState:UIControlStateNormal];
            _button4.hidden = _button5.hidden = _button6.hidden = YES;
        }
    });
}

-(void)movePanel{
    if ([self.delegate respondsToSelector:@selector(movePanelToHome)]) {
        [self.delegate movePanelToHome];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backTouched:(id)sender {
    [self movePanel];
}
- (IBAction)buttonTouched:(id)sender {
    UIButton *selected = (UIButton*)sender;
   [self.delegate menuSelected:selected.titleLabel.text];
}

@end
