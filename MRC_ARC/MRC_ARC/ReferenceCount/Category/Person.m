//
//  Person.m
//  MRC_ARC
//
//  Created by qsm on 2019/1/28.
//  Copyright © 2019年 qsm. All rights reserved.
//

#import "Person.h"
#import "Student.h"
@implementation Person
-(instancetype)init
{
    if (self = [super init]) {
  
    }
    return self;
}
-(void)setBook:(Book*)book
{
    _book = [book retain];
}

-(Book*)book
{
    return _book;
}
-(void)eat
{
    NSLog(@"吃饭");
}
-(void)dealloc{
    [super dealloc];
    [_book release];
    NSLog(@"p ___死亡");
}

@end
