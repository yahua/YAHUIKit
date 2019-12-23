//
//  UIViewController+YAHCommon.h
//  CySmart
//
//  Created by yahua on 2019/11/14.
//  Copyright © 2019 Cypress Semiconductor. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (YAHCommon)

//获取最顶部控制器
+ (UIViewController *)yah_topViewController;

@end

NS_ASSUME_NONNULL_END
