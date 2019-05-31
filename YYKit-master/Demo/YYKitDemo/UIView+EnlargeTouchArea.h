//
//  UIView+EnlargeTouchArea.h
//  YYKitDemo
//
//  Created by 车林 on 2019/5/27.
//  Copyright © 2019年 ibireme. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (EnlargeTouchArea)
- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;

- (void)setEnlargeEdge:(CGFloat) size;
@end

NS_ASSUME_NONNULL_END
