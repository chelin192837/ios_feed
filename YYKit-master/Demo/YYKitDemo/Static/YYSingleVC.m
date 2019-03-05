//
//  YYSingleVC.m
//  YYKitDemo
//
//  Created by qsm on 2019/3/5.
//  Copyright © 2019年 ibireme. All rights reserved.
//

#import "YYSingleVC.h"
#import "YYSingleShare.h"

@interface YYSingleVC ()

@end

@implementation YYSingleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    
    YYSingleShare * singShare1 = [YYSingleShare shareInstace];
    NSLog(@"singShare1-----%@",singShare1);
    
    YYSingleShare * singShare2 = [[YYSingleShare alloc] init];
    NSLog(@"singShare2-----%@",singShare2);
    
    YYSingleShare * singShare3 = singShare1.copy;
    NSLog(@"singShare3-----%@",singShare3);
    
    YYSingleShare * singShare4 = singShare1.mutableCopy;
    NSLog(@"singShare4-----%@",singShare4);
    
    
}


@end
