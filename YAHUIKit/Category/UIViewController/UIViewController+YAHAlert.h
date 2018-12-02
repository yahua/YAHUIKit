//
//  UIAlertController+YAHAlert.h
//  YAHUIKit
//
//  Created by wangshiwen on 2018/12/2.
//  Copyright © 2018 yahua. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (YAHAlert)

/**
 只有一个按钮的alert
 
 @param title 标题
 @param message 内容
 */
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message;

/**
 只有一个按钮的alert
 
 @param title 标题
 @param message 内容
 */
- (UIAlertController *)showAlertWithTitle:(NSString *)title message:(NSString *)message block:(void(^_Nullable)(void))block;


/**
 两个按钮的alert  默认左边“取消”   右边“确定”
 
 @param title 标题
 @param message 内容
 @param rightBlock 点击确定的回调
 */
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message rightBlock:(void(^_Nullable)(void))rightBlock;


/**
 两个按钮的alert  默认左边“取消”
 
 @param title 标题
 @param message 内容
 @param rightTitle 右边标题
 @param rightBlock 点击右边按钮的回调
 */
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message rightTitle:(NSString *)rightTitle rightBlock:(void(^_Nullable)(void))rightBlock;

/**
 两个按钮的alert
 
 @param title 标题
 @param message 内容
 @param leftTitle 左边标题
 @param rightTitle 右边标题
 @param leftBlock 点击左边按钮的回调
 @param rightBlock 点击右边按钮的回调
 */
- (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
                 leftTitle:(NSString *_Nullable)leftTitle
                rightTitle:(NSString *_Nullable)rightTitle
                 leftBlock:(void(^_Nullable)(void))leftBlock
                rightBlock:(void(^_Nullable)(void))rightBlock;

@end

NS_ASSUME_NONNULL_END
