//
//  CustomTableCellProducts.h
//  Gamperl
//
//  Created by Sathiyamoorthy N on 16/07/17.
//  Copyright © 2017 SaTHYa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableCellProducts : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *mainCategory;

@property (weak, nonatomic) IBOutlet UITextField *subCategory;
@property (weak, nonatomic) IBOutlet UITextField *price;
@end
