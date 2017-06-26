//
//  CATabBarController.m
//  CAStroyProject
//
//  Created by lh on 2017/6/23.
//  Copyright © 2017年 lh. All rights reserved.
//

#import "CATabBarController.h"

@interface CATabBarController ()

@end

@implementation CATabBarController

- (void)viewDidLoad
{
    [self setupChildControllers];
}

- (void)setupChildControllers{
    
    [self setupChildNavigationControllerWithClass:[CANavigationController class] tabBarImageName:@"flight_selectTab" tabBarSelectImageName:@"flight_tab" rootViewControllerClass: [CAMapViewController class] rootViewControllerTitle:@"路径"];
    
    [self setupChildNavigationControllerWithClass:[CANavigationController class] tabBarImageName:@"flight_selectTab" tabBarSelectImageName:@"flight_tab" rootViewControllerClass: [CAShowViewController class] rootViewControllerTitle:@"记事"];
    
    [self setupChildNavigationControllerWithClass:[CANavigationController class] tabBarImageName:@"airport_selectTab" tabBarSelectImageName:@"airport_tab" rootViewControllerClass: [CASetViewController class] rootViewControllerTitle:@"设置"];
    
}

- (void)setupChildNavigationControllerWithClass:(Class)class tabBarImageName:(NSString *)name tabBarSelectImageName:(NSString *)selectName rootViewControllerClass:(Class)rootViewControllerClass rootViewControllerTitle:(NSString *)title{
    
    UIViewController *rootVC = [[rootViewControllerClass alloc] init];
    UINavigationController *navVc = [[class  alloc] initWithRootViewController:rootVC];
    [navVc.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:[UIColor blackColor]}];
    
    navVc.tabBarItem.image = [[UIImage imageNamed:name]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navVc.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@", selectName]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navVc.tabBarItem.title = title;
    
    [navVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
    [navVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:[UIFont systemFontOfSize:9]} forState:UIControlStateNormal];
    [self addChildViewController:navVc];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    
}


@end
