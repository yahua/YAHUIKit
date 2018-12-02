//
//  UIAlertController+YAHActionSheet.h
//  Pods-YAHUIKit
//
//  Created by wangshiwen on 2018/12/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^YAHActionSheetDismissBlock)(NSInteger buttonIndex);
typedef void (^YAHActionSheetCancelBlock)(void);

@interface UIViewController (YAHActionSheet)

- (void)actionSheetWithTitle:(NSString*) title
                     buttons:(NSArray*) buttonTitles
                  showInView:(UIView*) view
                   onDismiss:(YAHActionSheetDismissBlock) dismissed
                    onCancel:(YAHActionSheetCancelBlock) cancelled;

@end

NS_ASSUME_NONNULL_END
