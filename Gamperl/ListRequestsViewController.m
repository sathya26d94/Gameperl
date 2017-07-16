//
//  ListRequestsViewController.m
//  Gamperl
//
//  Created by Sathiyamoorthy N on 15/07/17.
//  Copyright © 2017 SaTHYa. All rights reserved.
//

#import "ListRequestsViewController.h"

@interface ListRequestsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation ListRequestsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setTile:(NSString*)title {
    [self.titleLabel setText:title];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButtonTouched:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
