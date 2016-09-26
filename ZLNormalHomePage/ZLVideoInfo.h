//
//  ZLVideoInfo.h
//  ZLNormalHomePage
//
//  Created by angelen on 16/9/26.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZLVideoInfo : NSObject

/** id */
@property (assign, nonatomic) NSInteger id;

/** title */
@property (strong, nonatomic) NSString *title;

/** cover */
@property (strong, nonatomic) NSString *cover;

/** view */
@property (assign, nonatomic) NSInteger view;

/** teacherName */
@property (strong, nonatomic) NSString *teacherName;

/** videoType */
@property (strong, nonatomic) NSString *videoType;

/** recommended */
@property (assign, nonatomic) NSInteger recommended;

/** collected */
@property (assign, nonatomic) NSInteger collected;

/** videoCount */
@property (assign, nonatomic) NSInteger videoCount;

/** commentCount */
@property (assign, nonatomic) NSInteger commentCount;

/** collectionCount */
@property (assign, nonatomic) NSInteger collectionCount;


@end
