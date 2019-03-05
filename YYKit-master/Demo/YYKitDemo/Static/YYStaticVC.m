//
//  YYStaticVC.m
//  YYKitDemo
//
//  Created by qsm on 2019/3/3.
//  Copyright © 2019年 ibireme. All rights reserved.
//

#import "YYStaticVC.h"

@interface YYStaticVC ()

@end

static int count = 0 ;

@implementation YYStaticVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self StaticFunction];
    
}


-(void)StaticFunction
{
    count ++ ;
    
    NSLog(@"count -- %d",count);
}














@end
