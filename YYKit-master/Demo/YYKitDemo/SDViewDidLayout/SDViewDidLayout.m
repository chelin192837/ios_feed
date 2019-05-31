//
//  SDViewDidLayout.m
//  YYKitDemo
//
//  Created by 车林 on 2019/5/30.
//  Copyright © 2019年 ibireme. All rights reserved.
//

#import "SDViewDidLayout.h"

@interface SDViewDidLayout ()

@property(nonatomic,strong)UIButton * button;

@end

@implementation SDViewDidLayout

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
}

-(void)setupUI
{
    UIView * topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@300);
        make.top.equalTo(self.view).offset(100);
        make.centerX.equalTo(self.view);
    }];
    
    UIButton* button = [[UIButton alloc] init];
    self.button = button;
    button.backgroundColor = [UIColor greenColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:@"完成" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@100);
        make.top.equalTo(topView).offset(10);
        make.centerX.equalTo(topView);
    }];
    
    
    UIView * buottomView = [[UIView alloc] init];
    buottomView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:buottomView];
    [buottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-50);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@200);
    }];
    
    UIPanGestureRecognizer* pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];

    [buottomView addGestureRecognizer:pan];
    
}
-(void)btn:(UIButton*)button
{
    button.backgroundColor = [UIColor colorWithRed:(arc4random() % 255)/255.f green:(arc4random() % 255)/255.f blue:(arc4random() % 255)/255.f alpha:1];
}
-(void)pan:(UIPanGestureRecognizer*)pan
{
    
    CGPoint point = [pan locationInView:pan.view];
    
    float x = point.x;
    
    self.button.x = x;
    
    self.button.y = point.y;
    
    if (x>150) {
         [self.button sendActionsForControlEvents:UIControlEventTouchUpInside]; 
    }
    
    NSLog(@"point****%f",x);
    
}



@end








