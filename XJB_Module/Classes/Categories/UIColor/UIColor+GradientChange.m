//
//  UIColor+GradientChange.m
//  ALMedicalBeauty
//
//  Created by 黄健桦 on 2019/6/28.
//  Copyright © 2019 XIAONIU. All rights reserved.
//

#import "UIColor+GradientChange.h"

@implementation UIColor (GradientChange)

+ (instancetype)bm_colorGradientChangeWithSize:(CGSize)size
                                     direction:(GradientChangeDirection)direction
                                    startColor:(UIColor *)startcolor
                                      endColor:(UIColor *)endColor {
    return [self bm_colorGradientChangeWithSize:size direction:direction startColor:startcolor endColor:endColor offset:0];
}

+ (instancetype)bm_colorGradientChangeWithSize:(CGSize)size
                                     direction:(GradientChangeDirection)direction
                                    startColor:(UIColor *)startcolor
                                      endColor:(UIColor *)endColor offset:(CGFloat)offset{
    
    if (CGSizeEqualToSize(size, CGSizeZero) || !startcolor || !endColor) {
        return nil;
    }
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, size.width, size.height);
    
    CGPoint startPoint = CGPointZero;
    if(offset){
        startPoint = CGPointMake(0, offset/size.height);
    }
    if (direction == GradientChangeDirectionDownDiagonalLine) {
        startPoint = CGPointMake(0.0, 1.0);
    }
    gradientLayer.startPoint = startPoint;
    
    CGPoint endPoint = CGPointZero;
    switch (direction) {
        case GradientChangeDirectionLevel:
            endPoint = CGPointMake(1.0, 0.0);
            break;
        case GradientChangeDirectionVertical:
            endPoint = CGPointMake(0.0, 1.0);
            break;
        case GradientChangeDirectionUpwardDiagonalLine:
            endPoint = CGPointMake(1.0, 1.0);
            break;
        case GradientChangeDirectionDownDiagonalLine:
            endPoint = CGPointMake(1.0, 0.0);
            break;
        default:
            break;
    }
    gradientLayer.endPoint = endPoint;
    
    gradientLayer.colors = @[(__bridge id)startcolor.CGColor, (__bridge id)endColor.CGColor];
    UIGraphicsBeginImageContext(size);
    [gradientLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [UIColor colorWithPatternImage:image];
}

@end
