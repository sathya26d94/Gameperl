//
//  RequestNotificationViewController.h
//  Gamperl
//
//  Created by Sathiyamoorthy N on 16/07/17.
//  Copyright © 2017 SaTHYa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RequestNotificationViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UIImageView *tickImageView;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *totalPrice1;
@property (weak, nonatomic) IBOutlet UILabel *totalPrice2;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
