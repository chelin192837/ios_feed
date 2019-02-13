//
//  YYExposureInstance.m
//  YYKitDemo
//
//  Created by qsm on 2019/1/17.
//  Copyright © 2019年 ibireme. All rights reserved.
//

#import "YYExposureInstance.h"
#import "NSDate+Extend.h"
#import "YYExposure.h"
//单位是秒
#define minExposureTime 10
static YYExposureInstance* share = nil;
@implementation YYExposureInstance

+(instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        share = [[self alloc] init];
        share.shareExist = YES;
    });
    return share ;
}

-(void)setExposureModel:(RSDHomeBuildingModel *)model
{
    BOOL kFlag = YES ;
    NSMutableArray* exposureMul = [NSMutableArray arrayWithArray:self.exposureArray];
    for (YYExposure* exposure in self.exposureArray) {
        if ([exposure.house_id isEqualToString:[NSString stringWithFormat:@"%@",model.id]]) {
            kFlag = NO ;
            exposure.kflag = [YYExposureInstance getKflag:exposure.create_time];
            //指定时间之内才能增加曝光量
            if (exposure.kflag) {
                NSString * numCount = exposure.count ;
                int count = numCount.intValue;
                count++;
                exposure.count = [NSString stringWithFormat:@"%ld",(long)count];
                exposure.create_time = [YYExposureInstance getCreateTime:[NSDate date]];
               
                if ([exposure.house_id isEqualToString:@"2616"]) {
                    NSLog(@"2616**********2616********%@",exposure.count);
                }
                
            }
        }
    }
    //如果楼盘不存在缓存,就插入存储数组
    if (kFlag) {
        YYExposure * exp_model = [[YYExposure alloc] init];
        exp_model.id = [NSString stringWithFormat:@"%ld",(long)self.exposureArray.count];
        exp_model.house_id = [NSString stringWithFormat:@"%@",model.id];
        exp_model.count = @"1";
        exp_model.create_time = [YYExposureInstance getCreateTime:[NSDate date]];
        exp_model.kflag = NO ;
        [exposureMul addObject:exp_model];
    }
    self.exposureArray = exposureMul.copy;
}
-(void)setExposureArr:(NSArray*)modelArr
{
    NSLog(@"-----%@--",self);
    //这个方法在整个工程项目中只会执行一次
    if (!self.shareExist) {
        return;
    }
    //构造数组
    NSMutableArray * mulArr = [NSMutableArray array];
    for (int i = 0; i< modelArr.count; i++) {
        RSDHomeBuildingModel* model = modelArr[i];
        YYExposure * exposure = [[YYExposure alloc] init];
        exposure.id = [NSString stringWithFormat:@"%ld",(long)i];
        exposure.house_id = [NSString stringWithFormat:@"%@",model.id] ;
        exposure.create_time = [YYExposureInstance getCreateTime:[NSDate date]];
        exposure.count = @"1";
        exposure.kflag = NO ;
        [mulArr addObject:exposure];
    }
    self.exposureArray = mulArr.copy;
    
    self.shareExist = NO ;
}

+(BOOL)getKflag:(NSString*)date
{
    int second = (int)[[NSDate date] secondDate:date];
    if (second < minExposureTime) {
        return NO;
    }else{
        return YES ;
    }
}
+(NSString*)getCreateTime:(NSDate*)date
{
    return [date NSDateConversionNSString];
}

-(NSArray*)exposureChangeDataArr{
    NSMutableArray * mulArr =[NSMutableArray array];
    for (YYExposure* exposure in self.exposureArray) {
        if (exposure.kflag) {
            [mulArr addObject:exposure];
        }
    }
    _exposureChangeDataArr = mulArr.copy;
    
    return _exposureChangeDataArr;
}








@end
