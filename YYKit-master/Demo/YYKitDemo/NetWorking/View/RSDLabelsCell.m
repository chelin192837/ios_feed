//
//  RSDLabelsCell.m
//  Agent
//
//  Created by wangliang on 2017/8/29.
//  Copyright © 2017年 七扇门. All rights reserved.
//

#import "RSDLabelsCell.h"

@interface RSDLabelsCell ()
@property (weak, nonatomic) IBOutlet RSDEdgeLabel *labelsLabel;

@end
@implementation RSDLabelsCell
- (void)setDataModel:(RSDBuildingLabelModel *)dataModel{
    _dataModel = dataModel;
    self.labelsLabel.text = dataModel.property_value;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.labelsLabel.layer.cornerRadius = 2.0;
    self.labelsLabel.layer.borderColor = SDColorOfGreen00AF36.CGColor;
    self.labelsLabel.layer.borderWidth = 0.75;
    self.labelsLabel.layer.masksToBounds = YES;
    self.labelsLabel.edgeInsets = UIEdgeInsetsMake(1, 1, 1, 1);//设置内边距
    [self.labelsLabel sizeToFit];
    
}

@end
