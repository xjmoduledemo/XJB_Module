//
//  UIImage+RenderedImage.h
//  ZJOL
//
//  Created by Peter Jin (https://github.com/JxbSir) on  15/1/6.
//  Copyright (c) 2015年 PeterJin.   Email:i@jxb.name      All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Render)

///纯色
+ (UIImage *)imageWithRenderColor:(UIColor *)color renderSize:(CGSize)size;

///渐变色
+ (UIImage *)imageGradientRenderWithColors:(NSArray *)colors renderSize:(CGSize)size;

+ (UIImage *)imageWithOriginalImage:(UIImage *)image quality:(CGFloat)quality;

///箭头
+ (UIImage* )arrowImgWithColor:(UIColor* )color;

+ (UIImage* )pageControlDotImgage;
+ (UIImage* )currentPageControlDotImage;

- (UIImage*)rotate:(UIImageOrientation)orient;

//以最大宽高裁剪
+ (UIImage *)clipImage:(UIImage *)image withMaxwh:(CGFloat)wh;

+ (UIImage *)normalizedImage:(UIImage *)image;

@end
