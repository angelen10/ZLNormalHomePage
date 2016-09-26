//
//  ZLCategory.h
//  ZLNormalHomePage
//
//  Created by angelen on 16/9/26.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZLVideoInfo.h"

@interface ZLCategory : NSObject

/** id */
@property (assign, nonatomic) NSInteger id;

/** name */
@property (strong, nonatomic) NSString *name;

/** alias */
@property (strong, nonatomic) NSString *alias;

/** view */
@property (assign, nonatomic) NSInteger view;

/** videoInfoList */
@property (strong, nonatomic) NSArray<ZLVideoInfo *> *videoInfoList;

@end
