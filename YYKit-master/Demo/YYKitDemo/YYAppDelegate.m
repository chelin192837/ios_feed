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
#import "IQKeyboardManager.h"
#import "CrashHandler.h"

/// Fix the navigation bar height when hide status bar.
@interface YYExampleNavBar : UINavigationBar

@end

@implementation YYExampleNavBar {
    CGSize _previousSize;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    if ([UIDevice currentDevice].systemVersion.floatValue >= 11.0) {
        for (UIView *view in self.subviews) { //_UINavigationBarContentView
            for (UIView *subView in view.subviews) {
              //_UIButtonBarStackView
                if ([NSStringFromClass(subView.class) isEqualToString:@"_UIButtonBarStackView"]) {
                    subView.frame = CGRectMake(0, subView.frame.origin.y, subView.frame.size.width, subView.frame.size.height);
                    //_UIButtonBarButton
                    if ([NSStringFromClass(subView.class) isEqualToString:@"_UIButtonBarButton"]) {
                        subView.frame = CGRectMake(0, subView.frame.origin.y, subView.frame.size.width, subView.frame.size.height);
                    }
                }
            }
        }
    }else{
        for (int i=0; i<self.subviews.count; i++) {
            UIView *t_view = self.subviews[i];
            if (i==0) {
                t_view.frame = CGRectMake(0, t_view.frame.origin.y, t_view.frame.size.width, t_view.frame.size.height);
            }
        }
    }
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
        
//        self.navigationBar = 
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

//-(void)testSourceTree
//{
//    NSLog(@"__%s");
//    NSLog(@"%@",__func__);
//}


@end



@implementation YYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [CrashHandler sharedInstance];

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
    
    // 开始第三方键盘
    [[IQKeyboardManager sharedManager] setEnable:YES];
    
    [IQKeyboardManager sharedManager].shouldToolbarUsesTextFieldTintColor = NO;
    
    // 点击屏幕隐藏键盘
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    
    return YES;
}

@end
