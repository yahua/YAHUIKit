//
//  MBProgressHUD+NewsExtension.h
//  News-iOS
//
//  Created by yahua on 11/10/16.
//  Copyright © 2016 MM. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (YAHExtension)

//显示带转圈文字的HUD框
+ (void)showWaitView:(NSString *)message;
+ (void)showDisableWaitView:(NSString *)message;
+ (void)showWaitViewAddedTo:(UIView *)view message:(NSString *)message;
+ (void)showDisableWaitViewAddedTo:(UIView *)view message:(NSString *)message;
+ (void)showWaitViewAddedTo:(UIView *)view message:(NSString *)message hideDelay:(NSInteger)delay;

//只显示文本的HUD框
+ (void)showError:(NSError *)error;
+ (void)showTextOnlyHUD:(NSString *)message;
+ (void)showTextOnlyHUDAddedTo:(UIView *)view message:(NSString *)message;
+ (void)showTextOnlyHUDAddedTo:(UIView *)view message:(NSString *)message hideDelay:(NSInteger)delay;

//隐藏HUD框
+ (void)hideHUD;
+ (void)hideHUBFrom:(UIView *)view;

@end
