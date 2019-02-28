//
//  YYSDWebImageVC.m
//  YYKitDemo
//
//  Created by qsm on 2019/2/15.
//  Copyright © 2019年 ibireme. All rights reserved.
//

#import "YYSDWebImageVC.h"
#import "UIImageView+WebCache.h"
#import "NSData+YYURL.h"
#import <IQKeyboardManager.h>
#import "UIButton+EnlargeTouchArea.h"

@interface YYSDWebImageVC ()<UITextFieldDelegate>

@end

@implementation YYSDWebImageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 开始第三方键盘
//    [[IQKeyboardManager sharedManager] setEnable:NO];
//    [IQKeyboardManager sharedManager].shouldToolbarUsesTextFieldTintColor = NO;
//    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
//    // 点击屏幕隐藏键盘
//    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = NO;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    // 开始第三方键盘
//    [[IQKeyboardManager sharedManager] setEnable:YES];
//    [IQKeyboardManager sharedManager].shouldToolbarUsesTextFieldTintColor = NO;
//    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
//    // 点击屏幕隐藏键盘
//    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
}
-(void)setupUI
{
//    NSString* url = @"http://file.sevendoor.cn/upload/users/2/2019/02/15/Ip9oX3qU9iY5Vjje2zyaYmc6ggVWqelFGZ62AM0Z.jpeg" ;
    
//    NSString* url = @"http://47.95.28.159/upload/images/2019/02/20/155062sdsd8769448883.jpg";
   
    NSString * url = @"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1551089611&di=67723136a15fcb2a10ce7e0e0e9b844f&src=http://b-ssl.duitang.com/uploads/item/201510/01/20151001131516_hBeEZ.jpeg";
    
    UIImageView * imageView = [[UIImageView alloc] init];
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"myMorentouxiangIcon"]];

    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(200);
        make.centerX.equalTo(self.view);
        make.width.height.equalTo(@200);
    }];
    
    UITextField * textField = [[UITextField alloc] init];
    textField.backgroundColor = [UIColor whiteColor];
    textField.delegate = self ;
    textField.placeholder=@"手机号";
    textField.keyboardType = UIKeyboardTypeNumberPad ;
    [self.view addSubview:textField];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(imageView.mas_top).offset(-30);
        make.width.equalTo(@200);
        make.height.equalTo(@50);
        make.centerX.equalTo(self.view);
    }];

    UIButton * centerBtn = [[UIButton alloc] init];
    [centerBtn setTitle:@"点击" forState:UIControlStateNormal];
    [centerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [centerBtn addTarget:self action:@selector(centerBtn) forControlEvents:UIControlEventTouchUpInside];
    centerBtn.backgroundColor = [UIColor yellowColor];
    [imageView addSubview:centerBtn];
    [centerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(imageView);
        make.bottom.equalTo(imageView.mas_bottom).offset(0);
        make.width.height.equalTo(@50);
    }];
    
    UIButton * leftBtn = [[UIButton alloc] init];
    [leftBtn setTitle:@"左点击" forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBtn) forControlEvents:UIControlEventTouchUpInside];
    leftBtn.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:leftBtn];
    [leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(centerBtn.mas_left).offset(-100);
        make.bottom.equalTo(imageView.mas_bottom).offset(0);
        make.width.height.equalTo(@80);
    }];
    
    UIButton * rightBtn = [[UIButton alloc] init];
    [rightBtn setTitle:@"右点击" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBtn) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:rightBtn];
    [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(centerBtn.mas_right).offset(50);
        make.bottom.equalTo(imageView.mas_bottom).offset(0);
        make.width.height.equalTo(@80);
    }];
    

    [centerBtn setEnlargeEdge:100];
    
    [self setNav];

}


-(void)centerBtn
{
    NSLog(@"centerBtn");
}


-(void)leftBtn
{
    NSLog(@"leftBtn");
}


-(void)rightBtn
{
    NSLog(@"rightBtn");
    
    NSArray * arr = [NSArray array];
    
    NSLog(@"---%@",arr[0]);
    
}
-(void)setNav
{
//    UINavigationController *nav = self.navigationController ;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.adjustsImageWhenHighlighted = NO;
    [button setImage:[UIImage imageNamed:@"homeDingweiFanhuiBtn"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    // 设置这个属性是让按钮内部的所有内容左对齐
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    button.size = CGSizeMake(60, 44);
    button.frame = CGRectMake(20, 0, 60, 44);
    button.backgroundColor = [UIColor blueColor];
    //        [button setEnlargeEdge:30];
    // 设置让按钮的内边距，让整体往左边移 5
    button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
//    UIImage * leftImage = [UIImage imageNamed:@"homeDingweiFanhuiBtn"];
//    UIBarButtonItem *leftButon = [[UIBarButtonItem alloc] initWithImage:leftImage style:UIBarButtonItemStylePlain target:self action:@selector(back)];
//
//    UIBarButtonItem *fixedButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//
//    fixedButton.width = 0;
//
//    self.navigationItem.leftBarButtonItems = @[fixedButton, leftButon];
    
//    [button setEnlargeEdge:100];
    
}

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES ;
}











@end
