//
//  CustomTableCell.h
//  QSR
//
//  Created by admin on 15/11/13.
//  Copyright (c) 2013 admin. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface CustomTableCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *middleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (strong, nonatomic) IBOutlet UILabel *lastLabel;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end
