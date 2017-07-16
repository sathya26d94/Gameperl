//
//  LoginUserViewController.m
//  Gamperl
//
//  Created by Sathiyamoorthy N on 13/07/17.
//  Copyright © 2017 SaTHYa. All rights reserved.
//

#import "LoginUserViewController.h"

@interface LoginUserViewController ()

@end

@implementation LoginUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backButtonTouched:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end
