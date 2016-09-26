//
//  ZLCategory.m
//  ZLNormalHomePage
//
//  Created by angelen on 16/9/26.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

#import "ZLCategory.h"

@implementation ZLCategory

// 如果 Model 中含有数组，要在这里指定数组的类型
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"videoInfoList": [ZLVideoInfo class]};
}

@end
