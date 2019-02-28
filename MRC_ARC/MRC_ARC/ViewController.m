//
//  ViewController.m
//  MRC_ARC
//
//  Created by qsm on 2019/1/11.
//  Copyright © 2019年 qsm. All rights reserved.
//

#import "ViewController.h"
#import "ARCViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView* tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    self.title = @"团队管理" ;
    
    [self.view addSubview:self.tableView];
    
    
}

-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self ;
        _tableView.dataSource = self;
        _tableView.rowHeight = 44.f ;
        
    }
    return _tableView;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * cellId = @"cellid__";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"内存管理----%ld",(long)indexPath.row];
   
    cell.selectionStyle = UITableViewCellSelectionStyleNone ;
    
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        ARCViewController * arcVC = [[ARCViewController alloc] init];
        
        [self.navigationController pushViewController:arcVC animated:YES];
    }
}
@end

































































