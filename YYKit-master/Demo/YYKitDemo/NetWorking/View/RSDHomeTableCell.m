//
//  RSDHomeTableCell.m
//  Agent
//
//  Created by wangliang on 2017/8/28.
//  Copyright © 2017年 七扇门. All rights reserved.
//
// RSDEdgeLabel
#import "RSDHomeTableCell.h"
#import "UIImageView+WebCache.h"
#import "RSDonsultantCell.h"

#import "RSDLabelsCell.h"

#define kScreenWidth 375.f
#define kScreenHeight 667.f


static NSString *kLabelsCellID = @"kLabelsCellID";
static NSString *kDonsultantCellID = @"kDonsultantCellID";

@interface RSDHomeTableCell ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
///
@property (nonatomic,weak) IBOutlet UIView *topView;
///
@property (weak, nonatomic) IBOutlet UIImageView *buildingImage;
///
@property (nonatomic,weak) IBOutlet UILabel *leftTopLabel;
/// 红包 分享
@property (nonatomic,weak) IBOutlet UIButton *redPacketBtn;

/// 楼盘名称
@property (nonatomic,weak) IBOutlet UILabel *buildingNameLabel;
/// 地理位置
@property (nonatomic,weak) IBOutlet UIButton *locationBtn;
/// 价格 描述
@property (nonatomic,weak) IBOutlet UILabel *priceLabel;
/// 佣金
@property (nonatomic,weak) IBOutlet UILabel *commissionLabel;
/// 到访奖
@property (nonatomic,weak) IBOutlet UILabel *visitMoneyLabel;

/// 推荐客户
@property (nonatomic,weak) IBOutlet UIButton *recommendBtn;
/// 楼盘标签 CollectionView
@property (nonatomic,weak) IBOutlet UIView *labelsView;
/// 楼盘标签 CollectionView
@property (nonatomic,strong) UICollectionView *labelsCollectionView;
///
@property (nonatomic,weak) IBOutlet UIView *bottomView;
///
@property (nonatomic,weak) IBOutlet UIView *centerView;
/// 置业顾问
@property (nonatomic,weak) IBOutlet UILabel *consultantLabel;
/// 置业顾问 CollectionView
@property (nonatomic,strong) UICollectionView *consultantCollectionView;
///
@property (weak, nonatomic) IBOutlet UIView *praiseView;

/// 评论内容
@property (nonatomic,strong) NSString *commentContent;
//@property (weak, nonatomic) IBOutlet UIButton *praiseBtn;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
@property (weak, nonatomic) IBOutlet UIButton *messageBtn;
@property (nonatomic,assign) BOOL isNotEnableClick;

@end


@implementation RSDHomeTableCell


- (UICollectionView *)labelsCollectionView{
    if (!_labelsCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing = 5.0;
        flowLayout.minimumInteritemSpacing = 5.0;
        _labelsCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _labelsCollectionView.backgroundColor = SDColorWhiteFFFFFF;
        [_labelsCollectionView registerNib:[UINib nibWithNibName:@"RSDLabelsCell" bundle:nil] forCellWithReuseIdentifier:kLabelsCellID];
        _labelsCollectionView.delegate = self;
        _labelsCollectionView.dataSource = self;
        _labelsCollectionView.showsHorizontalScrollIndicator = NO;
        
    }
    return _labelsCollectionView;
}

- (UICollectionView *)consultantCollectionView{
    if (!_consultantCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing = 10.0;
        flowLayout.minimumInteritemSpacing = 10.0;
        flowLayout.itemSize = CGSizeMake(28.0, 28.0);
        _consultantCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _consultantCollectionView.backgroundColor = SDColorWhiteFFFFFF;
        [_consultantCollectionView registerNib:[UINib nibWithNibName:@"RSDonsultantCell" bundle:nil] forCellWithReuseIdentifier:kDonsultantCellID];
        _consultantCollectionView.delegate = self;
        _consultantCollectionView.dataSource = self;
        _consultantCollectionView.showsHorizontalScrollIndicator = NO;
        
    }
    return _consultantCollectionView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//
    self.recommendBtn.layer.cornerRadius = self.recommendBtn.height * 0.5;

    self.recommendBtn.layer.masksToBounds = YES;

    self.praiseNumLabel.superview.layer.cornerRadius = self.praiseNumLabel.superview.height * 0.5;
    self.praiseNumLabel.superview.layer.masksToBounds = YES;

    self.messageNumLabel.superview.layer.cornerRadius = self.messageNumLabel.superview.height * 0.5;
    self.messageNumLabel.superview.layer.masksToBounds = YES;
    
    [self.labelsView addSubview:self.labelsCollectionView];
    [self.labelsCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(kScreenWidth - 178));
        make.top.bottom.left.equalTo(self.labelsView);
    }];
    
    [self.centerView addSubview:self.consultantCollectionView];
    [self.centerView sendSubviewToBack:self.consultantCollectionView];    
    [self.consultantCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.lessThanOrEqualTo(@(kScreenWidth - 85));
        make.top.bottom.equalTo(self.centerView);
        make.left.equalTo(self.centerView).offset(14);
    }];
    
