//
//  UINavigationController+ProgressBar.h
//  LocalizationsProject
//
//  Created by Linyoung on 2017/7/11.
//  Copyright © 2017年 Linyoung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (ProgressBar)

@property (strong, nonatomic) UIColor *barColor;

- (void)showProgress:(CGFloat)progress;

- (void)showProgress:(CGFloat)progress withBarColor:(UIColor *)barColor;

//- (void)hiddenProgeree;

@end
