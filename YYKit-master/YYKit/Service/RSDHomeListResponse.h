//
//  RSDHomeListResponse.h
//  Agent
//
//  Created by wangliang on 2017/8/24.
//  Copyright © 2017年 七扇门. All rights reserved.
//chelin&&&

#import "RSDBaseResponse.h"
@class RSDHomeListModel;
@class RSDHomeBuildingModel;
@class RSDCounselorInfoModel;
@class RSDBuildingLabelModel;

@protocol RSDHomeBuildingModel <NSObject>
@end

@protocol RSDCounselorInfoModel <NSObject>
@end

@protocol RSDBuildingLabelModel <NSObject>
@end

@protocol RSDHomeListModel <NSObject>
@end
@interface RSDHomeListResponse : RSDBaseResponse
///
@property (nonatomic,strong) RSDHomeListModel *data;
@end


@interface RSDHomeListModel : BaseModel
///
@property (nonatomic,assign) NSInteger count;
///
@property (nonatomic,strong) NSString *houses_list_url;
///
@property (nonatomic,strong) NSArray<RSDHomeBuildingModel> *list;

@end


@interface RSDHomeBuildingModel : BaseModel
///
@property(strong, nonatomic) NSNumber * id;
///
@property(strong, nonatomic) NSString * name;
///
@property(strong, nonatomic) NSString * price;
///
@property(strong, nonatomic) NSString * area;
///
@property (nonatomic,strong) NSString * houses_location;
///
@property(strong, nonatomic) NSString * commission;
///
@property(strong, nonatomic) NSString * hot;
///
@property(copy, nonatomic) NSString * img_url;
///
@property(copy, nonatomic) NSString * margin;
///
@property(copy, nonatomic) NSString * type;
///
@property (nonatomic, copy) NSString * visit_money;
///
@property(assign, nonatomic) NSInteger return_type;
///
@property(nonatomic,copy)NSString * return_price;
///
@property(nonatomic,copy)NSString *return_percentage;
/// 点赞数
@property(assign, nonatomic) NSInteger like_count;
/// 评论数
@property(assign, nonatomic) NSInteger comment_count;
/// 是否点赞
@property(assign, nonatomic) BOOL is_like;
/// 是否收藏 0否 1是
@property(assign, nonatomic) BOOL is_favorite;
/// 判断保证金
@property(assign, nonatomic) NSInteger source;
///
@property (nonatomic,strong) NSString *custom_source;
///
@property(assign, nonatomic) BOOL neww;
/// 分享次数
@property(nonatomic,copy)NSString * share_num;
/// 分享url
@property(nonatomic,copy)NSString * share_url;
/// 分享类型  0:没有分享有奖  1:图片  2:h5页面
@property(nonatomic,copy)NSString * share_type;
/// 分享的文本
@property(nonatomic,copy)NSString * share_content;
/// 分享的图片
@property(nonatomic,copy)NSString * share_image;
/// 总的分享次数
@property(nonatomic,copy)NSString * share_totalNum;
/// 分享图片的宽
@property(nonatomic,copy)NSString * share_image_width;
/// 分享图片的高
@property(nonatomic,assign)NSString * share_image_height;
/// 分享金额
@property (nonatomic, copy) NSString * share_money;
/// 是否在同一区域
@property (nonatomic, assign) BOOL share_in_area;
/// 是否在同一区域
@property (nonatomic, assign) NSInteger share_log_id;
/// 置业顾问列表
@property (nonatomic,strong) NSArray<RSDCounselorInfoModel> *counselor_list;
/// 楼盘属性标签
@property (nonatomic,strong) NSArray<RSDBuildingLabelModel> *labels;

@property(copy, nonatomic) NSString * visit;

@property (nonatomic, copy) NSString *create_time;

/// 分享的文本内容
@property (nonatomic, copy) NSString * ew_content;


@end


/// 置业顾问信息
@interface RSDCounselorInfoModel : BaseModel
///
@property (nonatomic,strong) NSString *broker_mobile;
///
@property (nonatomic,strong) NSNumber *broker_uid;
/// 照片地址
@property (nonatomic,strong) NSString *favicon;
/// 等级
@property (nonatomic,assign) NSInteger level;
///
@property (nonatomic,strong) NSString *broker_name;
///头像缩略图
@property (nonatomic,strong) NSString *thumb;

@end

/// 楼盘属性标签
@interface RSDBuildingLabelModel : BaseModel
///
@property (nonatomic,strong) NSString *property;
///
@property (nonatomic,strong) NSString *property_value;

@end






