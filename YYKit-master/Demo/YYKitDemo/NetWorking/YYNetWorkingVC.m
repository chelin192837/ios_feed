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
#import "YYExposure.h"
#import "YYExposureInstance.h"

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
    NSLog(@"------getData");
    WEAK_SELF
    [[YYInterfanceService sharedInstance] analyticalHomeData_3102:request serverSuccessResultHandler:^(id response) {
        RSDHomeListResponse *responseModel = response;
        //*****************************
        //取前30条置业顾问
//        NSMutableArray* buildArray = [NSMutableArray array];
//        int kFlag = (int)buildArray.count;
//        for (RSDHomeBuildingModel* model in responseModel.data.list) {
//            [buildArray addObjectsFromArray:model.counselor_list];
//        }
//        if (buildArray.count>30) {
//            [buildArray subarrayWithRange:NSMakeRange(0, 30)];
//            kFlag = 30 ;
//        }
//        for (RSDHomeBuildingModel* model in responseModel.data.list) {
//            //乱序 30条
//            NSMutableArray* kBuildArray = [NSMutableArray array];
//            for (int j=0; j < kFlag; j++) {
//                int x = arc4random() % (kFlag-1);
//                [kBuildArray addObject:buildArray[x]];
//            }
//            model.counselor_list = (NSArray<RSDCounselorInfoModel>*)kBuildArray;
//        }
        //***************************
        if (weakSelf.tableView.mj_header.state == MJRefreshStateRefreshing) {
            [weakSelf.dataArray removeAllObjects];
        }
        [weakSelf.dataArray addObjectsFromArray:responseModel.data.list];
        if (weakSelf.dataArray.count>0) {
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                [[YYExposureInstance shareInstance] setExposureArr:weakSelf.dataArray];
                NSLog(@"分线程-----%@",[NSThread currentThread]);
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSLog(@"主线程-----%@",[NSThread currentThread]);
                    [weakSelf.tableView reloadData];
                });
            });
        }
        [weakSelf.tableView.mj_header endRefreshing];
        [weakSelf.tableView.mj_footer endRefreshing];
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
        //第五页就是假数据
        if (weakSelf.page == 5) {
            weakSelf.page = 1;
        }
        [weakSelf getData];
    }];
    
    [weakSelf.tableView.mj_header beginRefreshing];
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RSDHomeTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.dataModel = self.dataArray[indexPath.row];
    cell.indexPath = indexPath ;
    
    RSDHomeBuildingModel *model = self.dataArray[indexPath.row];
    NSLog(@"楼盘ID---出现----%@",model.id);
    
    [[YYExposureInstance shareInstance] setExposureModel:self.dataArray[indexPath.row]];
    
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 197.f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%@",[YYExposureInstance shareInstance].exposureArray);
    
}




@end

#pragma mark - RSDHomeTitleCell
@interface RSDNoteTitleCell ()


@end

@implementation RSDNoteTitleCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = rgb(102, 102, 102);
    self.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
    }];
}


@end
