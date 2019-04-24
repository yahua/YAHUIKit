//
//  YAHCircleProgressView.h
//  YAHUIKit
//
//  Created by wangsw on 2019/3/19.
//  Copyright © 2019 yahua. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YAHCircleProgressView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                   startAngle:(CGFloat)startAngle
                     endAngle:(CGFloat)endAngle
                      bgColor:(UIColor *)bgColor
                progressColor:(UIColor *)progressColor
                    lineWidth:(CGFloat)lineWidth;

@property (nonatomic, assign) BOOL reduce; //递减动画
@property (nonatomic, assign) CGFloat duration;  //动画时间  default 1
@property (nonatomic, assign) CGFloat progress;  //0-1

@end

NS_ASSUME_NONNULL_END
