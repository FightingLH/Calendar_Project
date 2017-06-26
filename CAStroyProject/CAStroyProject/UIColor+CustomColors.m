//
//  UIColor+CustomColors.m
//  CAStroyProject
//
//  Created by lh on 2017/6/23.
//  Copyright © 2017年 lh. All rights reserved.
//

#import "UIColor+CustomColors.h"

@implementation UIColor (CustomColors)

+ (UIColor *)navColor
{
    return [self colorWithRed:112 green:128 blue:144 alpha:1.0];
}

+ (UIColor *)showColor
{
    return [self colorWithRed:245 green:255 blue:245 alpha:1.0];
}

+ (UIColor *)setColor
{
    return [self colorWithRed:245 green:255 blue:250 alpha:1.0];
}

#pragma mark -Private class method
+ (UIColor *)colorWithRed:(NSUInteger)red
                    green:(NSUInteger)green
                     blue:(NSUInteger)blue
{
    return [UIColor colorWithRed:(float)(red/255.f)
                           green:(float)(green/255.f)
                            blue:(float)(blue/255.f)
                           alpha:1.f];
}
@end
