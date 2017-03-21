//
//  MyTabBarViewController.m
//  WHCTabBarController
//
//  Created by Dustin on 17/3/21.
//  Copyright © 2017年 PicVision. All rights reserved.
//

#import "MyTabBarViewController.h"
#import "CustomTabBar.h"
#import "HomeViewController.h"
#import "LiveViewController.h"
#import "MYCenterViewController.h"

#import "AppDelegate.h"

@interface MyTabBarViewController ()<CustomTabBarDelegate>

@end

@implementation MyTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.设置所有子控制器
    [self addChildViewControllers];
    
    // 2.创建自定义的tabbar
    [self createCustomTabbar];
}

#pragma mark 设置所有的子控制器
- (void)addChildViewControllers {
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    MYCenterViewController *myCenterVC = [[MYCenterViewController alloc] init];
    
    // 设置子控制器
    self.viewControllers = @[homeVC, myCenterVC];
}

#pragma mark 隐藏系统自带的tabBar，创建自定义的tabBar
- (void)createCustomTabbar {
    // 1.隐藏系统tabbar
    self.tabBar.hidden = YES;
    
    // 2.创建自定义的tabbar
    CustomTabBar *myTabbar = [[CustomTabBar alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 50, [UIScreen mainScreen].bounds.size.width, 50) itemCount:self.viewControllers.count];
    myTabbar.delegate = self;
    [self.view addSubview:myTabbar];
}

#pragma mark CustomTabBarDelegate方法，tabBarItem被点击
- (void)myTabbar:(CustomTabBar *)tabbar btnClicked:(NSInteger)index
{
    if (2 == index) {
        /*
         *当点击中间的按钮，modal出LiveViewController的视图，并且不覆盖原先视图
         */
        //iOS 8.0之后的方法
        if([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0){
            
            LiveViewController *liveVC = [[LiveViewController alloc] init];
            //设置modal出的视图view的透明度
            liveVC.view.alpha = 0.9;
            //此模式必须设置，否则会覆盖原先视图，看不到原先视图的view
            liveVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
            [self presentViewController:liveVC animated:YES completion:nil];
            
        }else{
            //在iOS7或更低需要设置你的window.rootViewController.modalPresentationStyle = UIModalPresentationCurrentContext
            AppDelegate *appdelegate=(AppDelegate*)[[UIApplication sharedApplication] delegate];
            LiveViewController *liveVC = [[LiveViewController alloc] init];
            liveVC.view.alpha = 0.9;
            appdelegate.window.rootViewController.modalPresentationStyle=UIModalPresentationCurrentContext;
            [appdelegate.window.rootViewController presentViewController:liveVC animated:YES completion:nil];
        }
    }else{
        //设置选择的子控制器与点击的按钮相对应
        self.selectedIndex = index;
    }
}



@end
