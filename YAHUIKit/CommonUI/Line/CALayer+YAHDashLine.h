//
//  CALayer+DashLine.h
//  MBProgressHUD
//
//  Created by wangsw on 2019/3/19.
//  虚线

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (YAHDashLine)

/**
 * 生成虚线的方法，注意返回的是 CAShapeLayer
 * @param lineLength   每一段的线宽
 * @param lineSpacing  线之间的间隔
 * @param lineWidth    线的宽度
 * @param lineColor    线的颜色
 * @param isHorizontal 是否横向，因为画虚线的缘故，需要指定横向或纵向，横向是 YES，纵向是 NO。
 * 注意：暂不支持 dashPhase 和 dashPattens 数组设置，因为这些都定制性太强，如果用到则自己调用系统方法即可。
 */

+ (CAShapeLayer *)YAHUI_seperatorDashLayerWithLineLength:(NSInteger)lineLength
                                             lineSpacing:(NSInteger)lineSpacing
                                               lineWidth:(CGFloat)lineWidth
                                               lineColor:(CGColorRef)lineColor
                                            isHorizontal:(BOOL)isHorizontal;

@end

NS_ASSUME_NONNULL_END
