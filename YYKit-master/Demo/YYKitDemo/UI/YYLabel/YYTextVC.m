//
//  YYTextVC.m
//  YYKitDemo
//
//  Created by qsm on 2018/12/3.
//  Copyright © 2018年 ibireme. All rights reserved.
//

#import "YYTextVC.h"
#import "YYKit.h"

@interface YYTextVC ()<YYTextParser>

@property (nonatomic,strong)YYLabel *yy_label ;


@end

@implementation YYTextVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
    
}


-(void)setupUI
{
    // 1. 创建属性字符串。
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"可以点击的字符串可以点击的字符  串可以点击的字符  串可以点击的字符串可  以点击的字符串可以点击的字符串"];
    
    // 2. 将属性设置为文本，可以使用几乎所有的CoreText属性。
    text.font = [UIFont boldSystemFontOfSize:14];
    
    text.color = [UIColor blueColor];
    
    [text setTextHighlightRange:NSMakeRange(0, (NSUInteger)text.length/2)
                          color:[UIColor orangeColor]
                backgroundColor:[UIColor redColor]
                      tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
                          
                          NSLog(@"--%@",[NSString stringWithFormat:@"Tap: %@", [text.string substringWithRange:range]]);
                          
                          _yy_label.text = [_yy_label.text substringToIndex:_yy_label.text.length-1];
                          
                          
                          //点击文本的操作
//                          [_self showMessage:[NSString stringWithFormat:@"Tap: %@", [text.string substringWithRange:range]]];
                          
                      }];
    
    
    // 3. 设置为YYLabel或YYTextView。
    YYLabel *label = [[YYLabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 200)/2, 250, 200, 200)];
    
    _yy_label = label ;
    
    label.attributedText = text;
    
    label.textParser = self ;
    
    label.shadowColor = [UIColor yellowColor];
    
    label.textAlignment = NSTextAlignmentCenter;
    
    label.textVerticalAlignment = YYTextVerticalAlignmentTop;
    
    label.numberOfLines = 0;
    
    label.backgroundColor = [UIColor colorWithWhite:0.933 alpha:1.000];
    
    label.displaysAsynchronously = YES;   //比较耗时的渲染操作在后台运行
    
    label.clearContentsBeforeAsynchronouslyDisplay = NO;  //在进行后台渲染前是否清除掉之前的内容，如果YES就会先清除之前的内容，可能会出现空白
    //    YYTextContainer  *titleContarer = [YYTextContainer new];
    //    //限制宽度
    //    titleContarer.size = CGSizeMake(SCREEN_WIDTH,CGFLOAT_MAX);
    //    label.textLayout = [YYTextLayout layoutWithContainer:titleContarer text:text];
    //    CGFloat titleLabelHeight = label.textLayout.textBoundingSize.height;
    
    // YYLabel要想自动换行，必须设置最大换行的宽度
    label.preferredMaxLayoutWidth = 150 ;
    
    [self.view addSubview:label];
   
//    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.mas_equalTo(self.view);
//    }];
    

//    NSMutableAttributedString * text = [[NSMutableAttributedString alloc] initWithString:@"谢谢你,我的祖国 ,李世民是一个什么人"];
    
    
    
    
}


- (BOOL)parseText:(nullable NSMutableAttributedString *)text selectedRange:(nullable NSRangePointer)selectedRange
{
    
    NSLog(@"parseText--%@",text);
    
    return YES ;
}
@end
