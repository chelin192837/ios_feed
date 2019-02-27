//
//  YYRunLoopVC.m
//  YYKitDemo
//
//  Created by qsm on 2019/2/26.
//  Copyright © 2019年 ibireme. All rights reserved.
//

#import "YYRunLoopVC.h"
#import "HLThread.h"

@interface YYRunLoopVC ()

@property (nonatomic,strong)NSThread * thread ;

@end

@implementation YYRunLoopVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //测试线程的销毁
    [self runLoopThread];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self performSelector:@selector(opention) onThread:self.thread withObject:nil waitUntilDone:NO];
}

#pragma mark-- RunLoop应用场景(一):RunLoop保证线程的长时间存活
/*
    1,ios当子线程中的任务执行完毕后，子线程就会被销毁掉。
    2,如果程序中，需要经常在子线程中执行任务，频繁的创建和销毁线程，会造成资源的浪费。这时候我们就可以使用RunLoop来让该线程长时间存活而不被销毁
    3,每个线程都会有自己的一个runLoop;
 
    //  注意!!!!
    1.获取RunLoop只能使用 [NSRunLoop currentRunLoop] 或 [NSRunLoop mainRunLoop];
    2.即使RunLoop开始运行，如果RunLoop 中的 modes 为空，或者要执行的mode里没有item，那么RunLoop会直接在当前loop中返回，并进入睡眠状态。
    3.自己创建的Thread中的任务是在kCFRunLoopDefaultMode这个mode中执行的。
    4.在子线程创建好后，最好所有的任务都放在AutoreleasePool中。
 
 */
-(void)runLoopThread
{
    HLThread * thread = [[HLThread alloc] initWithTarget:self selector:@selector(HLOpention) object:nil];
    
    self.thread = thread ;
    
    thread.name = @"分线程";
    
    [thread start];
}

-(void)HLOpention
{
    //每个线程都会有自己的一个runLoop;
    //主线程和分线程一样;
    NSRunLoop * runLoop = [NSRunLoop currentRunLoop];
    //
    // runLoop : 通过设置modes中的item来设置runLoop的运行方式;
    //
    //往modes中添加两类item任务;NSPort（对应的是source）、NSTimer;
    [runLoop addPort:[NSMachPort port] forMode:NSRunLoopCommonModes];
    
    NSLog(@"NSRunLoop启动前---%@",runLoop.currentMode);
    
    [runLoop run];

}

-(void)opention
{
    NSLog(@"NSRunLoop启动后---%@",[NSRunLoop currentRunLoop].currentMode);

    NSLog(@"当前线程---------%@",[NSThread currentThread]);
    [NSThread sleepForTimeInterval:3.f];
    NSLog(@"当前线程---------%@",[NSThread currentThread]);
    
}




@end


























