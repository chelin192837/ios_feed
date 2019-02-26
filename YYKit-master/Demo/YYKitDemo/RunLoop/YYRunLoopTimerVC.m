//
//  YYRunLoopTimerVC.m
//  YYKitDemo
//
//  Created by qsm on 2019/2/26.
//  Copyright © 2019年 ibireme. All rights reserved.
//

#import "YYRunLoopTimerVC.h"

static int count ;

@interface YYRunLoopTimerVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView* kTableView;

@property (nonatomic,strong)UILabel * topLabel;

@property (nonatomic,strong)NSTimer * timer ;

@end

@implementation YYRunLoopTimerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //NSTimer
//    self.timer = [NSTimer timerWithTimeInterval:1.f target:self selector:@selector(timeClick) userInfo:nil repeats:YES];
    
    self.timer =[NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(timeClick) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    [self.timer fire];
    
//    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, (self.view.frame.size.height-100)/2, 200, 100)];
//    self.topLabel = label ;
//    label.text = @"__text";
//    [self.view addSubview:label];
    
    [self.view addSubview:self.kTableView];
    
    
}

-(void)timeClick
{
    count ++ ;
    NSLog(@"count__%d",count);
    [self.kTableView reloadData];
}
-(UITableView*)kTableView
{
    if (!_kTableView) {
        _kTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _kTableView.delegate = self ;
        _kTableView.dataSource = self;
    }
    return _kTableView;
}
#pragma mark --- RunLoop 让Timer正常运转
/*
 
然后，我们在滑动tableView的时候timerUpdate方法，并不会调用。
* 原因是啥呢？*
原因是当我们滑动scrollView时，主线程的RunLoop 会切换到UITrackingRunLoopMode这个Mode，执行的也是UITrackingRunLoopMode下的任务（Mode中的item），而timer 是添加在NSDefaultRunLoopMode下的，所以timer任务并不会执行，只有当UITrackingRunLoopMode的任务执行完毕，runloop切换到NSDefaultRunLoopMode后，才会继续执行timer。
 
 * 要如何解决这一问题呢？*
 
 解决方法很简单，我们只需要在添加timer 时，将mode 设置为NSRunLoopCommonModes即可。
 
 添加到NSRunLoopCommonModes中的还没有执行的任务，会在mode切换时，再次添加到当前的mode中，这样就能保证不管当前runloop切换到哪一个mode，任务都能正常执行
 并且被添加到NSRunLoopCommonModes中的任务会存储在runloop 的commonModeItems中。
 
 这就是多线程与runloop的关系了，每一个线程都有一个与之关联的RunLoop，而每一个RunLoop可能会有多个Mode。CPU会在多个线程间切换来执行任务，呈现出多个线程同时执行的效果。执行的任务其实就是RunLoop去各个Mode里执行各个item。因为RunLoop是独立的两个，相互不会影响，所以在子线程添加timer，滑动视图时，timer能正常运行。

 1、如果是在主线程中运行timer，想要timer在某界面有视图滚动时，依然能正常运转，那么将timer添加到RunLoop中时，就需要设置mode 为NSRunLoopCommonModes。
 2、如果是在子线程中运行timer,那么将timer添加到RunLoop中后，Mode设置为NSDefaultRunLoopMode或NSRunLoopCommonModes均可，但是需要保证RunLoop在运行，且其中有任务。
 
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* cellID = @"kCell__";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%d",count];
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSLog(@"[NSRunLoop currentRunLoop].mode -- %@",[NSRunLoop currentRunLoop].currentMode);
    
}
@end
