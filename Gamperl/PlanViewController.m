//
//  PlanViewController.m
//  Gamperl
//
//  Created by Sathiyamoorthy N on 16/07/17.
//  Copyright © 2017 SaTHYa. All rights reserved.
//

#import "PlanViewController.h"

@interface PlanViewController ()

@end

@implementation PlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)closeTouched:(id)sender {
    [self removeFromParentViewController];
    [self.view removeFromSuperview];
}

@end
