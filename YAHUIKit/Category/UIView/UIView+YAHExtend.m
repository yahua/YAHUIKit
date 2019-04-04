//
//  UIView+YAHExtend.m
//  YAHUIKit
//
//  Created by wangshiwen on 2019/4/4.
//

#import "UIView+YAHExtend.h"

@implementation UIView (YAHExtend)

- (UIViewController *)getParentVC {
    
    UIView *view = self;
    while (view) {
        if ([view.nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)view.nextResponder;
        } else {
            view = view.superview;
        }
    }
    return nil;
}

@end
