//
//  NSString+OSSEdit.m
//  ALMedicalBeauty
//
//  Created by  CarlsonLee on 2019/7/27.
//  Copyright © 2019 XIAONIU. All rights reserved.
//

#import "NSString+OSSEdit.h"

@implementation NSString (OSSEdit)

- (NSString *)oss_fillW:(CGFloat)w h:(CGFloat)h
{
    return [self oss_fillW:w h:h r:0];
}

- (NSString *)oss_fillW:(CGFloat)w h:(CGFloat)h r:(CGFloat)r
{
    if(self.length && [self hasPrefix:@"http"]){
        if(r){
            return [self stringByAppendingFormat:@"%@x-oss-process=image/resize,m_fill,w_%.f,h_%.f,limit_0/rounded-corners,r_%.f/format,png", [self containsString:@"?"]?@"&":@"?", w*[UIScreen mainScreen].scale, h*[UIScreen mainScreen].scale, r*[UIScreen mainScreen].scale];
        }else{
            return [self stringByAppendingFormat:@"%@x-oss-process=image/resize,m_fill,w_%.f,h_%.f,limit_0", [self containsString:@"?"]?@"&":@"?", w*[UIScreen mainScreen].scale, h*[UIScreen mainScreen].scale];
        }
    }
    return self;
}

- (NSString *)oss_scaleW:(CGFloat)w
{
    if(self.length && [self hasPrefix:@"http"]){
        return [self stringByAppendingFormat:@"%@x-oss-process=image/resize,w_%.f,limit_0", [self containsString:@"?"]?@"&":@"?", w*[UIScreen mainScreen].scale];
    }
    return self;
}

- (NSString *)oss_roundR:(CGFloat)r
{
    if(self.length && [self hasPrefix:@"http"]){
        return [self stringByAppendingFormat:@"%@x-oss-process=image/rounded-corners,r_%.f", [self containsString:@"?"]?@"&":@"?", r*[UIScreen mainScreen].scale];
    }
    return self;
}

- (NSString *)oss_cropW:(CGFloat)w h:(CGFloat)h r:(CGFloat)r
{
    if(self.length && [self hasPrefix:@"http"]){
        return [self stringByAppendingFormat:@"%@x-oss-process=image/crop,w_%.f,h_%.f,g_center/rounded-corners,r_%.f/format,png", [self containsString:@"?"]?@"&":@"?", w*[UIScreen mainScreen].scale,h*[UIScreen mainScreen].scale, r*[UIScreen mainScreen].scale];
    }
    return self;
}

@end
