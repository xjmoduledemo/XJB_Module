
//
//  SystemMacro.h
//  KKZone
//
//  Created by  CarlsonLee on 2018/9/17.
//  Copyright © 2018年 YANJING. All rights reserved.
// 通用的一些系统配置

#ifndef SystemMacro_h
#define SystemMacro_h

#pragma mark - #系统配置

#define WEAK_SELF __weak typeof(self) wSelf = self;
#define kScreen  [UIScreen mainScreen].bounds.size
#define kBounds  self.bounds.size
#define kScaleX   kScreen.width/375
#define kSCreenScale  [UIScreen mainScreen].scale

//画 .5 像素的线
#define SINGLE_LINE_WIDTH           (1 / [UIScreen mainScreen].scale)

//适配iOS11--contentInsetAdjustmentBehavior
#define AdjustsScrollViewInsetNever(controller,view) if(@available(iOS 11.0, *)) {view.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;} else if([controller isKindOfClass:[UIViewController class]]) {controller.automaticallyAdjustsScrollViewInsets = false;}

///状态栏、导航栏
#define STATUS_BAR_HEIGHT CGRectGetHeight([UIApplication sharedApplication].statusBarFrame)
#define NAV_HEIGHT CGRectGetHeight(self.navigationController.navigationBar.frame)
#define TAB_HEIGHT CGRectGetHeight(self.tabBarController.tabBar.frame)

//判断刘海屏
#define IS_IPHONEX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

///系统版本
#define IPHONE_VERSION(x) ([[UIDevice currentDevice] systemVersion].floatValue >= x)
///广播
#define XN_NOTIFICATION_CENTER [NSNotificationCenter defaultCenter]
///userDefaults
#define XN_USERDEFAULTS [NSUserDefaults standardUserDefaults]
///url
#define XN_URL(_str_) [NSURL URLWithString:_str_]
///图片
#define XN_IMG(_name_) [UIImage imageNamed:_name_]
///加载Bundle图片
#define XN_RIMG(_name_) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:_name_ ofType:nil]]
///error init
#define XN_ERROR(error_reason, error_code) [NSError errorWithDomain:error_reason code:error_code userInfo:nil]

//oss图片处理

#pragma mark -快速构建

///颜色
#define ColorFromRGB(_rgbValue_) [UIColor \
colorWithRed:((float)((_rgbValue_ & 0xFF0000) >> 16))/255.0 \
green:((float)((_rgbValue_ & 0xFF00) >> 8))/255.0 \
blue:((float)(_rgbValue_ & 0xFF))/255.0 alpha:1.0]

#define ColorFromRGBA(_rgbValue_, _alpha_) [UIColor \
colorWithRed:((float)((_rgbValue_ & 0xFF0000) >> 16))/255.0 \
green:((float)((_rgbValue_ & 0xFF00) >> 8))/255.0 \
blue:((float)(_rgbValue_ & 0xFF))/255.0 alpha:_alpha_]

//字符串是否为空
#define IsNullOrEmptyOfNSString(string) ((![string isKindOfClass:[NSString class]])||[string isEqualToString:@""] || (string == nil) || [string isEqualToString:@"<null>"]|| [string isEqualToString:@"(null)"]|| [string isEqualToString:@"null"]|| [string isEqualToString:@"nil"] || [string isKindOfClass:[NSNull class]]||[[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0)

#endif /* SystemMacro_h */

#ifdef DEBUG
#if TARGET_IPHONE_SIMULATOR
#define XNLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define XNLog(...) printf("%s 第%d行 \n %s\n\n",__func__,__LINE__,[[NSString stringWithFormat:__VA_ARGS__]UTF8String])
#endif
#else
#define XNLog(...)

#endif
