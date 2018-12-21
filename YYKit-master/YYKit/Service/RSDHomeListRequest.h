//
//  RSDHomeListRequest.h
//  Agent
//
//  Created by wangliang on 2017/8/24.
//  Copyright © 2017年 七扇门. All rights reserved.
//

#import "RSDBaseRequest.h"

@interface RSDHomeListRequest : RSDBaseRequest

/// 当前页数
@property (nonatomic,assign) NSInteger page;
///
@property (nonatomic,strong) NSString *area_type;
/// 搜索文字内容
@property (nonatomic,strong) NSString *search;
/// 筛选城市id (3011返回)   有city时就不需要带location
@property (nonatomic,strong) NSNumber *city;
/// 物业类型
@property (nonatomic,strong) NSString *type;
/// 总价排序
@property (nonatomic,strong) NSString *order;
/// new 最新 fast_commission 快佣 high_commission 高佣 travel 文旅 overseas 海外 hot 热推
@property (nonatomic,strong) NSString *index_house_type;
/// 0保证金 1代理公司 2经纪人 3开发商
@property (nonatomic,strong) NSString *source;
/// 当前定位的区域例如朝阳区的id
@property (nonatomic,strong) NSNumber *location;
/// 佣金
//(佣金排序 fix_commission-asc 固定佣金低-高 fix_commission-desc 固定高-低 percentage_commission-asc 比例低-高 percentage_commission-desc 比例高-低)
@property (nonatomic,strong) NSString *commission_sort;
///楼盘属性
@property (nonatomic,strong) NSString *house_label;

@end




