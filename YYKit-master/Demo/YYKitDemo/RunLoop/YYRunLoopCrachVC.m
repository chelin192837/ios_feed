//
//  YYRunLoopCrachVC.m
//  YYKitDemo
//
//  Created by qsm on 2019/2/27.
//  Copyright © 2019年 ibireme. All rights reserved.
//

#import "YYRunLoopCrachVC.h"

@interface YYRunLoopCrachVC ()

@end

@implementation YYRunLoopCrachVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    

}

#pragma mark-- RunLoop应用场景(五): RunLoop Crash处理
/*
 我们在HandleException回调函数中，可以获取到当前的RunLoop，然后获取该RunLoop中的所有Mode，手动运行一遍;
 CFRunLoopRef runLoop = CFRunLoopGetCurrent();
 CFArrayRef allModes = CFRunLoopCopyAllModes(runLoop);
 while (!ignore) {
 for (NSString *mode in (__bridge NSArray *)allModes) {
 CFRunLoopRunInMode((CFStringRef)mode, 0.001, false);
 }
 NSLog(@"ignoreignoreignoreignoreignore");
 }
 */

//-(void)touch


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSArray *array =[NSArray array];
    NSLog(@"%@",[array objectAtIndex:1]);
}



@end
