//
//  NSString+VaildExpress.h
//  KKZone
//
//  Created by  CarlsonLee on 2018/9/18.
//  Copyright © 2018年 YANJING. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, VAILD_STR_TYPE){
    VAILD_STR_PHONE,//手机号
    VAILD_STR_PHONE_YM,//医美
    VAILD_STR_MAIL,//邮箱
    VAILD_STR_PASSWORD,//密码
    VAILD_STR_USERNAME,//用户名
    VAILD_STR_CODE,//验证码
    VAILD_STR_CHINESE,//中文
    VAILD_STR_LETTERORNUM,//字母或数字
    VAILD_STR_CONTAIN_NUM,//包含数字
    VAILD_STR_IDCARD,//身份证号
    VAILD_STR_BANKCARD,//银行卡号
};

@interface NSString (VaildExpress)

- (BOOL)vaildStrType:(VAILD_STR_TYPE)type;


@end
