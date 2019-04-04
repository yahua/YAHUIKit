//
//  YAHViewController.h
//  YAHUIKit
//
//  Created by wangshiwen on 2018/12/2.
//  Copyright © 2018 yahua. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YAHViewController : UIViewController

#pragma mark - OverWrite

- (void)viewFirstWillAppear;

- (void)viewFirstDidAppear;

//加载数据
- (void)loadData;

//创建subview
- (void)setupViews;

//对subview进行布局
- (void)setupConstraints;

@end

NS_ASSUME_NONNULL_END
