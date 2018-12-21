//
//  YYInterfanceService.m
//  YYKitDemo
//
//  Created by qsm on 2018/12/17.
//  Copyright © 2018年 ibireme. All rights reserved.
//

#import "YYInterfanceService.h"
//#define kBaseUrl @"http://47.95.28.159/api/v3/"
#define kBaseUrl @"http://pro31.sevendoor.cn/api/v3/"

// kBaseUrl
@implementation YYInterfanceService
static id sharedInstance = nil;
+ (id)sharedInstance
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

///  楼盘列表-3365(全部)
- (void)analyticalHomeData_3102:(RSDBaseRequest *)request serverSuccessResultHandler:(ServerResultSuccessHandler )succHandler failedResultHandler:(ServerResultFailedHandler)failedHandler requestErrorHandler:(RequestFailedBlock)requestError
{
    
    NSString *urlStr = @""kBaseUrl"3102/ios";
    [self doServerRequestWithModel:request ResponseName:@"RSDHomeListResponse" Url:urlStr requestType:HttpRequestTypePost serverSuccessResultHandler:succHandler failedResultHandler:failedHandler requestErrorHandler:requestError];
}
@end
