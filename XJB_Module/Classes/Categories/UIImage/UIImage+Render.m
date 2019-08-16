//
//  UIImage+RenderedImage.m
//  ZJOL
//
//  Created by Peter Jin (https://github.com/JxbSir) on  15/1/6.
//  Copyright (c) 2015年 PeterJin.   Email:i@jxb.name      All rights reserved.
//

#import "UIImage+Render.h"
#import "SystemMacro.h"

@implementation UIImage (Render)

+ (UIImage *)imageWithRenderColor:(UIColor *)color renderSize:(CGSize)size
{
    return [UIImage imageWithRenderColor:color renderSize:size layerPath:nil];
}

+ (UIImage *)imageWithRenderColor:(UIColor *)color renderSize:(CGSize)size layerPath:(CGPathRef )path
{
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    if(path){
        CGContextMoveToPoint(context, size.width/2, size.height/2);
        CGContextAddPath(context, path);
        CGContextFillPath(context);
    }else{
        CGContextFillRect(context, rect);
    }
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)imageGradientRenderWithColors:(NSArray *)colors renderSize:(CGSize)size
{
    UIImage *image = nil;
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    
    CGPathRef path = CGPathCreateWithRect(CGRectMake(0, 0, size.width, size.height), NULL);
    CGRect pathRect = CGPathGetBoundingBox(path);
    
    CGPoint startPoint = CGPointMake(CGRectGetMinX(pathRect), CGRectGetMidY(pathRect));
    CGPoint endPoint = CGPointMake(CGRectGetMaxX(pathRect), CGRectGetMidY(pathRect));
    
    CGContextSaveGState(context);
    CGContextAddPath(context, path);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


#pragma mark - 压缩图片
/**  压缩图片*/
+ (UIImage *)imageWithOriginalImage:(UIImage *)image{
    // 宽高比
    CGFloat ratio = image.size.width/image.size.height;
    // 目标大小
    CGFloat targetW = 1280;
    CGFloat targetH = 1280;
    
    // 宽高均 <= 1280，图片尺寸大小保持不变
    if (image.size.width<1280 && image.size.height<1280) {
        return image;
    }
    // 宽高均 > 1280 && 宽高比 > 2，
    else if (image.size.width>1280 && image.size.height>1280){
        
        // 宽大于高 取较小值(高)等于1280，较大值等比例压缩
        if (ratio>1) {
            targetH = 1280;
            targetW = targetH * ratio;
        }
        // 高大于宽 取较小值(宽)等于1280，较大值等比例压缩 (宽高比在0.5到2之间 )
        else{
            targetW = 1280;
            targetH = targetW / ratio;
        }
        
    }else{// 宽或高 > 1280
            // 宽图 图片尺寸大小保持不变
        if (ratio>2) {
            targetW = image.size.width;
            targetH = image.size.height;
        }
            // 长图 图片尺寸大小保持不变
        else if (ratio<0.5){
            targetW = image.size.width;
            targetH = image.size.height;
        }
            // 宽大于高 取较大值(宽)等于1280，较小值等比例压缩
        else if (ratio>1){
            targetW = 1280;
            targetH = targetW / ratio;
        }
            // 高大于宽 取较大值(高)等于1280，较小值等比例压缩
        else{
            targetH = 1280;
            targetW = targetH * ratio;
        }
    }
        // 注：这些方法是NSUtil这个工具类里的
    image = [self imageCompressWithImage:image targetHeight:targetH targetWidth:targetW];
    return image;
}

/**  重绘*/
+ (UIImage *)imageCompressWithImage:(UIImage *)sourceImage targetHeight:(CGFloat)targetHeight targetWidth:(CGFloat)targetWidth
{
        //    CGFloat targetHeight = (targetWidth / sourceImage.size.width) * sourceImage.size.height;
    UIGraphicsBeginImageContext(CGSizeMake(targetWidth, targetHeight));
    [sourceImage drawInRect:CGRectMake(0,0,targetWidth, targetHeight)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

/**  压缩图片 压缩质量 0 -- 1*/
+ (UIImage *)imageWithOriginalImage:(UIImage *)image quality:(CGFloat)quality{
    
    UIImage *newImage = [self imageWithOriginalImage:image];
    NSData *imageData = UIImageJPEGRepresentation(newImage, quality);
    return [UIImage imageWithData:imageData];
}

+ (UIImage* )arrowImgWithColor:(UIColor* )color
{
    if(!color)color=ColorFromRGB(0x303030);
    return [self drawBackImageWithSize:CGSizeMake(50*kScaleX, 18*kScaleX) withColor:color];
}

+ (UIImage* )drawBackImageWithSize:(CGSize )sz withColor:(UIColor* )color
{
    UIGraphicsBeginImageContextWithOptions(sz, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 2.0);
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    CGContextSetStrokeColorWithColor(ctx, color.CGColor);
    CGFloat f_x = sz.width/2-10*kScaleX;
    CGContextMoveToPoint(ctx, f_x, 0);
    CGContextAddLineToPoint(ctx, f_x-tanf(M_PI/180*45)*sz.height/2, sz.height/2);
    CGContextAddLineToPoint(ctx, f_x, sz.height);
    CGContextStrokePath(ctx);
    
    UIImage* img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (UIImage* )pageControlDotImgage
{
    CGRect rect = CGRectMake(0, 0, 8*kScaleX, 4*kScaleX);
    CGRect lrect = CGRectMake(2*kScaleX, 0, 4*kScaleX, 4*kScaleX);
    UIBezierPath* bezier = [UIBezierPath bezierPathWithRoundedRect:lrect cornerRadius:2*kScaleX];
    return [UIImage imageWithRenderColor:ColorFromRGB(0xf0f0f0) renderSize:rect.size layerPath:bezier.CGPath];
}

+ (UIImage* )currentPageControlDotImage
{
    CGRect rect = CGRectMake(0, 0, 8*kScaleX, 4*kScaleX);
    UIBezierPath* bezier = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:2*kScaleX];
    return [UIImage imageWithRenderColor:ColorFromRGB(0xffffff) renderSize:rect.size layerPath:bezier.CGPath];
}

- (UIImage*)rotate:(UIImageOrientation)orient
{
    CGRect bnds = CGRectZero;
    UIImage *copy = nil;
    CGContextRef ctxt = nil;
    CGImageRef imag = self.CGImage;
    CGRect rect = CGRectZero;
    CGAffineTransform tran = CGAffineTransformIdentity;
    
    rect.size.width = CGImageGetWidth(imag);
    rect.size.height = CGImageGetHeight(imag);
    
    bnds = rect;
    
    switch(orient) {
        case UIImageOrientationUp:
            return self;
            
        case UIImageOrientationUpMirrored:
            tran = CGAffineTransformMakeTranslation(rect.size.width, 0.0);
            tran = CGAffineTransformScale(tran, -1.0, 1.0);
            break;
            
        case UIImageOrientationDown:
            tran = CGAffineTransformMakeTranslation(rect.size.width,
                                                    rect.size.height);
            tran = CGAffineTransformRotate(tran, M_PI);
            break;
            
        case UIImageOrientationDownMirrored:
            tran = CGAffineTransformMakeTranslation(0.0, rect.size.height);
            tran = CGAffineTransformScale(tran, 1.0, -1.0);
            break;
            
        case UIImageOrientationLeft:
            bnds = swapWidthAndHeight(bnds);
            tran = CGAffineTransformMakeTranslation(0.0, rect.size.width);
            tran = CGAffineTransformRotate(tran, 3.0 * M_PI / 2.0);
            break;
            
        case UIImageOrientationLeftMirrored:
            bnds = swapWidthAndHeight(bnds);
            tran = CGAffineTransformMakeTranslation(rect.size.height,
                                                    rect.size.width);
            tran = CGAffineTransformScale(tran, -1.0, 1.0);
            tran = CGAffineTransformRotate(tran, 3.0 * M_PI / 2.0);
            break;
            
        case UIImageOrientationRight:
            bnds = swapWidthAndHeight(bnds);
            tran = CGAffineTransformMakeTranslation(rect.size.height, 0.0);
            tran = CGAffineTransformRotate(tran, M_PI / 2.0);
            break;
            
        case UIImageOrientationRightMirrored:
            bnds = swapWidthAndHeight(bnds);
            tran = CGAffineTransformMakeScale(-1.0, 1.0);
            tran = CGAffineTransformRotate(tran, M_PI / 2.0);
            break;
            
        default:
            return self;
    }
    
    UIGraphicsBeginImageContext(bnds.size);
    ctxt = UIGraphicsGetCurrentContext();
    
    switch(orient) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            CGContextScaleCTM(ctxt, -1.0, 1.0);
            CGContextTranslateCTM(ctxt, -rect.size.height, 0.0);
            break;
            
        default:
            CGContextScaleCTM(ctxt, 1.0, -1.0);
            CGContextTranslateCTM(ctxt, 0.0, -rect.size.height);
            break;
    }
    
    CGContextConcatCTM(ctxt, tran);
    CGContextDrawImage(UIGraphicsGetCurrentContext(), rect, imag);
    
    copy = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return copy;
}

static CGRect swapWidthAndHeight(CGRect rect) {
    CGFloat swap = rect.size.width;
    
    rect.size.width = rect.size.height;
    rect.size.height = swap;
    
    return rect;
}

+ (UIImage *)clipImage:(UIImage *)image withMaxwh:(CGFloat)wh
{
    CGFloat scale = image.size.width/image.size.height;
    if(scale>1){
        return [self imageCompressWithImage:image targetHeight:wh/scale targetWidth:wh];
    }else{
        return [self imageCompressWithImage:image targetHeight:wh targetWidth:wh*scale];
    }
}

#pragma mark----解决图片自动旋转问题
+ (UIImage *)normalizedImage:(UIImage *)image{
    if (image.imageOrientation == UIImageOrientationUp){
        return image;
    }
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
    [image drawInRect:(CGRect){0, 0, image.size}];
    UIImage *normalizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return normalizedImage;
}

@end
