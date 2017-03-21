//
//  CustomTabBar.h
//  WHCTabBarController
//
//  Created by Dustin on 17/3/21.
//  Copyright © 2017年 PicVision. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomTabBar;

@protocol CustomTabBarDelegate <NSObject>

- (void)myTabbar:(CustomTabBar *)tabbar btnClicked:(NSInteger)index;

@end

@interface CustomTabBar : UIView
/** 初始化方法
 参数1: 位置大小
 参数2: 内部按钮个数
 */
- (instancetype)initWithFrame:(CGRect)frame itemCount:(NSInteger)itemCount;

@property (nonatomic, weak) id<CustomTabBarDelegate> delegate;

@end
