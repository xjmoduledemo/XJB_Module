//
//  NSString+VaildExpress.m
//  KKZone
//
//  Created by  CarlsonLee on 2018/9/18.
//  Copyright © 2018年 YANJING. All rights reserved.
//

#import "NSString+VaildExpress.h"

//手机号码验证13开头
#define kVaildationPhone @"^1\\d{10}$"
//验证医美
#define kVaildationYMPhone @"^(133|149|153|173|177|180|181|189|199|130|131|132|145|155|156|166|171|175|176|185|186|166|134|135|136|137|138|139|147|150|151|152|157|158|159|172|178|182|183|184|187|188|198)\\d{8}$"
//邮箱验证
#define kVaildationMail @"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$"
//密码验证
#define kVaildationPassword @"^(?![^a-zA-Z]+$)(?!\\D+$).{6,20}$"
//验证码纯数字4位
#define kVaildationPhoneCode @"^\\d{4}"
//用户名验证（包含数字加字母）
#define kVaildationUserName @"^[a-zA-Z0-9\u4e00-\u9fa5]+$"
//中文验证
#define kVaildationChinese @"^[\u4E00-\u9FA5]*$"
//验证字母和数字
#define kVaildationLetterOrNumber @"^[a-zA-Z0-9]{0,}$"
//包含数字
#define kVaildationContainNumber @"^(.*)[0-9]+(.*)$"
//身份证验证
#define kVaildationIDCard @"^(\\d{14}|\\d{17})(\\d|[xX])$"
//银行卡验证
#define kVaildationBankCard @"^\\d{16,19}"
@implementation NSString (VaildExpress)

- (BOOL)vaildStrType:(VAILD_STR_TYPE)type
{
    return [self vaildExpression:[self expressionByVaildType:type]];
}

- (BOOL)vaildExpression:(NSString* )expression
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",expression];
    return [predicate evaluateWithObject:self];
}

- (NSString* )expressionByVaildType:(VAILD_STR_TYPE)type
{
    NSString* str;
    switch (type) {
        case VAILD_STR_PHONE:{
            str = kVaildationPhone;
        }
            break;
        case VAILD_STR_PHONE_YM:{
            str = kVaildationYMPhone;
        }
            break;
        case VAILD_STR_MAIL:{
            str = kVaildationMail;
        }
            break;
        case VAILD_STR_PASSWORD:{
            str = kVaildationPassword;
        }
            break;
        case VAILD_STR_USERNAME:{
            str = kVaildationUserName;
        }
            break;
        case VAILD_STR_CODE:{
            str = kVaildationPhoneCode;
        }
            break;
        case VAILD_STR_CHINESE:{
            str = kVaildationChinese;
        }
            break;
        case VAILD_STR_LETTERORNUM:{
            str = kVaildationLetterOrNumber;
        }
            break;
        case VAILD_STR_CONTAIN_NUM:{
            str = kVaildationContainNumber;
        }
            break;
        case VAILD_STR_IDCARD:{
            str = kVaildationIDCard;
        }
            break;
        case VAILD_STR_BANKCARD:{
            str = kVaildationBankCard;
        }
            break;
        default:
            break;
    }
    return str;
}

@end
