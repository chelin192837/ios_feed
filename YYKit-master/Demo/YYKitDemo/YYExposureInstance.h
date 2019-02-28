//
//  YYExposureInstance.h
//  YYKitDemo
//
//  Created by qsm on 2019/1/17.
//  Copyright © 2019年 ibireme. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSDHomeListResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface YYExposureInstance : NSObject

@property(nonatomic,strong)NSArray* exposureArray;

//需要向后台发送的数据
@property(nonatomic,strong)NSArray* exposureChangeDataArr;

@property(nonatomic,assign)BOOL shareExist;

+(instancetype)shareInstance;

+(BOOL)getKflag:(NSString*)date;

+(NSString*)getCreateTime:(NSDate*)date;

-(void)setExposureArr:(NSArray*)modelArr;

-(void)setExposureModel:(RSDHomeBuildingModel *)model;

@end

NS_ASSUME_NONNULL_END
