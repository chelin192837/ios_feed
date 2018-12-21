//
//  YYDefineViewController.m
//  YYKitDemo
//
//  Created by qsm on 2018/11/23.
//  Copyright © 2018年 ibireme. All rights reserved.
//

#import "YYDefineViewController.h"
#import "YYLabelVC.h"
#import "YYTextVC.h"
@interface YYDefineViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic)UITableView * tableView ;
@property(nonatomic,strong) NSArray * dataArray ;
@end

@implementation YYDefineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    _dataArray = @[@"YYLableVC",@"YYTextVC",@"YYImageCacheVC",@"YYButtonVC",@"YYModelVC",@"YYKItVC"];
    
    [self.view addSubview:self.tableView];
}

-(UITableView*)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
        _tableView.delegate = self ;
        _tableView.dataSource = self ;
    }
    return _tableView ;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count ;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellID = @"__cellID" ;
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell ;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            {
                YYLabelVC * labelVC = [[YYLabelVC alloc] init];
                [self.navigationController pushViewController:labelVC animated:YES];
            }
            break;
        case 1:
        {
            YYTextVC * textVC = [[YYTextVC alloc] init];
            [self.navigationController pushViewController:textVC animated:YES];
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
            
        }
            break;
            
        default:
            break;
    }

}

@end
