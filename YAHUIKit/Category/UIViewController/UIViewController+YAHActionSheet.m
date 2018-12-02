//
//  UIAlertController+YAHActionSheet.m
//  Pods-YAHUIKit
//
//  Created by wangshiwen on 2018/12/2.
//

#import "UIViewController+YAHActionSheet.h"
#import <YAHBaseKit/EXTScope.h>

@implementation UIViewController (YAHActionSheet)

- (void)actionSheetWithTitle:(NSString*) title
                     buttons:(NSArray*) buttonTitles
                  showInView:(UIView*) view
                   onDismiss:(YAHActionSheetDismissBlock) dismissed
                    onCancel:(YAHActionSheetCancelBlock) cancelled {
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    if (actionSheet.popoverPresentationController) {
        actionSheet.popoverPresentationController.sourceView = view;
        actionSheet.popoverPresentationController.sourceRect = view.bounds;
    }
    
    [buttonTitles enumerateObjectsUsingBlock:^(NSString* _Nonnull title, NSUInteger idx, BOOL * _Nonnull stop) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            execute_block_if_nonnull(dismissed, idx);
        }];
        [actionSheet addAction:action];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        execute_block_if_nonnull(cancelled)
    }];
    [actionSheet addAction:cancelAction];
    
    [self presentViewController:actionSheet animated:YES completion:nil];
}

@end
