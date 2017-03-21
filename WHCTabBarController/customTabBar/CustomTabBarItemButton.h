//
//  CustomTabBarItemButton.h
//  WHCTabBarController
//
//  Created by Dustin on 17/3/21.
//  Copyright © 2017年 PicVision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTabBarItemButton : UIButton

- (instancetype)initWithFrame:(CGRect)frame imgName:(NSString *)imgName selectedImgName:(NSString *)selectedImgName titleColor:(UIColor *)color title:(NSString *)title;

@end

