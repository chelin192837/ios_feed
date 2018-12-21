//
//  Header.h
//  Agent
//
//  Created by jj on 16/1/8.
//  Copyright © 2016年 七扇门. All rights reserved.
//公共宏

#ifndef Header_h
#define Header_h
//#import "RACmetamacros.h"

// 首页筛选项的高度
#define kHomePageSreeningLineSpacing 5.0f
#define kHomePageSreeningItemSpacing 5.0f
#define kHomePageSreeningHeight 20.0f

// 首页筛选项的 下部 UIEdgeInsets
#define kHomePageSreeningViewSectionInsetTop 10.0f
#define kHomePageSreeningViewSectionInsetLeft 10.0f
#define kHomePageSreeningViewSectionInsetBottom 10.0f
#define kHomePageSreeningViewSectionInsetRight 10.0f

#define kHomePageSreeningViewMinHeight 50.0f
#define kHomePageSreeningViewMaxHeight 77.0f

//见客笔记
#define kNoteSreeningViewMinHeight 36.0f
#define kNoteSreeningViewMaxHeight 63.0f

#define kNewsVideoSize 220 *Kscale

/// 轮播图的高
#define kCarouselViewHeight  350.0 / 750 * kScreenWidth


#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreeningViewWidth [UIScreen mainScreen].bounds.size.width * 0.8

//等比例放大
#define kScaleWidth [UIScreen mainScreen].bounds.size.width/375.0
#define kScaleHeight [UIScreen mainScreen].bounds.size.height/667.0

//是否是iPhone X
#define is_iPhoneX          ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
//状态栏高度
#define kStatusBar_Height     (is_iPhoneX ? 44.f : 20.f)
// 导航高度
#define kNavBar_Height   (is_iPhoneX ? 88.f : 64.f)
// Tabbar高度.   49 + 34 = 83
#define kTabBar_Height        (is_iPhoneX ? 83.f : 49.f)
// Tabbar安全区域底部间隙
#define TabbarSafeBottomMargin  (is_iPhoneX ? 34.f : 0.f)
// 状态栏和导航高度
#define StatusBarAndNavigationBarHeight  (is_iPhoneX ? 88.f : 64.f)

// 边缘距离
#define KEdgeDistance 14

/// 导航栏尽高度（除掉状态栏的高度）
#define kNavBar_clean_Height (kNavBar_Height-kStatusBar_Height)
/// 底部tabbar高度
//#define kTabBar_Height 49
/// 底部tabbar高度
#define kSearchBar_Height 46

/// 底部按钮高度
#define kBottomBtn_Height 49

/// 默认圆角大小
#define kLayer_CornerRadius 3
// 默认头像

#define DefaultProImage [UIImage imageNamed:@"myMorentouxiangIcon"]
#define DImageOfSevendoorLogo [UIImage imageNamed:@"news_xitong_icon"]


#define DefaultColorOfGreen [UIColor colorFromHexRGB:@"00AF36"]
#define DefaultColorWithGrayOfText [UIColor colorFromHexRGB:@"AAAAAA"]
#define DefaultColorWithSemiOfText [UIColor colorFromHexRGB:@"666666"]
#define DefaultBGColorOfGray [UIColor colorFromHexRGB:@"F3F4F5"]

#define kDarkGray [UIColor colorFromHexRGB:@"333333"]
#define kMidGray [UIColor colorFromHexRGB:@"5c6368"]
#define kBlackColor [UIColor colorFromHexRGB:@"1C1B20"]
#define kLightGray [UIColor colorFromHexRGB:@"919191"]
#define kLineAndBackgroundGray [UIColor colorFromHexRGB:@"eeeeee"]
#define kSecondLine [UIColor colorFromHexRGB:@"dedede"]
#define kUI_WidthS(a) (((a) / 375.0) * SCREEN_WIDTH)
#define kUI_HeightS(a) (((a) / 667.0) * SCREEN_HEIGHT)
#define Kscale [UIScreen mainScreen].bounds.size.width / 375.0
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define MYTEL @"400-811-7477"
//#define kBaseUrl [[NSUserDefaults standardUserDefaults]objectForKey:@"domainUrlStr"]
#define kLogFunction NSLog(@"%s", __FUNCTION__);

