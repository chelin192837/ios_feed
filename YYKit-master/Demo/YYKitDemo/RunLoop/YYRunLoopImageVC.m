//
//  YYRunLoopImageVC.m
//  YYKitDemo
//
//  Created by qsm on 2019/2/27.
//  Copyright © 2019年 ibireme. All rights reserved.
//

#import "YYRunLoopImageVC.h"
#import "FluencyMonitor.h"
#import "DWURunLoopWorkDistribution.h"

#define TimeSpace 0.3f

static NSString *IDENTIFIER = @"IDENTIFIER";

static CGFloat CELL_HEIGHT = 135.f;

@interface YYRunLoopImageVC ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *exampleTableView;


@end

@implementation YYRunLoopImageVC

+ (void)task_5:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath {
    for (NSInteger i = 1; i <= 5; i++) {
        [[cell.contentView viewWithTag:i] removeFromSuperview];
    }
}

+ (void)task_1:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 300, 25)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor redColor];
    label.text = [NSString stringWithFormat:@"%zd - Drawing index is top priority", indexPath.row];
    label.font = [UIFont boldSystemFontOfSize:13];
    label.tag = 1;
    [cell.contentView addSubview:label];
}

+ (void)task_2:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath  {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(105, 20, 85, 85)];
    imageView.tag = 2;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"spaceship" ofType:@"jpg"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = image;
    [UIView transitionWithView:cell.contentView duration:TimeSpace options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve animations:^{
        [cell.contentView addSubview:imageView];
    } completion:^(BOOL finished) {
    }];
}

+ (void)task_3:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath  {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(200, 20, 85, 85)];
    imageView.tag = 3;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"spaceship" ofType:@"jpg"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = image;
    [UIView transitionWithView:cell.contentView duration:TimeSpace options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve animations:^{
        [cell.contentView addSubview:imageView];
    } completion:^(BOOL finished) {
    }];
}

+ (void)task_4:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath  {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 99, 300, 35)];
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor colorWithRed:0 green:100.f/255.f blue:0 alpha:1];
    label.text = [NSString stringWithFormat:@"%zd - Drawing large image is low priority. Should be distributed into different run loop passes.", indexPath.row];
    label.font = [UIFont boldSystemFontOfSize:13];
    label.tag = 4;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 20, 85, 85)];
    imageView.tag = 5;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"spaceship" ofType:@"jpg"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = image;
    
    [UIView transitionWithView:cell.contentView duration:TimeSpace options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve animations:^{
        [cell.contentView addSubview:label];
        [cell.contentView addSubview:imageView];
    } completion:^(BOOL finished) {
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

#pragma mark-- RunLoop应用场景(三):当RunLoop处于NSDefaultRunLoopMode模式下kCFRunLoopBeforeWaiting渲染页面;

/*
 
 //让UITableView、UICollectionView等延迟加载图片
 
 // 当RunLoop处于defalut模式时,发生回掉, 执行[YYRunLoopImageVC task_2:cell indexPath:indexPath];
 进行图片加载和页面渲染;
 
 一次RunLoop循环:BeforeWaiting->BeforeSource->BeforeWaiting
 
 利用RunLoop进行延迟加载图片本质上是利用主线程在页面滚动的时候 RunLoop的模式切换到Traking模式,而这个时候我们设置图片加载的模式是defalut模式下的BeforeWaiting状态,所以在滚动的时候不会加载图片;
 
[imageView3 performSelectorOnMainThread:@selector(setImage:) withObject:image3 waitUntilDone:NO modes:@[NSDefaultRunLoopMode]];

 */

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:IDENTIFIER];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.currentIndexPath = indexPath;
    
    [YYRunLoopImageVC task_5:cell indexPath:indexPath]; // 移除所有视图;
   
    [YYRunLoopImageVC task_1:cell indexPath:indexPath];
    

    [[DWURunLoopWorkDistribution sharedRunLoopWorkDistribution] addTask:^BOOL(void) {
        if (![cell.currentIndexPath isEqual:indexPath]) {
            return NO;
        }
        //
        [YYRunLoopImageVC task_2:cell indexPath:indexPath];
        return YES;
    } withKey:indexPath];
   
    [[DWURunLoopWorkDistribution sharedRunLoopWorkDistribution] addTask:^BOOL(void) {
        if (![cell.currentIndexPath isEqual:indexPath]) {
            return NO;
        }
        [YYRunLoopImageVC task_3:cell indexPath:indexPath];
        return YES;
    } withKey:indexPath];

    [[DWURunLoopWorkDistribution sharedRunLoopWorkDistribution] addTask:^BOOL(void) {
        if (![cell.currentIndexPath isEqual:indexPath]) {
            return NO;
        }
        [YYRunLoopImageVC task_4:cell indexPath:indexPath];
        return YES;
    } withKey:indexPath];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CELL_HEIGHT;
}


- (void)loadView {
    self.view = [UIView new];
    self.exampleTableView = [UITableView new];
    self.exampleTableView.delegate = self;
    self.exampleTableView.dataSource = self;
    [self.view addSubview:self.exampleTableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.exampleTableView.frame = self.view.bounds;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.exampleTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:IDENTIFIER];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(stopMonitor)];
    
    [[FluencyMonitor shareMonitor] start];

}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"RunLoop--%@",[NSRunLoop currentRunLoop].currentMode);
//    [NSRunLoop currentRunLoop];
}

#pragma mark-- RunLoop应用场景(四):用分线程来监控主线程的耗时操作;
/*
 主要测试从BeforeSource到BeforeWaiting之间的时间;
*/
- (void)stopMonitor
{
    [[FluencyMonitor shareMonitor] stop];
}




@end
