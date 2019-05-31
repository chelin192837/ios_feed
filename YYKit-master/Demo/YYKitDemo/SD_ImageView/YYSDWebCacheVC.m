//
//  YYSDWebCacheVC.m
//  YYKitDemo
//
//  Created by qsm on 2019/4/24.
//  Copyright © 2019年 ibireme. All rights reserved.
//

#import "YYSDWebCacheVC.h"
#import "UIImageView+WebCache.h"

@interface YYSDWebCacheVC ()<NSCacheDelegate>
{
    NSCache* _cache;
}
@end

@implementation YYSDWebCacheVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _cache = [NSCache new];
    
    _cache.countLimit = 10 ;
    
    _cache.delegate = self;
    
    [self setupUI];
}

-(void)setupUI
{
    UIImageView * imageView = [[UIImageView alloc] init];

    [self.view addSubview:imageView];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@300);
        make.height.equalTo(@500);
        make.center.equalTo(self.view);
    }];
    
    UIButton*button = [[UIButton alloc] init];
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"完成" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@200);
        make.height.equalTo(@50);
        make.bottom.equalTo(imageView.mas_top).offset(20);
        make.centerX.equalTo(imageView);
    }];
    
    
    NSString * url = @"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1551089611&di=67723136a15fcb2a10ce7e0e0e9b844f&src=http://b-ssl.duitang.com/uploads/item/201510/01/20151001131516_hBeEZ.jpeg";
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"myMorentouxiangIcon"]];
    
    
}

-(void)btn:(UIButton*)tap
{
    for (int i=0; i<20; i++) {
        id obj = [_cache objectForKey:@(i)];
        
        NSLog(@"cache==%@",obj);
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    for (int i=0; i<20; i++) {
        NSString* str = [NSString stringWithFormat:@"meisiyi ==%d",i];
        
        [_cache setObject:str forKey:@(i)];
        
        NSLog(@"of==%@",[_cache objectForKey:@(i)]);
    
    }
}

- (void)cache:(NSCache *)cache willEvictObject:(id)obj
{
    NSLog(@"将要删除====%@",obj);
}



@end
