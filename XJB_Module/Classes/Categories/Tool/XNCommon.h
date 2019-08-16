//
//  XNCommon.h
//  KKZone
//
//  Created by  CarlsonLee on 2018/9/17.
//  Copyright © 2018年 YANJING. All rights reserved.
// 通用类

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, FONT_TYPE){
    FONT_TYPE_REGULAR, //常规
    FONT_TYPE_MEDIUM,//粗体
    FONT_TYPE_SEMIBOLD,
    FONT_TYPE_LIGHT, //细体
    FONT_TYPE_DISPLAY,
    FONT_TYPE_DIN,   //DIN
    FONT_TYPE_DIN_CON,//DIN-Con
    FONT_TYPE_LED   //LED
};
extern CGSize XNFS(CGFloat size, FONT_TYPE tp);
//字体大小
extern UIFont* XNFont(CGFloat size, FONT_TYPE tp);
//字体size
extern CGSize XNSize(NSString* str, UIFont* font, CGSize size);

id XN_BNEW_LABEL(UIColor* _bg_color_, UIColor* _text_color_, UIFont* _font_, NSTextAlignment _type_, NSInteger _lines_, id _superView_);

@interface XNCommon : NSObject


@end
