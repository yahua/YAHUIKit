//
//  CALayer+DashLine.m
//  MBProgressHUD
//
//  Created by wangsw on 2019/3/19.
//

#import "CALayer+YAHDashLine.h"

@implementation CALayer (YAHDashLine)

+ (CAShapeLayer *)YAHUI_seperatorDashLayerWithLineLength:(NSInteger)lineLength
                                             lineSpacing:(NSInteger)lineSpacing
                                               lineWidth:(CGFloat)lineWidth
                                               lineColor:(CGColorRef)lineColor
                                            isHorizontal:(BOOL)isHorizontal {
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = lineColor;
    layer.lineWidth = lineWidth;
    layer.lineDashPattern = [NSArray arrayWithObjects:[NSNumber numberWithInteger:lineLength], [NSNumber numberWithInteger:lineSpacing], nil];
    layer.masksToBounds = YES;
    
    CGMutablePathRef path = CGPathCreateMutable();
    if (isHorizontal) {
        CGPathMoveToPoint(path, NULL, 0, lineWidth / 2);
        CGPathAddLineToPoint(path, NULL, [UIScreen mainScreen].bounds.size.width, lineWidth / 2);
    } else {
        CGPathMoveToPoint(path, NULL, lineWidth / 2, 0);
        CGPathAddLineToPoint(path, NULL, lineWidth / 2, [UIScreen mainScreen].bounds.size.height);
    }
    layer.path = path;
    CGPathRelease(path);
    
    return layer;
}

@end
