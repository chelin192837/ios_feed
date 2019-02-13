//
//  YYExposure.h
//  YYKitDemo
//
//  Created by qsm on 2019/1/17.
//  Copyright © 2019年 ibireme. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSDBaseRequest.h"
NS_ASSUME_NONNULL_BEGIN

@interface YYExposure : RSDBaseRequest

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *house_id;
@property (nonatomic, strong) NSString *count;
@property (nonatomic, strong) NSString *create_time;
//是否改变
@property (nonatomic, assign) BOOL kflag;

@end

NS_ASSUME_NONNULL_END
