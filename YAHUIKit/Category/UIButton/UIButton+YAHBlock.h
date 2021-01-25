//
//  UIButton+Block.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^YAHTouchedBlock)(NSInteger tag);

@interface UIButton (YAHBlock)
-(void)addActionHandler:(YAHTouchedBlock)touchHandler;


/// 点击回调-点击按钮后，延迟响应0.5s，防止重复点击
/// @param touchHandler 点击回调
-(void)addActionAndDisableAWhileHandler:(YAHTouchedBlock)touchHandler;

@end