//    UIImage *tempImage = [UIImage sd_animatedGIFNamed:@"home_redBag"];
//
//    [self.redPacketBtn setBackgroundImage:tempImage forState:UIControlStateNormal];
    
}



- (void)setDataModel:(RSDHomeBuildingModel *)dataModel{
    _dataModel = dataModel;
            NSMutableAttributedString *commissionStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"佣金：%@",dataModel.return_percentage]];
            [commissionStr addAttribute:NSForegroundColorAttributeName value:rgb(170, 170, 170) range:NSMakeRange(0,3)];
            [commissionStr addAttribute:NSForegroundColorAttributeName value:rgb(255, 151, 49) range:NSMakeRange(3,dataModel.return_percentage.length)];
            
            NSMutableAttributedString *visitMoneyStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"到访奖：%@",dataModel.visit_money]];
            [visitMoneyStr addAttribute:NSForegroundColorAttributeName value:rgb(170, 170, 170) range:NSMakeRange(0,4)];
            [visitMoneyStr addAttribute:NSForegroundColorAttributeName value:rgb(255, 194, 76) range:NSMakeRange(4,dataModel.visit_money.length)];
            
            self.commissionLabel.attributedText = commissionStr;
            self.visitMoneyLabel.attributedText = visitMoneyStr;
    
        self.contentView.userInteractionEnabled = YES;
    
    [self.buildingImage sd_setImageWithURL:[NSURL URLWithString:dataModel.img_url] placeholderImage:kBuilding_Placeholder];
    
    self.leftTopLabel.text = dataModel.custom_source;
    self.buildingNameLabel.text = dataModel.name;
    [self.locationBtn setTitle:dataModel.area forState:UIControlStateNormal];

    NSMutableAttributedString * priceStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"售价：%@",dataModel.price]];
    [priceStr addAttribute:NSForegroundColorAttributeName value:rgb(170, 170, 170) range:NSMakeRange(0, 3)];
    [priceStr addAttribute:NSForegroundColorAttributeName value:rgb(102, 102, 102) range:NSMakeRange(3,dataModel.price.length)];
    self.priceLabel.attributedText  = priceStr;
    
    self.messageNumLabel.text = [NSString stringWithFormat:@"%ld",(long)dataModel.comment_count];
    self.praiseNumLabel.text = [NSString stringWithFormat:@"%ld",(long)dataModel.like_count];
    
    
    [self.consultantCollectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        if (dataModel.counselor_list.count * 41 + 85 >=kScreenWidth) {
            make.width.equalTo(@(kScreenWidth - 85));
        }else{
            make.width.equalTo(@(dataModel.counselor_list.count * 41));
        }
    }];
    [self.consultantCollectionView reloadData];
    [self.labelsCollectionView reloadData];
  
    self.collectBtn.selected = dataModel.is_favorite;
    


    if (dataModel.area) {
        [self.btn_location setTitle:[NSString stringWithFormat:@"     %@",dataModel.area] forState:UIControlStateNormal];
        self.btn_location.hidden = NO;
        self.icon_location.hidden = NO;
    }
    else{
        self.btn_location.hidden = YES;
        self.icon_location.hidden = YES;
    }
    
    if (dataModel.is_like) {
        self.praiseBtn.selected = YES;
        self.praiseNumLabel.backgroundColor = SDColorOfGreen00AF36;
        self.praiseView.backgroundColor = SDColorOfGreen00AF36;
    }else
    {
        self.praiseBtn.selected = NO ;

    }
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (collectionView == self.consultantCollectionView) {
        return self.dataModel.counselor_list.count;
    } else {
        return self.dataModel.labels.count > 4 ? 4 : self.dataModel.labels.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (collectionView == self.consultantCollectionView) {
        RSDonsultantCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kDonsultantCellID forIndexPath:indexPath];
        if (self.dataModel.counselor_list.count) {
            cell.dataModel = self.dataModel.counselor_list[indexPath.item];
        }
        return cell;
    } else {
        RSDLabelsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kLabelsCellID forIndexPath:indexPath];
        if (self.dataModel.labels.count) {
            cell.dataModel = self.dataModel.labels[indexPath.item];
        }
        return cell;
    }
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    if (collectionView == self.consultantCollectionView) {
        return CGSizeMake(30, 30);
    }else{
        RSDBuildingLabelModel *dataModel = self.dataModel.labels[indexPath.item];
        CGSize titleSize =[dataModel.property_value
                           boundingRectWithSize:CGSizeMake(MAXFLOAT, 30)
                           options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10.0]}
                           context:nil].size;
        return CGSizeMake(titleSize.width + 3, 18);
    }
    
}

-(void)changeButtonStatus{
 self.isNotEnableClick = NO;
}



@end









