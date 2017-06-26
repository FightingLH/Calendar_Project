//
//  CAShowCanledarView.m
//  CAStroyProject
//
//  Created by lh on 2017/6/23.
//  Copyright © 2017年 lh. All rights reserved.
//

#import "CAShowCanledarView.h"

CGFloat WIDTH  = 30;
CGFloat HEIGHT = 30;
CGFloat WID_HEI_INTVAL = 5;
CGFloat TOP_BOT_INTVAL = 150;

@interface CAShowCanledarView()

@end

@implementation CAShowCanledarView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self configView];
    }
    return self;
    
}

- (void)configView
{
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_top).offset(15);
    }];
    
    for (NSInteger i = 0; i < 35; i++) {
        UIView *cal = [[UIView alloc]init];
        cal.backgroundColor = [UIColor greenColor];
        cal.layer.cornerRadius = 15.0f;
        [self addSubview:cal];
        cal.frame = CGRectMake((i%7+1)*5 + i%7 *WIDTH, i/7*HEIGHT + TOP_BOT_INTVAL +(i/7 +1)*5, WIDTH, HEIGHT);
        UILabel *test = [[UILabel alloc]init];
        test.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
        test.text = [NSString stringWithFormat:@"%ld",i];
        [cal addSubview:test];
    }
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"测试月";
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}
@end
