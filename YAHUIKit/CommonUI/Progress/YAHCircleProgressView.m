//
//  YAHCircleProgressView.m
//  YAHUIKit
//
//  Created by wangsw on 2019/3/19.
//  Copyright © 2019 yahua. All rights reserved.
//

#import "YAHCircleProgressView.h"

@interface YAHCircleProgressView ()

@property (nonatomic, assign) CGFloat startAngle;  // 0-M_PI
@property (nonatomic, assign) CGFloat endAngle;  //0-M_PI
@property (nonatomic, strong) UIColor *bgColor; //背景色
@property (nonatomic, strong) UIColor *progressColor; //进度条颜色
@property (nonatomic, assign) CGFloat lineWidth;

@property (nonatomic, strong) CAShapeLayer *progressLayer;

@end

@implementation YAHCircleProgressView

- (instancetype)initWithFrame:(CGRect)frame
                   startAngle:(CGFloat)startAngle
                     endAngle:(CGFloat)endAngle
                      bgColor:(UIColor *)bgColor
                progressColor:(UIColor *)progressColor
                    lineWidth:(CGFloat)lineWidth {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = NO;
        _startAngle = startAngle;
        _endAngle = endAngle;
        _bgColor = bgColor;
        _progressColor = progressColor;
        _lineWidth = lineWidth;
        _duration = 1;
        
        [self initCircleLayer];
    }
    return self;
}

#pragma mark - Private

- (void)initCircleLayer {
    
    CGPoint center = CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)/2);
    CGFloat radius = CGRectGetHeight(self.bounds)/2;
    
    //背景
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:self.startAngle endAngle:self.endAngle clockwise:YES];
    CAShapeLayer *bgLayer = [CAShapeLayer layer];
    bgLayer.frame = self.bounds;
    bgLayer.fillColor = [[UIColor clearColor] CGColor]; //填充色为无色
    bgLayer.strokeColor = [self.bgColor CGColor]; //指定path的渲染颜色
    bgLayer.opacity = 1; //背景颜色的透明度
    bgLayer.lineCap = kCALineCapRound; //指定线的边缘是圆的
    bgLayer.lineWidth = self.lineWidth;
    bgLayer.path = path.CGPath;
    [self.layer addSublayer:bgLayer];
    
    _progressLayer = [CAShapeLayer layer];
    _progressLayer.frame = self.bounds;
    _progressLayer.fillColor = [[UIColor clearColor] CGColor];
    _progressLayer.strokeColor = [self.progressColor CGColor];
    _progressLayer.opacity = 1;
    _progressLayer.lineCap = kCALineCapRound;
    _progressLayer.lineWidth = self.lineWidth;
    _progressLayer.strokeEnd = 1.0;
    [self.layer addSublayer:_progressLayer];
}

- (void)setProgress:(CGFloat)progress {
    
    if (progress > 1) {
        progress = 1;
    }
    if (progress < 0) {
        progress = 0;
    }
    _progress = progress;
    CGPoint  center = CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)/2);
    CGFloat radius = CGRectGetHeight(self.bounds)/2;
    CGFloat startA = self.startAngle;
    CGFloat endA = self.startAngle + (self.endAngle - self.startAngle) * _progress;// 设置进度条终点位置
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    _progressLayer.path = path.CGPath;
    
    if (_duration > 0) {
        [_progressLayer removeAnimationForKey:@"animation1"];
        CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        pathAnimation.duration = self.duration;
        pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        pathAnimation.fromValue = [NSNumber numberWithFloat:_reduce?1.0f:0.0f];
        pathAnimation.toValue = [NSNumber numberWithFloat:_reduce?0.0:1.0f];
        pathAnimation.removedOnCompletion = YES;
        [_progressLayer addAnimation:pathAnimation forKey:@"animation1"];
    }
}

- (void)setLineCap:(CAShapeLayerLineCap)lineCap {
    
    self.progressLayer.lineCap = lineCap;
}

@end
