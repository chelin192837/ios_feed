//
//  RSDonsultantCell.m
//  Agent
//
//  Created by wangliang on 2017/8/29.
//  Copyright © 2017年 七扇门. All rights reserved.
//

#import "RSDonsultantCell.h"
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"

@interface RSDonsultantCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property (weak, nonatomic) IBOutlet UIImageView *levelImage;
@end


@implementation RSDonsultantCell

- (void)setDataModel:(RSDCounselorInfoModel *)dataModel{
    _dataModel = dataModel;
    
    if (dataModel.thumb.length > 0) {
      [self.headerImage sd_setImageWithURL:[NSURL URLWithString:dataModel.thumb] placeholderImage:DefaultProImage];
    }else{
        [self.headerImage sd_setImageWithURL:[NSURL URLWithString:dataModel.favicon] placeholderImage:DefaultProImage];
    }
    
    self.levelImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"level%ld",(long)dataModel.level]];
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.headerImage.layer.cornerRadius = self.headerImage.height * 0.5;
    self.headerImage.layer.masksToBounds = YES;
}

@end
