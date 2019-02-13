//
//  ARCViewController.m
//  MRC_ARC
//
//  Created by qsm on 2019/1/11.
//  Copyright © 2019年 qsm. All rights reserved.
//

#import "ARCViewController.h"
#import "NSArray+Object.h"
#import "NSString+Object.h"
//#import "<Messages/Messages.h>"

@interface ARCViewController ()

@property (nonatomic,copy)void(^indexBlock)(NSString *str,int i);

@end

@implementation ARCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"ARC";
    self.view.backgroundColor = [UIColor whiteColor];
  
//    [self release];
    
    [self function];
    
}

-(void)function
{
    //用alloc,new,copy,mutalCopy生成的对象都是自己生成的对象
    //用array方法生成的对象不是自己生成的对象

    //自己生成的对象,自己持有
//    id obj = [[NSObject alloc] init];
//    NSLog(@"引用计数 = %ld", (unsigned long)[obj retainCount]);

//    非自己生成的对象，自己也能持有
//     id arr = [NSMutableArray array];
//        [arr retain];
//
//        [arr release];
//        [arr release];
    
//    不再需要自己持有对象时释放
//    id obj = [NSMutableArray array];
////    [obj retain];
//    [obj release];
//    // 释放了对象还进行释放,会导致奔溃
////    [obj release];
//    NSLog(@"引用计数 = %ld", (unsigned long)[obj retainCount]);
    
    //无法释放非自己持有的对象
//    id obj = [NSMutableArray array];
//    [obj release];
//    NSLog(@"引用计数 = %ld", (unsigned long)[obj retainCount]);

    
    id obj = [[NSMutableArray alloc] init];
    
//    [obj release];
    NSLog(@"引用计数 = %ld", (unsigned long)[obj retainCount]);
    
//   类方法创建对象类似使用了autorelease方法，将obj注册到autoreleasePool中，不会立即释放，当pool结束时再自动调用release。这样达到取得的对象存在，自己不持有对象。
    
//    NSString * str = nil;
    
//    [obj drain];
    
    
//    //应用场景:app请求首页数据
//    第一种方法
//    [self post1];  //发送一个检测状态码请求 post1
//    if (状态码==YES) { //代表后台数据没有变动
//        //不执行任何操作
//    }else{   //代表后台数据有调整
//        //发送一个请求后台列表的请求 post2
//        [self post2];
//        //刷新UI
//        [self updateUI];
//    }
//
//    第二种方法
//    如果后台数据有变动给前端发送推送,状态码==YES
//    前端本地将状态码变为Yes
//    前端发送请求的时候,在本地判断
//    if (状态码==YES) { //代表后台数据没有变动
//        //不执行任何操作
//    }else{   //代表后台数据有调整
//        //发送一个请求后台列表的请求 post2
//        [self post2];
//        //刷新UI
//        [self updateUI];
//    }
//
    
    id __strong obj1 = [[NSObject alloc] init];
    
    //编译器的模拟代码
//    id obj3 = objc_msgSend(self,@selector(array));
//    objc_retainAutoreleasedReturnValue(obj);
//    objc_release(obj);
    
    
//    id __strong obj2 = [[NSObject alloc] init];
    
    self.indexBlock(@"__indxe", 4);
    
    
    
    
    
}

-(void)function_arc
{
    
    
    
    
}



@end



























































































