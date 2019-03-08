//
//  UIAlertController+YAHAlert.m
//  YAHUIKit
//
//  Created by wangshiwen on 2018/12/2.
//  Copyright © 2018 yahua. All rights reserved.
//

#import "UIViewController+YAHAlert.h"
#import <YAHBaseKit/EXTScope.h>
#import <YAHBaseKit/NSString+RegexCategory_YAH.h>

@implementation UIViewController (YAHAlert)

#pragma mark - 1个按钮

- (void)showAlertWithTitle:(NSString *)title message:(NSString *_Nullable)message {
    
    [self showAlertWithTitle:title message:message block:nil];
}

- (UIAlertController *)showAlertWithTitle:(NSString *)title message:(NSString *_Nullable)message block:(void(^_Nullable)(void))block {
    
    return [self showAlertWithTitle:title message:message buttonTitle:@"确定" block:block];
}

- (UIAlertController *)showAlertWithTitle:(NSString *)title message:(NSString *_Nullable)message buttonTitle:(NSString *)buttonTile block:(void(^_Nullable)(void))block {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *rightAction = [UIAlertAction actionWithTitle:buttonTile style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (block) {
            block();
        }
    }];
    [alert addAction:rightAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    return alert;
}

#pragma mark - 2个按钮

- (void)showAlertWithTitle:(NSString *)title message:(NSString * _Nullable)message rightBlock:(void(^)(void))rightBlock {
    
    [self showAlertWithTitle:title message:message leftTitle:nil rightTitle:nil leftBlock:nil rightBlock:rightBlock];
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *_Nullable)message rightTitle:(NSString *)rightTitle rightBlock:(void(^_Nullable)(void))rightBlock {
    
    [self showAlertWithTitle:title message:message leftTitle:nil rightTitle:rightTitle leftBlock:nil rightBlock:rightBlock];
}


- (UIAlertController *)showAlertWithTitle:(NSString *)title message:(NSString *_Nullable)message leftTitle:(NSString *_Nullable)leftTitle rightTitle:(NSString *_Nullable)rightTitle leftBlock:(void(^)(void))leftBlock rightBlock:(void(^)(void))rightBlock {
    
    if ([NSString stringIsNullOrEmpty:leftTitle]) {
        leftTitle = @"取消";
    }
    if ([NSString stringIsNullOrEmpty:rightTitle]) {
        rightTitle = YAH_Localized(@"确定");
    }
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:leftTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        execute_block_if_nonnull(leftBlock);
    }];
    UIAlertAction *rightAction = [UIAlertAction actionWithTitle:rightTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        execute_block_if_nonnull(rightBlock);
    }];
    [alert addAction:cancelAction];
    [alert addAction:rightAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    return alert;
}

@end
