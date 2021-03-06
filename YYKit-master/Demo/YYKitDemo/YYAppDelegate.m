//
//  AppDelegate.m
//  YYKitExample
//
//  Created by ibireme on 14-9-18.
//  Copyright (c) 2014 ibireme. All rights reserved.
//

#import "YYAppDelegate.h"
#import "YYRootViewController.h"
#import "YYFPSLabel.h"

/// Fix the navigation bar height when hide status bar.
@interface YYExampleNavBar : UINavigationBar

@end

@implementation YYExampleNavBar {
    CGSize _previousSize;
}

- (CGSize)sizeThatFits:(CGSize)size {
    size = [super sizeThatFits:size];
    if ([UIApplication sharedApplication].statusBarHidden) {
        size.height = 64;
    }
    return size;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (!CGSizeEqualToSize(self.bounds.size, _previousSize)) {
        _previousSize = self.bounds.size;
        [self.layer removeAllAnimations];
        [self.layer.sublayers makeObjectsPerformSelector:@selector(removeAllAnimations)];
    }
}
@end


@interface YYExampleNavController : UINavigationController
@property (nonatomic, strong) YYFPSLabel *fpsLabel;
@end
@implementation YYExampleNavController
- (BOOL)shouldAutorotate {
    return YES;
}

-(instancetype)initWithNavigationBarClass:(Class)navigationBarClass toolbarClass:(Class)toolbarClass
{
    if (self = [super initWithNavigationBarClass:navigationBarClass toolbarClass:toolbarClass]) {
//        NSLog(@"__zxy__11:12");
        _fpsLabel = [YYFPSLabel new];
        [_fpsLabel sizeToFit];
        _fpsLabel.top =  4.f;
        _fpsLabel.left = self.view.width/2 + _fpsLabel.width - 10;
        _fpsLabel.alpha = 1;
        [self.view addSubview:_fpsLabel];
    }
    return self;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

-(void)testSourceTree
{
    NSLog(@"__%s");
    NSLog(@"%@",__func__);
}

@end



@implementation YYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    YYRootViewController *root = [YYRootViewController new];
    
    YYExampleNavController *nav = [[YYExampleNavController alloc] initWithNavigationBarClass:[YYExampleNavBar class] toolbarClass:[UIToolbar class]];
    
    if ([nav respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        nav.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [nav pushViewController:root animated:NO];
    
    self.rootViewController = nav;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.rootViewController;
    self.window.backgroundColor = [UIColor grayColor];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
