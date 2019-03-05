//
//  YYSingleShare.m
//  YYKitDemo
//
//  Created by qsm on 2019/3/5.
//  Copyright © 2019年 ibireme. All rights reserved.
//

#import "YYSingleShare.h"

@implementation YYSingleShare

//大家平时写单例的时候可能没注意到，如果别人init了这个类，就会创建一个新的对象，要保证永远都只为单例对象分配一次内存空间，写法如下
+(instancetype)shareInstace
{
    static YYSingleShare * share = nil ;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        share = [[YYSingleShare alloc] init];
    });
    
    return share ;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    return [self shareInstace];
}

+ (void)initialize
{
    
    NSLog(@"initialize---YYSingleShare---");
    
}
- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return self;
}

-(instancetype)copy
{
    return self ;
}

-(instancetype)mutableCopy
{
    return self;
}



@end
