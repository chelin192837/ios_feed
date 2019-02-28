//
//  Book.m
//  MRC_ARC
//
//  Created by qsm on 2019/2/18.
//  Copyright © 2019年 qsm. All rights reserved.
//

#import "Book.h"

@implementation Book

-(void)dealloc
{
    [super dealloc];
    NSLog(@"Book----死亡");
}
@end
