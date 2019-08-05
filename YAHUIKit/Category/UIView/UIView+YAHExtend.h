//
//  UIView+YAHExtend.h
//  YAHUIKit
//
//  Created by wangshiwen on 2019/4/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YAHExtend)

- (UIViewController *)getParentVC;

+ (__kindof UIView *)viewWithXib;

@end

NS_ASSUME_NONNULL_END
