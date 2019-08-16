//
//  NSString+OSSEdit.h
//  ALMedicalBeauty
//
//  Created by  CarlsonLee on 2019/7/27.
//  Copyright © 2019 XIAONIU. All rights reserved.
//  oss图片处理

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (OSSEdit)

/*
 固定宽高，自动缩放裁剪
 详情参考https://help.aliyun.com/document_detail/44688.html
 */
- (NSString *)oss_fillW:(CGFloat)w h:(CGFloat)h;

/*缩放裁剪同上
 圆角
*/
- (NSString *)oss_fillW:(CGFloat)w h:(CGFloat)h r:(CGFloat)r;

/*
 缩放宽，高按比例
 */
- (NSString *)oss_scaleW:(CGFloat)w;

/*
 切圆角
 */
- (NSString *)oss_roundR:(CGFloat)r;

/*
 *慎用
 居中按给定的宽高裁剪
 圆角
 */
- (NSString *)oss_cropW:(CGFloat)w h:(CGFloat)h r:(CGFloat)r;


@end

NS_ASSUME_NONNULL_END
