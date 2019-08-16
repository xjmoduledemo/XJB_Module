//
//  NSObject+ALMClassName.h
//  ALMedicalBeauty
//
//  Created by 黄健桦 on 2019/6/26.
//  Copyright © 2019 XIAONIU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ALMClassName)

+(NSString *)ALMClassName;

@end

NS_ASSUME_NONNULL_END
