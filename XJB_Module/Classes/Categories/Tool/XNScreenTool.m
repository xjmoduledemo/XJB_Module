//
//  XNScreenTool.m
//  CHBManager
//
//  Created by  CarlsonLee on 2018/11/19.
//  Copyright © 2018年 YANJING. All rights reserved.
//

#import "XNScreenTool.h"
#import "SystemMacro.h"

@implementation XNScreenTool

+ (CGFloat)v_getNavbarHeight{
    if (IS_IPHONEX) {
        return 88;
    }
    return 64;
}

+ (CGFloat)v_getTabBarHeight {
    if (IS_IPHONEX) {
        return 49 + 34;
    }
    return 49;
}

+ (CGFloat)v_getNavbarStateHeight {
    if (IS_IPHONEX) {
        return 44;
    }
    return 20;
}

+ (CGFloat)v_getBottomSpace {
    if (IS_IPHONEX) {
        return 34;
    }
    return 0;
}

+ (CGFloat)v_getNavbarSpaceHeight {
    return 44;
}

@end
