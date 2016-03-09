//
//  DJStatusBarHUD.m
//  状态栏
//
//  Created by 贺进立 on 16/3/7.
//  Copyright © 2016年 贺进立. All rights reserved.
//

#import "DJStatusBarHUD.h"

@implementation DJStatusBarHUD
/**定时器*/
static NSTimer *timer_;
/**全局的窗口*/
static UIWindow *window_;
+ (void)setUpWindow
{
    CGFloat H = 20;
    CGRect frame = CGRectMake(0, -H, [UIScreen mainScreen].bounds.size.width, H);
    window_ = [[UIWindow alloc]init];
    window_.hidden = YES;
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = frame;
    window_.hidden = NO;
    //动画
    frame.origin.y = 0;
    [UIView animateWithDuration:0.5 animations:^{
        window_.frame = frame;
    }];
}
/**
 *显示成功信息
 */
+(void)showSuccess:(NSString*)msg
{
    [self showMsg:msg image:[UIImage imageNamed:@"DJStatusBarHUD.bundle/success"]];

}
/**
 *显示失败信息
 */
+(void)showError:(NSString*)msg
{
    [self showMsg:msg image:[UIImage imageNamed:@"DJStatusBarHUD.bundle/error"]];
}
/**
 *显示文字
 */
+(void)showMsg:(NSString*)msg
{
   [self showMsg:msg image:nil];
}
/**
 *显示正在加载信息
 */
+(void)showLoading:(NSString*)msg
{
    [timer_ invalidate];
    timer_ = nil;
    [self setUpWindow];
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:12];
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor redColor];
    [window_ addSubview:label];
    UIActivityIndicatorView * loadingView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}].width;
    CGFloat centerX = (window_.frame.size.width-msgW)*0.5 - 20;
    CGFloat centerY = window_.frame.size.height;
    loadingView.center = CGPointMake(centerX
                                     , centerY);
    [window_ addSubview:loadingView];
    
}
/**
 *显示文字+图片（通用）
 */
+(void)showMsg:(NSString*)msg image:(UIImage*)image
{
    //停止定时器
    [timer_ invalidate];
    timer_ = nil;
    [self setUpWindow];
    //添加按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:msg forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    btn.frame = window_.bounds;
    if (image)
    {
        [btn setImage:image forState:UIControlStateNormal];
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    [window_ addSubview:btn];
    //定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(hide) userInfo:nil repeats:NO];
}
/**
 *隐藏
 */
+ (void)hide
{
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = -frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        
        window_ = nil;
        timer_ = nil;
    }];
}
@end
