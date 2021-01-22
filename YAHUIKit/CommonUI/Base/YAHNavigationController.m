//
//  YAHNavigationController.m
//  YAHUIKit
//
//  Created by wangshiwen on 2018/12/2.
//  Copyright © 2018 yahua. All rights reserved.
//

#import "YAHNavigationController.h"

@interface YAHNavigationController ()

@end

@implementation YAHNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count>=1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    if (viewController == self.topViewController) { //防止重复添加
        return;
    }
    [super pushViewController:viewController animated:animated];
    
}

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated {
    
    if (viewControllers.count>1) {
        viewControllers.lastObject.hidesBottomBarWhenPushed = YES;
    }
    [super setViewControllers:viewControllers animated:YES];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    
    if (self.viewControllers.count == 2) {
        self.viewControllers.firstObject.hidesBottomBarWhenPushed = NO;
    }
    return [super popViewControllerAnimated:animated];
}

- (nullable NSArray<__kindof UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    NSArray *list = [super popToViewController:viewController animated:animated];
    if (self.viewControllers.count == 1) {
        self.viewControllers.firstObject.hidesBottomBarWhenPushed = NO;
    }
    return list;
}

- (nullable NSArray<__kindof UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated {
    
    self.viewControllers.firstObject.hidesBottomBarWhenPushed = NO;
    return [super popToRootViewControllerAnimated:animated];
}

@end
