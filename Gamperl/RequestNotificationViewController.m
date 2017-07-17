//
//  RequestNotificationViewController.m
//  Gamperl
//
//  Created by Sathiyamoorthy N on 16/07/17.
//  Copyright © 2017 SaTHYa. All rights reserved.
//

#import "RequestNotificationViewController.h"
#import "CustomTableCell.h"
@interface RequestNotificationViewController ()
@property (weak, nonatomic) IBOutlet UIButton *acceptButton;
@property (weak, nonatomic) IBOutlet UIButton *declineButton;

@end

@implementation RequestNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clicktoAccept:(id)sender {
    _declineButton.frame = CGRectMake(_declineButton.frame.origin.x, _declineButton.frame.origin.y, 0, 0);
    [_acceptButton setTitle:@"Click to call" forState:UIControlStateNormal];
}
- (IBAction)clicktoDecline:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}
- (IBAction)backTouched:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

//tableview delegate methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
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
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

@end
