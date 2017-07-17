//
//  ListRequestsViewController.m
//  Gamperl
//
//  Created by Sathiyamoorthy N on 15/07/17.
//  Copyright © 2017 SaTHYa. All rights reserved.
//

#import "ListRequestsViewController.h"
#import "CustomTableCell.h"
#import "PlanViewController.h"
#import "RequestNotificationViewController.h"

@interface ListRequestsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation ListRequestsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = 500.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableView.bounds.size.width, 0.01f)];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableView.bounds.size.width, 0.01f)];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

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

//tableview delegate methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 108.5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    tableView.estimatedRowHeight = 500.0;
    tableView.rowHeight = UITableViewAutomaticDimension;
    static NSString *simpleTableIdentifier = @"CustomTableCell";
    CustomTableCell *cell = (CustomTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.middleLabel.text = @"16:00hr";
    cell.lastLabel.text = @"420$";
    cell.bgView.backgroundColor = [UIColor grayColor];
    if (indexPath.row == 0) {
        cell.bgView.backgroundColor = [UIColor whiteColor];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        //open plan viewcontroller
        UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        PlanViewController *content =  [sb instantiateViewControllerWithIdentifier:@"PlanViewController"];
        content.view.layer.borderColor = [UIColor blackColor].CGColor;
        content.view.layer.borderWidth = 2;
        content.view.frame = CGRectMake(50, 200, 330, 380);
        [self addChildViewController:content];
        [self.view addSubview:content.view];
        [content didMoveToParentViewController:self];
    } else {
        UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        RequestNotificationViewController *content =  [sb instantiateViewControllerWithIdentifier:@"RequestNotificationViewController"];
        [self presentViewController:content animated:true completion:nil];
    }
    
}

@end
