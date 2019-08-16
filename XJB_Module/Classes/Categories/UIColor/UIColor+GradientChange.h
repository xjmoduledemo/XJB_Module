//
//  UIColor+GradientChange.h
//  ALMedicalBeauty
//
//  Created by 黄健桦 on 2019/6/28.
//  Copyright © 2019 XIAONIU. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 渐变方式
 
 - GradientChangeDirectionLevel:              水平渐变
 - GradientChangeDirectionVertical:           竖直渐变
 - GradientChangeDirectionUpwardDiagonalLine: 向下对角线渐变
 - GradientChangeDirectionDownDiagonalLine:   向上对角线渐变
 */
typedef NS_ENUM(NSInteger, GradientChangeDirection) {
    GradientChangeDirectionLevel,
    GradientChangeDirectionVertical,
    GradientChangeDirectionUpwardDiagonalLine,
    GradientChangeDirectionDownDiagonalLine,
};

@interface UIColor (GradientChange)

/**
 创建渐变颜色
 
 @param size       渐变的size
 @param direction  渐变方式
 @param startcolor 开始颜色
 @param endColor   结束颜色
 
 @return 创建的渐变颜色
 */
+ (instancetype)bm_colorGradientChangeWithSize:(CGSize)size
                                     direction:(GradientChangeDirection)direction
                                    startColor:(UIColor *)startcolor
                                      endColor:(UIColor *)endColor;

+ (instancetype)bm_colorGradientChangeWithSize:(CGSize)size
                                     direction:(GradientChangeDirection)direction
                                    startColor:(UIColor *)startcolor
                                      endColor:(UIColor *)endColor offset:(CGFloat)offset;
@end

NS_ASSUME_NONNULL_END