#ifndef DEBUG
    #define kBaseUrl @"http://pro31.sevendoor.cn/api/v3/"
    #define kBaseUrl_v4 @"http://pro31.sevendoor.cn/api/v4/"
    #define kBaseWebUrl @"http://pro31.sevendoor.cn/"
    #define kShareCirUrl @"http://pro31.sevendoor.cn"
    #define kWxShareUrl @"http://wx.sevendoor.cn"
    #define EaseMobAppKey @"sevendoor#sdpro"
    #define JPUSHTAG @"production"
    #define SEVENTELNUM @"18410280029"
    #define kISProduction @"YES"
    #define UMAppKey @"59f89e6bb27b0a60d100006a"
    #define STS_OSSCredential @"http://pro31.sevendoor.cn/api/v3/sts/ios" ;
#else
    #define kBaseUrl @"http://47.95.28.159/api/v3/"
    #define kBaseUrl_v4 @"http://47.95.28.159/api/v4/"
    #define kBaseWebUrl @"http://47.95.28.159/"
    #define kShareCirUrl @"http://47.95.28.159"
    #define kWxShareUrl @"http://wxdev.sevendoor.cn"
    #define EaseMobAppKey @"sevendoor#sddev"
    #define JPUSHTAG @"development"
    #define SEVENTELNUM @"13341183738"
    #define kISProduction @"NO"
    #define UMAppKey @"56ab257ee0f55af69a00008c"
    #define STS_OSSCredential @"47.95.28.159/api/v3/sts/ios" ;
#endif

#define BROKERNAME @"brokername"
#define BROKERUID @"brokeruid"
#define APPID @"clientAppid"
#define STATUS @"clientStatus"
#define SWITCHSTATUS @"switchAPPStatus"
#define ISSHOWTASK @"is_show_task"
#define ISCONSULTANT @"propertyconsultant"
#define STATUSCARD @"STATUSCARD"
#define STAGENAME @"stage_name"
#define FAVICON @"favicon"
#define BROKELEVEL @"broke_level"
#define BROKEPHONE @"broker_phone"
#define INVITE @"invite"
#define REALNAME @"real_name"
#define IDENTITY_CARD @"identity_card"
#define SHOWMYTASKRED @"is_show_red"

#define ISFIRSTLOGIN(brokerid) [NSString stringWithFormat:@"isfirstlogin%@",brokerid]

#define ISFIRSTLOGIN_BOOT(phoneNumber) [NSString stringWithFormat:@"isfirstlogin_boot%@",phoneNumber]

//block弱引用 ， WEAK_SELF ， weakSelf
#define WEAK_SELF __weak typeof(self)weakSelf = self;
#define SFDNotice [NSNotificationCenter defaultCenter]

//评论键盘
#define kKeyBoardIphone5 (-44) //- 20;
#define kKeyBoardIphone6 (-44) //- 1;
#define kKeyBoardIphone6p (+228) //+ 270;

//0楼盘 1房源 2招聘 3活动 4人才 5装修
#define kLouPan 0
#define kFangYuan 1
#define kZhaoPin 2
#define kHuoDong 3
#define kRenCai 4
#define kZhuangXiu 5

//定位
#define kDINGWEI @"dingwei"
#define kCITYID @"cityid"
#define kDIMING @"diming"

//筛选
#define kFANGWULEIXING1 @"SHAIXUANFANGWULEIXING1"
#define kQUYUXUANZE1 @"QUYUXUANZE1"
#define kWUYELEIXING1 @"WUYELEIXING1"

#define kXINZI2 @"XINZI2"
#define kQUYU2 @"QUYU2"
#define kZHIWEI2 @"ZHIWEI2"

#define kXINGBIE4 @"XINGBIE4"
#define kXINZI4 @"XINZI4"
#define kQUYU4 @"QUYU4"
#define kXUELI4 @"XUELI4"
#define kZHIWEI4 @"ZHIWEI4"

//消息类型

#define PUrlScheme  @"cnsevendoorAgent"  
#define USERINFOPHONENUMBER   @"userinfophonenumber"
#define kUserMobileNum [[NSUserDefaults standardUserDefaults] objectForKey:@"userinfophonenumber"]

#define KDefault_BlankPhone          @"此用户电话未公开"

#ifdef DEBUG
# define RSDLog(fmt, ...) NSLog((@"\n[File:%s]\n" "[Function:%s]\n" "[Line:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define RSDLog(...);
#endif

/**
 * \@onExit defines some code to be executed when the current scope exits. The
 * code must be enclosed in braces and terminated with a semicolon, and will be
 * executed regardless of how the scope is exited, including from exceptions,
 * \c goto, \c return, \c break, and \c continue.
 *
 * Provided code will go into a block to be executed later. Keep this in mind as
 * it pertains to memory management, restrictions on assignment, etc. Because
 * the code is used within a block, \c return is a legal (though perhaps
 * confusing) way to exit the cleanup block early.
 *
 * Multiple \@onExit statements in the same scope are executed in reverse
 * lexical order. This helps when pairing resource acquisition with \@onExit
 * statements, as it guarantees teardown in the opposite order of acquisition.
 *
 * @note This statement cannot be used within scopes defined without braces
 * (like a one line \c if). In practice, this is not an issue, since \@onExit is
 * a useless construct in such a case anyways.
 */
