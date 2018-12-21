//
//  RSDHomeListResponse.m
//  Agent
//
//  Created by wangliang on 2017/8/24.
//  Copyright © 2017年 七扇门. All rights reserved.
//

#import "RSDHomeListResponse.h"

@implementation RSDHomeListResponse

@end


@implementation RSDHomeListModel

@end

@implementation RSDHomeBuildingModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"new"]) {
        self.neww =value;
    }
}
@end


@implementation RSDCounselorInfoModel


@end


@implementation RSDBuildingLabelModel


@end
