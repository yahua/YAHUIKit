//
//  MBProgressHUD+NewsExtension.m
//  News-iOS
//
//  Created by yahua on 11/10/16.
//  Copyright © 2016 MM. All rights reserved.
//

#import "MBProgressHUD+YAHExtension.h"

#define keyWindow ([[UIApplication sharedApplication] delegate].window)

@implementation MBProgressHUD (YAHExtension)

//显示带转圈文字的HUD框

+ (void)showWaitView:(NSString *)message {
    [MBProgressHUD showWaitViewAddedTo:keyWindow message:message];
}

+ (void)showDisableWaitView:(NSString *)message {
    
    [MBProgressHUD showDisableWaitViewAddedTo:keyWindow message:message];
}

+ (void)showWaitViewAddedTo:(UIView *)view message:(NSString *)message {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [UIColor colorWithWhite:0 alpha:0.7f];
    hud.contentColor = [UIColor colorWithWhite:1 alpha:1];
    [hud setDefaultMotionEffectsEnabled:YES];
    [hud showAnimated:YES];
}

+ (void)showDisableWaitViewAddedTo:(UIView *)view message:(NSString *)message {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    hud.label.text = message;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [UIColor colorWithWhite:0 alpha:0.7f];
    hud.contentColor = [UIColor colorWithWhite:1 alpha:1];
    [hud setDefaultMotionEffectsEnabled:YES];
    [hud showAnimated:YES];
    
}
+ (void)showWaitViewAddedTo:(UIView *)view message:(NSString *)message hideDelay:(NSInteger)delay {
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [UIColor colorWithWhite:0 alpha:0.7f];
    [hud showAnimated:YES];
    [hud hideAnimated:YES afterDelay:delay];
}

+ (void)showError:(NSError *)error {
    
    if (!error) {
        return;
    }
    [self showTextOnlyHUD:error.localizedDescription];
}

+ (void)showTextOnlyHUD:(NSString *)message {
    [MBProgressHUD showTextOnlyHUDAddedTo:keyWindow message:message];
}

//只显示文本的HUD框
+ (void)showTextOnlyHUDAddedTo:(UIView *)view message:(NSString *)message {
    [self showTextOnlyHUDAddedTo:view message:message hideDelay:2.0f];
}
+ (void)showTextOnlyHUDAddedTo:(UIView *)view message:(NSString *)message hideDelay:(NSInteger)delay {
    
    if (![message isKindOfClass:NSString.class]) {
        return;
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [UIColor colorWithWhite:0 alpha:0.7f];
    
    UIColor *textColor = [UIColor whiteColor];
    hud.detailsLabel.text = message;
    hud.detailsLabel.textColor = textColor;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:delay];
}

//隐藏HUD框
+ (void)hideHUBFrom:(UIView *)view {
    MBProgressHUD *hud = [self HUDForView:view];
    while (hud) {
        [MBProgressHUD hideHUDForView:view animated:YES];
        hud = [self HUDForView:view];
    }
}

+ (void)hideHUD {
    [MBProgressHUD hideHUBFrom:keyWindow];
}

@end
