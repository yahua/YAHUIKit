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
+ (MBProgressHUD *)showWaitView:(NSString *)message;
+ (MBProgressHUD *)showDisableWaitView:(NSString *)message;
+ (MBProgressHUD *)showWaitViewAddedTo:(UIView *)view message:(NSString *)message;
+ (MBProgressHUD *)showDisableWaitViewAddedTo:(UIView *)view message:(NSString *)message;
+ (MBProgressHUD *)showWaitViewAddedTo:(UIView *)view message:(NSString *)message hideDelay:(NSInteger)delay;

//只显示文本的HUD框
+ (MBProgressHUD *)showError:(NSError *)error;
+ (MBProgressHUD *)showTextOnlyHUD:(NSString *)message;
+ (MBProgressHUD *)showTextOnlyHUDAddedTo:(UIView *)view message:(NSString *)message;
+ (MBProgressHUD *)showTextOnlyHUDAddedTo:(UIView *)view message:(NSString *)message hideDelay:(NSInteger)delay;

//隐藏HUD框
+ (void)hideHUD;
+ (void)hideHUBFrom:(UIView *)view;

@end
