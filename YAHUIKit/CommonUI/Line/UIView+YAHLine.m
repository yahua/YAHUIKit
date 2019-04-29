//
//  UIView+Addition.m
//  YAHUIKit
//
//  Created by yahua on 14-10-22.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "UIView+YAHLine.h"

static CGFloat kLineWidth = 1.0f;
static UIColor *kLineColor = nil;

@implementation UIView (YAHLine)

#pragma mark - 绘制分割线

- (void)setLineWidth:(CGFloat)width {
    
    kLineWidth = width;
}

- (void)setLineColor:(UIColor *)color {
    
    kLineColor = color;
}

//添加分割线
- (UIView *)addLine
{
    return [self addLineWithPosition:LinePositionBottom];
}

//添加分割线(指定位置)
- (UIView *)addLineWithPosition:(LinePosition)position
{
    return [self addLineWithPosition:position margin:0];
}

//添加分割线(指定边距)
- (UIView *)addLineWithMargin:(CGFloat)margin
{
    return [self addLineWithPosition:LinePositionBottom margin:margin color:nil];
}

//添加分割线(指定颜色)
- (UIView *)addLineWithColor:(UIColor *)color
{
    return [self addLineWithPosition:LinePositionBottom margin:0 color:color];
}

//添加分割线(指定颜色、左右/上下边距)
- (UIView *)addLineWithMargin:(CGFloat)margin color:(UIColor *)color
{
    return [self addLineWithPosition:LinePositionBottom margin:margin color:color];
}

//添加分割线(指定位置、颜色)
- (UIView *)addLineWithPosition:(LinePosition)position color:(UIColor *)color
{
    return [self addLineWithPosition:position margin:0 color:color];
}

//添加分割线(指定位置、左右/上下边距)
- (UIView *)addLineWithPosition:(LinePosition)position margin:(CGFloat)margin
{
    return [self addLineWithPosition:position margin:margin color:nil];
}

//添加分割线(指定位置、左右/上下边距、颜色)
- (UIView *)addLineWithPosition:(LinePosition)position margin:(CGFloat)margin color:(UIColor *)color
{
    UIViewAutoresizing autoresizing = UIViewAutoresizingNone;
    CGRect frame;
    switch (position) {
        case LinePositionLeft:
            frame = CGRectMake(0, margin, kLineWidth, self.bounds.size.height - margin*2);
            break;
        case LinePositionRight:
            frame = CGRectMake(self.bounds.size.width - kLineWidth, margin, kLineWidth, self.bounds.size.height - margin*2);
            break;
        case LinePositionTop:
            frame = CGRectMake(margin, 0, self.bounds.size.width - margin*2, kLineWidth);
            break;
            
        default:
            autoresizing = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
            frame = CGRectMake(margin, self.bounds.size.height - kLineWidth, self.bounds.size.width - margin*2, kLineWidth);
            break;
    }
    
    UIView *line = [[UIView alloc] initWithFrame:frame];
    line.autoresizingMask = autoresizing;
    if (!color) {
        color = kLineColor;
        if (!color) {
            color =[UIColor grayColor];
        }
    }
    line.backgroundColor = color;
    [self addSubview:line];
    
    return line;
}

//添加分割线(指定位置、左右/上下边距、颜色)
- (UIView *)addLineForViewWithPosition:(LinePosition)position margin:(CGFloat)margin color:(UIColor *)color
{
    CGRect frame;
    switch (position) {
        case LinePositionLeft:
            frame = CGRectMake(0, margin, kLineWidth, self.bounds.size.height - margin*2);
            break;
        case LinePositionRight:
            frame = CGRectMake(self.bounds.size.width - kLineWidth, margin, kLineWidth, self.bounds.size.height - margin*2);
            break;
        case LinePositionTop:
            frame = CGRectMake(margin, 0, self.bounds.size.width - margin*2, kLineWidth);
            break;
            
        default:
            frame = CGRectMake(margin, self.bounds.size.height - kLineWidth, self.bounds.size.width - margin*2, kLineWidth);
            break;
    }
    
    UIView *line = [[UIView alloc] initWithFrame:frame];
    if (!color) {
        color = kLineColor;
        if (!color) {
            color =[UIColor grayColor];
        }
    }
    line.backgroundColor = color;
    [self addSubview:line];
    
    return line;
}

@end
