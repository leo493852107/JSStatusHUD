//
//  JSStatusBarHUD.m
//  JSStatusHUD
//
//  Created by leo on 5/7/16.
//  Copyright © 2016 leo. All rights reserved.
//

#import "JSStatusBarHUD.h"

#define JSMessageFont [UIFont systemFontOfSize:12]


/** 消息停留时间 */
static CGFloat const JSMessageDuration = 2.0;

@implementation JSStatusBarHUD

/** 全局窗口 */
static UIWindow *window_;


/** 定时器 */
static NSTimer *timer_;


/**
 *  显示窗口
 */
+ (void)showWindow {
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20);
    window_.hidden = NO;
}

/**
 *  显示普通信息
 *
 *  @param msg   文字
 *  @param image 图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image {
    // 停止定时器
    [timer_ invalidate];
    
    // 显示窗口
    [self showWindow];
    
    // 添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = JSMessageFont;
    // 如果有图片
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    // 定时消失(定时器)
    timer_ = [NSTimer scheduledTimerWithTimeInterval:JSMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

/**
 *  显示普通信息
 */
+ (void)showMessage:(NSString *)msg {
    [self showMessage:msg image:nil];
}

/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)msg {
    [self showMessage:msg image:[UIImage imageNamed:@"success"]];
    
}

/**
 *  显示失败信息
 */
+ (void)showError:(NSString *)msg {
    [self showMessage:msg image:[UIImage imageNamed:@"error"]];
}

/**
 *  显示正在处理信息
 */
+ (void)showLoading:(NSString *)msg {
    // 显示窗口
    [self showWindow];

    
    // 文字
    UILabel *label = [[UILabel alloc] init];
    label.font = JSMessageFont;
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];
    
    // 添加圈圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    // 算出文字的宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : JSMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
    
}

/**
 *  隐藏
 */
+ (void)hide {
    window_ = nil;
    timer_ = nil;
}

@end