#define onExit \
rac_keywordify \
__strong rac_cleanupBlock_t metamacro_concat(rac_exitBlock_, __LINE__) __attribute__((cleanup(rac_executeCleanupBlock), unused)) = ^

/**
 * Creates \c __weak shadow variables for each of the variables provided as
 * arguments, which can later be made strong again with #strongify.
 *
 * This is typically used to weakly reference variables in a block, but then
 * ensure that the variables stay alive during the actual execution of the block
 * (if they were live upon entry).
 *
 * See #strongify for an example of usage.
 */
#define weakify(...) \
rac_keywordify \
metamacro_foreach_cxt(rac_weakify_,, __weak, __VA_ARGS__)

/**
 * Like #weakify, but uses \c __unsafe_unretained instead, for targets or
 * classes that do not support weak references.
 */
#define unsafeify(...) \
rac_keywordify \
metamacro_foreach_cxt(rac_weakify_,, __unsafe_unretained, __VA_ARGS__)

/**
 * Strongly references each of the variables provided as arguments, which must
 * have previously been passed to #weakify.
 *
 * The strong references created will shadow the original variable names, such
 * that the original names can be used without issue (and a significantly
 * reduced risk of retain cycles) in the current scope.
 *
 * @code
 
 id foo = [[NSObject alloc] init];
 id bar = [[NSObject alloc] init];
 
 @weakify(foo, bar);
 
 // this block will not keep 'foo' or 'bar' alive
 BOOL (^matchesFooOrBar)(id) = ^ BOOL (id obj){
 // but now, upon entry, 'foo' and 'bar' will stay alive until the block has
 // finished executing
 @strongify(foo, bar);
 
 return [foo isEqual:obj] || [bar isEqual:obj];
 };
 
 * @endcode
 */
#define strongify(...) \
rac_keywordify \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
metamacro_foreach(rac_strongify_,, __VA_ARGS__) \
_Pragma("clang diagnostic pop")

/*** implementation details follow ***/
typedef void (^rac_cleanupBlock_t)();

static inline void rac_executeCleanupBlock (__strong rac_cleanupBlock_t *block) {
    (*block)();
}

#define rac_weakify_(INDEX, CONTEXT, VAR) \
CONTEXT __typeof__(VAR) metamacro_concat(VAR, _weak_) = (VAR);

#define rac_strongify_(INDEX, VAR) \
__strong __typeof__(VAR) VAR = metamacro_concat(VAR, _weak_);

// Details about the choice of backing keyword:
//
// The use of @try/@catch/@finally can cause the compiler to suppress
// return-type warnings.
// The use of @autoreleasepool {} is not optimized away by the compiler,
// resulting in superfluous creation of autorelease pools.
//
// Since neither option is perfect, and with no other alternatives, the
// compromise is to use @autorelease in DEBUG builds to maintain compiler
// analysis, and to use @try/@catch otherwise to avoid insertion of unnecessary
// autorelease pools.

#if DEBUG
#define rac_keywordify autoreleasepool {}
#else
#define rac_keywordify try {} @catch (...) {}
#endif

#define SDUserDefaultsGET(key) [[NSUserDefaults standardUserDefaults] objectForKey:key] // 取
#define SDUserDefaultsSET(object,key) [[NSUserDefaults standardUserDefaults] setObject:object forKey:key]  // 写
#define SDUserDefaultsSynchronize [[NSUserDefaults standardUserDefaults] synchronize] // 存
#define SDUserDefaultsRemove(key) [[NSUserDefaults standardUserDefaults] removeObjectForKey:key]  // 删


#define DEF_SCREEN_XRORMAX CGSizeEqualToSize([[UIScreen mainScreen] bounds].size, CGSizeMake(414, 896))
#define DEF_SCREEN_iPhoneX CGSizeEqualToSize([[UIScreen mainScreen] bounds].size, CGSizeMake(375, 812))

///获取导航栏和状态栏的高度
#define getRectStatusHight [[UIApplication sharedApplication] statusBarFrame].size.height
#define getRectNAVHight self.navigationController.navigationBar.frame.size.height

#define Dec_GREENCOLOR [UIColor colorWithRed:0/255.0f green:175/255.0f blue:54/255.0f alpha:1.0f]
#endif /* Header_h */
