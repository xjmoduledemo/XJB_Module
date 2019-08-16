//
//  XNCommon.m
//  KKZone
//
//  Created by  CarlsonLee on 2018/9/17.
//  Copyright © 2018年 YANJING. All rights reserved.
//

#import "XNCommon.h"
#import "SystemMacro.h"

@implementation XNCommon

/**
 *
 */
NSString* fontName(FONT_TYPE tp){
    switch (tp) {
        case FONT_TYPE_REGULAR:{
            return @"PingFangSC-Regular";
        }
            break;
        case FONT_TYPE_MEDIUM:{
            return @"PingFangSC-Medium";
        }
            break;
        case FONT_TYPE_SEMIBOLD:{
            return @"PingFangSC-Semibold";
        }
            break;
        case FONT_TYPE_LIGHT:{
            return @"PingFangSC-Light";
        }
            break;
        case FONT_TYPE_DISPLAY:{
            return @".SFNSDisplay";
        }
            break;
        case FONT_TYPE_DIN:{
            return @"DIN-Regular";
        }
            break;
        case FONT_TYPE_DIN_CON:{
            return @"DINCondensedC";
        }
            break;
        case FONT_TYPE_LED:{
            return @"UnidreamLED";
        }
            break;
        default:
            break;
    }
}


/**
 *
 */
UIFont* XNFont(CGFloat size, FONT_TYPE tp){
    UIFont* font = [UIFont fontWithName:fontName(tp) size:size*kScaleX];
    if(!font){
        font = [UIFont systemFontOfSize:size*kScaleX];
    }
    return font;
}

/**
 *单个字体的大小
 */
CGSize XNFS(CGFloat size, FONT_TYPE tp)
{
    return [@"管" sizeWithAttributes:@{NSFontAttributeName:XNFont(size, tp)}];
}

/**
 *文字+英文/数字混合计算会有误差
 */
CGSize XNSize(NSString* str, UIFont* font, CGSize size){
    if(![str isKindOfClass:[NSString class]])return CGSizeZero;
    if(!str || !str.length)return CGSizeZero;
    if(!font)return CGSizeZero;
    if(!size.width || !size.height){
        return [str sizeWithAttributes:@{NSFontAttributeName:font}];
    }
    return [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
}

/**
 *  初始化label
 */
id XN_BNEW_LABEL(UIColor* _bg_color_, UIColor* _text_color_, UIFont* _font_, NSTextAlignment _type_, NSInteger _lines_, id _superView_){
    UILabel* _object_name_ = [[UILabel alloc]init];
    [_object_name_ setBackgroundColor:_bg_color_?_bg_color_:[UIColor clearColor]];
    [_object_name_ setTextColor:_text_color_];
    [_object_name_ setFont:_font_];
    [_object_name_ setTextAlignment:_type_];
    [_object_name_ setNumberOfLines:_lines_];
    if(_superView_)[_superView_ addSubview:_object_name_];
    return _object_name_;
}

@end
