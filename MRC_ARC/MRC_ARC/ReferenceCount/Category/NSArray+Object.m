//
//  NSArray+Object.m
//  MRC_ARC
//
//  Created by qsm on 2019/1/14.
//  Copyright © 2019年 qsm. All rights reserved.
//

#import "NSArray+Object.h"

@implementation NSArray (Object)


+(instancetype)arrObj
{
    id obj = [[NSMutableArray alloc] init];
    
    [obj autorelease];
    
    return obj ;
    
}


@end









