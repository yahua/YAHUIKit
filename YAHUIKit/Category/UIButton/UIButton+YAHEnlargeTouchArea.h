//
//  UIButton+EnlargeTouchArea.h
//  YAHUIKit
//
//  Created by yahua on 2017/11/2.
//  Copyright © 2017年 All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (YAHEnlargeTouchArea)

//扩大点击区域
- (void)yah_setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;

//扩大点击区域  上下左右都是size大小
- (void)yah_setEnlargeEdge:(CGFloat)size;

@end
