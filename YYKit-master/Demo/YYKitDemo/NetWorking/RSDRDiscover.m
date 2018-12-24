//
//  RSDNoteViewController.m
//  Agent
//
//  Created by qsm on 2018/6/5.
//  Copyright © 2018年 七扇门. All rights reserved.
//

#import "RSDRDiscover.h"

#import "YYNetWorkingVC.h"

static NSString *kReleaseTitleCollectionCellID = @"kReleaseTitleCollectionCellID";
static NSString *kReleaseContentCollectionCellID = @"kReleaseContentCollectionCellID";
static NSString *kReleaseBuildingMenu = @"kReleaseBuildingMenu";

static CGFloat jfHeaderH = 40.f ;

@interface RSDRDiscover ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) NSArray * titleArray ;
/// 标题行
@property (nonatomic,strong) UICollectionView *titleCollectionView;
/// 内容行
@property (nonatomic,strong) UICollectionView *contentCollectionView;
/// 非首次加载
@property (nonatomic,assign) BOOL isNotFirstLoad;

@property (nonatomic,assign) NSInteger selectedIndex;

@end

@implementation RSDRDiscover

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configVC];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
}


- (void)configVC{
    // 添加子控制器
    [self setupChildVC];
    
    self.view.backgroundColor = [UIColor whiteColor];

//    [self.view addSubview:self.titleCollectionView];
    
    UIView * bottomLine = [[UIView alloc] init];
    bottomLine.backgroundColor = rgb(237, 237, 237);
    [self.view addSubview:bottomLine];
    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.titleCollectionView);
        make.height.mas_equalTo(@1);
    }];
    
    [self.view addSubview:self.contentCollectionView];

    self.selectedIndex=0;
    [self collectionView:self.titleCollectionView didSelectItemAtIndexPath:[NSIndexPath indexPathForRow:self.selectedIndex inSection:0]];
    
}
- (void)setupChildVC
{
    for (int i=0; i<6; i++) {
        YYNetWorkingVC* yyNetVC = [[YYNetWorkingVC alloc] init];
        [self addChildViewController:yyNetVC];
    }
}

-(NSArray *)titleArray{
    if (!_titleArray) {
        NSArray* arr = @[@"客户",@"二手房",@"租房",@"活动",@"招聘",@"人才"];
        _titleArray = arr ;
    }
    return _titleArray;
}

#pragma mark - 懒加载

- (UICollectionView *)titleCollectionView{
    if (!_titleCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize = CGSizeMake(self.view.frame.size.width/6, 40);
        flowLayout.minimumLineSpacing=0.0f ;
        flowLayout.minimumInteritemSpacing = 0.0f ;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _titleCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,64, self.view.frame.size.width, 40) collectionViewLayout:flowLayout];
       
        [_titleCollectionView registerClass:[RSDNoteTitleCell class] forCellWithReuseIdentifier:@"kReleaseTitleCollectionCellID"];
      
        _titleCollectionView.delegate = self;
        _titleCollectionView.dataSource = self;
        _titleCollectionView.backgroundColor = [UIColor clearColor];
        _titleCollectionView.showsHorizontalScrollIndicator = NO;
//        _contentCollectionView.pagingEnabled = YES;
    }
    return _titleCollectionView;
}

- (UICollectionView *)contentCollectionView{
    if (!_contentCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
//        flowLayout.itemSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height - CGRectGetMaxY(self.titleCollectionView.frame));
        flowLayout.itemSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
        flowLayout.minimumLineSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//        _contentCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.titleCollectionView.frame), self.view.frame.size.width, flowLayout.itemSize.height) collectionViewLayout:flowLayout];
         _contentCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, flowLayout.itemSize.height) collectionViewLayout:flowLayout];
        
        [_contentCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kReleaseContentCollectionCellID];
        _contentCollectionView.delegate = self;
        _contentCollectionView.dataSource = self;
        _contentCollectionView.backgroundColor = SDColorWhiteFFFFFF;
        _contentCollectionView.showsHorizontalScrollIndicator = NO;
        _contentCollectionView.pagingEnabled = YES;
        
    }
    return _contentCollectionView;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (collectionView==self.titleCollectionView) {
        return CGSizeMake(62.5, 40);
    }
    UICollectionViewFlowLayout *tempLayout = (id)collectionViewLayout;
    return tempLayout.itemSize;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.titleArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (collectionView == self.titleCollectionView) {
   
        RSDNoteTitleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"kReleaseTitleCollectionCellID" forIndexPath:indexPath];
        cell.titleLabel.text = self.titleArray[indexPath.item];
        if (self.selectedIndex == indexPath.row) {
            cell.titleLabel.textColor = SDColorOfGreen00AF36;
        }else
        {
            cell.titleLabel.textColor = rgb(102,102,102);
        }
//
        return cell;
    }
    else{
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kReleaseContentCollectionCellID forIndexPath:indexPath];
        cell.backgroundColor = [UIColor yellowColor];
        UIViewController *vc = self.childViewControllers[indexPath.item];
        vc.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height  - 64);
        [cell addSubview:vc.view];
        return cell;
    }
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (collectionView == self.titleCollectionView) {
        
        [self.titleCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:self.isNotFirstLoad];
        
        [self.contentCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:self.isNotFirstLoad];
        self.isNotFirstLoad = YES;
        
        [self.titleCollectionView reloadData];

    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == self.contentCollectionView) {
        CGFloat width = scrollView.frame.size.width;
        CGFloat offsetX = scrollView.contentOffset.x;
        NSInteger index = offsetX / width;
        [self collectionView:self.titleCollectionView didSelectItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
    }
}
@end



#pragma mark - RSDHomeTitleCell
@interface RSDReleaseTitleCell ()


@end

@implementation RSDReleaseTitleCell

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










