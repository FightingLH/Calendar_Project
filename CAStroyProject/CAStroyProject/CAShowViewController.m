//
//  CAShowViewController.m
//  CAStroyProject
//
//  Created by lh on 2017/6/23.
//  Copyright © 2017年 lh. All rights reserved.
//

#import "CAShowViewController.h"
#import "CAShowCanledarView.h"
#import "CAShowCanledarNavView.h"

@interface CAShowViewController ()
<iCarouselDataSource, iCarouselDelegate>
@property (nonatomic, strong)  iCarousel      *bgIcarousel;
@property (nonatomic, strong)  NSMutableArray *items;
@property (nonatomic, strong)  CAShowCanledarNavView *navView;
@end

@implementation CAShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor showColor];
//    self.items = [NSMutableArray array];
//    for (int i = 0; i < 12; i++)
//    {
//        [_items addObject:@(i)];
//    }
//    self.bgIcarousel.type = iCarouselTypeWheel;
//    [self configView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configView
{
    [self.view addSubview:self.bgIcarousel];
    self.navigationItem.titleView = self.navView;
    [self.bgIcarousel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.right.equalTo(self.view);
    }];
    
}

#pragma mark iCarousel methods

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"%ld",index);
}

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    //return the total number of items in the carousel
    return [_items count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (view == nil)
    {
        view = [[CAShowCanledarView alloc] initWithFrame:CGRectMake(0, 0, 250.0f, 350.0f)];
        view.backgroundColor = [UIColor showColor];
        view.contentMode = UIViewContentModeCenter;
    }
    else
    {
        CAShowCanledarView *caView = (CAShowCanledarView *)view;
        caView.titleLabel.text = [NSString stringWithFormat:@"%@月",self.items[index]];
    }
    return view;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionSpacing)
    {
        return value * 1.1;
    }
    return value;
}

- (CAShowCanledarNavView *)navView
{
    if (!_navView) {
        _navView = [[CAShowCanledarNavView alloc]init];
        _navView.frame = CGRectMake(0, 0, 100, 44);
        _navView.backgroundColor = [UIColor navColor];
    }
    return _navView;
}

- (iCarousel *)bgIcarousel
{
    if (!_bgIcarousel) {
        _bgIcarousel = [[iCarousel alloc]init];
        _bgIcarousel.backgroundColor = [UIColor grayColor];
        _bgIcarousel.delegate = self;
        _bgIcarousel.dataSource = self;
    }
    return _bgIcarousel;
}

@end
