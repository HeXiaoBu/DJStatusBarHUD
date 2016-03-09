//
//  DJStatusBarHUD.h
//  状态栏
//
//  Created by 贺进立 on 16/3/7.
//  Copyright © 2016年 贺进立. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DJStatusBarHUD : NSObject

/**
 *显示成功信息
 */
+(void)showSuccess:(NSString*)msg;
/**
 *显示失败信息
 */
+(void)showError:(NSString*)msg;
/**
 *显示正在加载信息
 */
+(void)showLoading:(NSString*)msg;
/**
 *显示文字
 */
+(void)showMsg:(NSString*)msg;
/**
 *显示文字+图片（通用）
 */
+(void)showMsg:(NSString*)msg image:(UIImage*)image;
/**
 *隐藏
 */
+ (void)hide;
@end
