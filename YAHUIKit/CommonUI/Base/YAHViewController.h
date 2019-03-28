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

//根据标题生成导航条右边按钮
- (UIButton *)setupRightButtonWithTitle:(NSString *)title;
//根据图片生成导航条右边按钮
- (UIButton *)setupRightButtonWithImage:(UIImage *)image;

#pragma mark - OverWrite

- (void)viewFirstWillAppear;

- (void)viewFirstDidAppear;

//加载数据
- (void)loadData;

//创建subview
- (void)setupViews;

//对subview进行布局
- (void)setupConstraints;

//用户点击了导航条右边的按钮
- (void)clickRightButton;

@end

NS_ASSUME_NONNULL_END
