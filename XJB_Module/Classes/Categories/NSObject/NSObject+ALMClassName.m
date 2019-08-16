//
//  NSObject+ALMClassName.m
//  ALMedicalBeauty
//
//  Created by 黄健桦 on 2019/6/26.
//  Copyright © 2019 XIAONIU. All rights reserved.
//

#import "NSObject+ALMClassName.h"

@implementation NSObject (ALMClassName)

+(NSString *)ALMClassName{
    
    const char *className = class_getName(self);
    
    return [NSString stringWithUTF8String:className];
    
}

@end
