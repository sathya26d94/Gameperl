//
//  ResendViewController.m
//  Gamperl
//
//  Created by Sathiyamoorthy N on 13/07/17.
//  Copyright © 2017 SaTHYa. All rights reserved.
//

#import "ResendViewController.h"

@interface ResendViewController ()

@end

@implementation ResendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)resendTouched:(id)sender {
    [self performSegueWithIdentifier:@"toAccepted" sender:self];
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

@end
