//
//  YYNetWorkingVC.m
//  YYKitDemo
//
//  Created by qsm on 2018/12/10.
//  Copyright © 2018年 ibireme. All rights reserved.
//

#import "YYNetWorkingVC.h"
#import "YYInterfanceService.h"
#import "RSDHomeListRequest.h"
#import "RSDHomeTableCell.h"
#import "MJRefresh.h"

@interface YYNetWorkingVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView* tableView;

@property(nonatomic,strong)NSMutableArray * dataArray;

@property (nonatomic,assign) NSInteger page;

@end

@implementation YYNetWorkingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUI];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.tableView.mj_header beginRefreshing];
}
-(UITableView*)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.bottom.top.equalTo(self.view);
        }];
        [_tableView registerNib:[UINib nibWithNibName:@"RSDHomeTableCell" bundle:nil] forCellReuseIdentifier:@"cellID"];
        _tableView.delegate = self;
        _tableView.dataSource = self ;
    }
    return _tableView;
}
-(NSMutableArray*)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
-(void)getData{
    RSDHomeListRequest * request = [[RSDHomeListRequest alloc] init];
    request.page = self.page ;
    WEAK_SELF
    [[YYInterfanceService sharedInstance] analyticalHomeData_3102:request serverSuccessResultHandler:^(id response) {
        RSDHomeListResponse *responseModel = response;
        RSDHomeListModel *listModel = responseModel.data;
        NSArray *dataModelArray = listModel.list;
        if (weakSelf.tableView.mj_header.state == MJRefreshStateRefreshing) {
            [weakSelf.dataArray removeAllObjects];
        }
        [weakSelf.dataArray addObjectsFromArray:dataModelArray];
        [weakSelf.tableView.mj_header endRefreshing];
        [weakSelf.tableView.mj_footer endRefreshing];
        [weakSelf.tableView reloadData];
    } failedResultHandler:^(id response) {
        [weakSelf.tableView.mj_header endRefreshing];
        [weakSelf.tableView.mj_footer endRefreshing];
    } requestErrorHandler:^(id error) {
        [weakSelf.tableView.mj_header endRefreshing];
        [weakSelf.tableView.mj_footer endRefreshing];
    }];
    
}


-(void)setUI
{
    WEAK_SELF
    weakSelf.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.page = 1;
        [weakSelf getData];
    }];
    
    weakSelf.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakSelf.page++;
        [weakSelf getData];
    }];
    
    [weakSelf.tableView.mj_header beginRefreshing];
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RSDHomeTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
        cell.dataModel = self.dataArray[indexPath.row];
        return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 197.f;
}




@end
