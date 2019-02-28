//
//  Person.h
//  MRC_ARC
//
//  Created by qsm on 2019/1/28.
//  Copyright © 2019年 qsm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
{
    Book * _book ;
}

@property(nonatomic,strong)NSString* name ;

-(void)eat;

-(void)setBook:(Book*)book;

-(Book*)book;

@end

NS_ASSUME_NONNULL_END
