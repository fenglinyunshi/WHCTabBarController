//
//  CustomTabBar.m
//  WHCTabBarController
//
//  Created by Dustin on 17/3/21.
//  Copyright © 2017年 PicVision. All rights reserved.
//

#import "CustomTabBar.h"
#import "CustomTabBarItemButton.h"

@interface CustomTabBar ()

@property (nonatomic,assign) NSInteger itemCount;// 子控制器个数
@property (nonatomic,assign) UIButton *previousBtn;// 前一个被点击的按钮

@end

@implementation CustomTabBar

- (instancetype)initWithFrame:(CGRect)frame itemCount:(NSInteger)itemCount
{
    if (self = [super initWithFrame:frame]) {
        // 保存按钮个数
        _itemCount = itemCount;
        
        // 设置背景颜色
        self.backgroundColor = [UIColor whiteColor];
        
        // 创建按钮
        [self createBtn];
    }
    
    return self;
}

#pragma mark 创建tabBarItem
- (void)createBtn {
    // 循环创建按钮
    
    // 计算按钮的宽高
    CGFloat w = self.bounds.size.width / (self.itemCount+1);
    CGFloat h = self.bounds.size.height;
    NSArray *selectedImgArr = @[@"tab_live_p",@"tab_launch",@"tab_me_p"];
    NSArray *normalImgarr = @[@"tab_live",@"tab_launch",@"tab_me"];
    NSArray *titleArr = @[@"首页",@"",@"我"];
    for (int i = 0; i < self.itemCount+1; i ++) {
        
        if(0 == i){
            CustomTabBarItemButton *btn = [[CustomTabBarItemButton alloc] initWithFrame:CGRectMake(i * w, 0, w, h) imgName:normalImgarr[i] selectedImgName:selectedImgArr[i] titleColor:[UIColor colorWithRed:34/255.0 green:209/255.0 blue:188/255.0 alpha:1.0] title:titleArr[i]];
            btn.tag = 0;
            // 添加按钮的点击事件
            [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:btn];
            [self btnClicked:btn];
        }
        if (1 == i) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake((self.frame.size.width-87)/2, -37, 87, 87);
            [btn setImage:[UIImage imageNamed:selectedImgArr[i]] forState:UIControlStateNormal];
            btn.tag = 2;
            // 添加按钮的点击事件
            [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:btn];
        }
        
        if(2 == i){
            CustomTabBarItemButton *btn = [[CustomTabBarItemButton alloc] initWithFrame:CGRectMake(i * w, 0, w, h) imgName:normalImgarr[i] selectedImgName:selectedImgArr[i] titleColor:[UIColor colorWithRed:34/255.0 green:209/255.0 blue:188/255.0 alpha:1.0] title:titleArr[i]];
            btn.tag = 1;
            // 添加按钮的点击事件
            [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:btn];
        }

        
    }
}

#pragma mark tabBarItem被点击让代理使UITabBarController的子控制器与其对应
- (void)btnClicked:(UIButton *)btn {

    if (0 == btn.tag||1 == btn.tag) {
        _previousBtn.selected = NO;
        btn.selected = YES;
        
        _previousBtn = btn;
        
    }
    if ([_delegate respondsToSelector:@selector(myTabbar:btnClicked:)]) {
        [_delegate myTabbar:self btnClicked:btn.tag];
    }
}
#pragma mark 当按钮超过了父视图范围，点击是没有反应的。因为消息的传递是从最下层的父视图开始调用hittest方法。当存在view时才会传递对应的event，现在点击了父视图以外的范围，自然返回的是nil。所以当子视图（比如按钮btn）因为一些原因超出了父视图范围，就要重写hittest方法，让其返回对应的子视图，来接收事件。
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *view = [super hitTest:point withEvent:event];
    if (view == nil) {
        
        UIButton *btn = (UIButton *)[self viewWithTag:2];
        CGPoint tempoint = [btn convertPoint:point fromView:self];
        //判断给定的点是否被一个CGRect包含,可以用CGRectContainsPoint函数
        if (CGRectContainsPoint(btn.bounds, tempoint))
        {
            view = btn;
        }
    }
    return view;
}


@end
