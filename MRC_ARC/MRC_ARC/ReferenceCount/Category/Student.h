//
//  Student.h
//  MRC_ARC
//
//  Created by qsm on 2019/1/28.
//  Copyright © 2019年 qsm. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property(nonatomic,copy)NSString* (^studentBlock)(NSString*str1,NSString*str2);

-(NSString*(^)(NSString*str1,NSString*str2))playFootBall;

@end

NS_ASSUME_NONNULL_END
