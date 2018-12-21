//
//  YYInterfanceService.h
//  YYKitDemo
//
//  Created by qsm on 2018/12/17.
//  Copyright © 2018年 ibireme. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSDBaseService.h"

NS_ASSUME_NONNULL_BEGIN

@interface YYInterfanceService : RSDBaseService

+ (instancetype)sharedInstance;

///  测试YY网络优化
- (void)analyticalHomeData_3102:(RSDBaseRequest *)request serverSuccessResultHandler:(ServerResultSuccessHandler )succHandler failedResultHandler:(ServerResultFailedHandler)failedHandler requestErrorHandler:(RequestFailedBlock)requestError;

@end

NS_ASSUME_NONNULL_END
