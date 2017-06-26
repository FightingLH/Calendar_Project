//
//  UIViewController+HUD.h
//  CAStroyProject
//
//  Created by lh on 2017/6/26.
//  Copyright © 2017年 lh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HUD)
- (void)showHudInView:(UIView *)view showMsg:(NSString *)msg;
- (void)showMsg:(NSString *)msg;
@end
