//
//  MenuViewController.h
//  Gamperl
//
//  Created by Sathiyamoorthy N on 15/07/17.
//  Copyright © 2017 SaTHYa. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuDelegates <NSObject>

-(void)menuSelected:(NSString*)menuName;
-(void)movePanelToHome;

@end
@interface MenuViewController : UIViewController

@property (nonatomic, strong) id<MenuDelegates> delegate;
-(void)initMenuButton:(BOOL)isUser;

@end
