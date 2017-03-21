//
//  CALayer+ButtonBorder.m
//  NBA
//
//  Created by Dustin on 16/11/2.
//  Copyright © 2016年 Dustin. All rights reserved.
//

#import "CALayer+ButtonBorder.h"
#import <UIKit/UIKit.h>

@implementation CALayer (ButtonBorder)

//设置这里xib设置的按钮的border颜色才有效
- (void)setBorderColorWithUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}
@end
