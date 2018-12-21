//
//  YYLabelVC.m
//  YYKitDemo
//
//  Created by qsm on 2018/11/28.
//  Copyright © 2018年 ibireme. All rights reserved.
//

#import "YYLabelVC.h"

@interface YYLabelVC ()<UITableViewDataSource,UITableViewDataSource>

@property (nonatomic,strong)UITableView * tableView ;

@property(nonatomic,strong) NSArray * dataArray ;

@end

@implementation YYLabelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
//    _dataArray = @[@"YYLableVC",@"YYTextVC",@"YYImageCacheVC",@"YYButtonVC",@"YYModelVC",@"YYKItVC"];
    
    [self setUI];
    
}

-(void)setUI{
    [self.view addSubview:self.tableView];
}

-(UITableView*)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
//        __weak UIViewController* weakSelf = self;
//        __block UIViewController * weakSelf = self ;
        _tableView.delegate = self ;
        _tableView.dataSource = self ;
        
    }
    return _tableView ;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100 ;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    NSString * cellID = @"__cellID" ;
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
//    cell.backgroundColor = [UIColor yellowColor];
//    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont systemFontOfSize:20];
    
    
//    if (indexPath.row >1) {
//        UITableViewCell * celled = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row-1 inSection:0]];
//
//        NSLog(@"cell--%ld----bouns.y值%lf",(long)indexPath.row-1,[self ShowFlagCount:celled]);
//    }
//
//    NSLog(@"cell--%ld----bouns.y值%lf",(long)indexPath.row,[self ShowFlagCount:cell]);
    
    return cell ;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100 ;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    UITableViewCell * celled = [_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:6 inSection:0]];
    
//    NSLog(@"cell--%ld----bouns.y值%lf",(long)6,[self ShowFlagCount:celled]);
}

-(CGFloat)ShowFlagCount:(UIView *)view
{
    
    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
    CGRect rect=[view convertRect: view.bounds toView:window];
    
    return rect.origin.y-64 ;
}


@end
