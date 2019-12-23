//
//  UIViewController+YAHCommon.m
//  CySmart
//
//  Created by yahua on 2019/11/14.
//  Copyright © 2019 Cypress Semiconductor. All rights reserved.
//

#import "UIViewController+YAHCommon.h"


@implementation UIViewController (YAHCommon)

+ (UIViewController *)yah_topViewController {
    return [self yah_topViewControllerWithRootViewController:[UIApplication sharedApplication]
                                                                 .keyWindow.rootViewController];
}

+ (UIViewController *)yah_topViewControllerWithRootViewController:
        (UIViewController *)rootViewController {
    
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        return [self
                yah_topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController;
        return [self
                yah_topViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController *presentedViewController = rootViewController.presentedViewController;
        return [self yah_topViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootViewController;
    }
}

@end
