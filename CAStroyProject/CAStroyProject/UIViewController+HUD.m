//
//  UIViewController+HUD.m
//  CAStroyProject
//
//  Created by lh on 2017/6/26.
//  Copyright © 2017年 lh. All rights reserved.
//

#import "UIViewController+HUD.h"
#import "MBProgressHUD.h"
#import <objc/runtime.h>
static const void *CAHttpRequestHUDKey = &CAHttpRequestHUDKey;

@implementation UIViewController (HUD)

- (MBProgressHUD *)HUD{
    return objc_getAssociatedObject(self, CAHttpRequestHUDKey);
}

- (void)setHUD:(MBProgressHUD *)HUD{
    objc_setAssociatedObject(self, CAHttpRequestHUDKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)showHudInView:(UIView *)view showMsg:(NSString *)msg{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    HUD.label.text = msg;
    [view addSubview:HUD];
    [HUD showAnimated:YES];
    [self setHUD:HUD];
}

- (void)showMsg:(NSString *)msg
{
    UIView *view = [[UIApplication sharedApplication].delegate window];
    view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = YES;
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = msg;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud showAnimated:YES];
}

- (void)hideHud{
    [[self HUD] hideAnimated:YES];
}

@end
