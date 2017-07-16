//
//  CALayer+XibConfiguration.h
//  Gamperl
//
//  Created by Sathiyamoorthy N on 13/07/17.
//  Copyright © 2017 SaTHYa. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CALayer(XibConfiguration)

// This assigns a CGColor to borderColor.
@property(nonatomic, assign) UIColor* borderUIColor;

@end
