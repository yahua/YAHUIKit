//
//  UIView+Addition.h
//  MoboNews
//
//  Created by Eirc on 14-10-22.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, LinePosition) {
    LinePositionNone   = 0,
    LinePositionTop    = 1 << 0,
    LinePositionLeft   = 1 << 1,
    LinePositionBottom = 1 << 2,
    LinePositionRight  = 1 << 3,
    LinePositionAll    = LinePositionTop | LinePositionLeft | LinePositionBottom | LinePositionRight
};

@interface UIView (YAHLine)

//如果要设置线条宽度 画线前调用  default 1.0f
- (void)setLineWidth:(CGFloat)width;

//如果要设置颜色 画线前调用  default grayColor
- (void)setLineColor:(UIColor *)color;
//添加分割线
- (UIView *)addLine;
//添加分割线(指定位置)
- (UIView *)addLineWithPosition:(LinePosition)position;
//添加分割线(指定边距)
- (UIView *)addLineWithMargin:(CGFloat)margin;
//添加分割线(指定颜色)
- (UIView *)addLineWithColor:(UIColor *)color;
//添加分割线(指定颜色、左右/上下边距)
- (UIView *)addLineWithMargin:(CGFloat)margin color:(UIColor *)color;
//添加分割线(指定位置、颜色)
- (UIView *)addLineWithPosition:(LinePosition)position color:(UIColor *)color;
//添加分割线(指定位置、左右/上下边距)
- (UIView *)addLineWithPosition:(LinePosition)position margin:(CGFloat)margin;
//添加分割线(指定位置、左右/上下边距、颜色) position自适应
- (UIView *)addLineWithPosition:(LinePosition)position margin:(CGFloat)margin color:(UIColor *)color;
//添加分割线(指定位置、左右/上下边距、颜色)  position不变
- (UIView *)addLineForViewWithPosition:(LinePosition)position margin:(CGFloat)margin color:(UIColor *)color;

- (UIView *)lineView;

@end
