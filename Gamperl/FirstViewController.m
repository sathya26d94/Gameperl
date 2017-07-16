//
//  FirstViewController.m
//  Gamperl
//
//  Created by Sathiyamoorthy N on 13/07/17.
//  Copyright © 2017 SaTHYa. All rights reserved.
//

#import "FirstViewController.h"
#import "LoginUserViewController.h"
@interface FirstViewController ()

@end

@implementation FirstViewController
bool isUser;
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)userTouched:(id)sender {
    isUser = true;
    [self performSegueWithIdentifier:@"LoginUser" sender:self];
    
}
- (IBAction)freelancerTouched:(id)sender {
    isUser = false;
    [self performSegueWithIdentifier:@"LoginUser" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    LoginUserViewController *login = [segue destinationViewController];
    if (isUser) {
    login.title = @"Login as User";
    }else {
    login.title = @"Login as freelancer";
    }
    
}

@end
