//
//  UINavigationController+ProgressBar.m
//  LocalizationsProject
//
//  Created by Linyoung on 2017/7/11.
//  Copyright © 2017年 Linyoung. All rights reserved.
//

#import "UINavigationController+ProgressBar.h"
#import <objc/runtime.h>

@interface UINavigationController ()

@property (assign, nonatomic) CGFloat lineWidth;//进度条的宽度
@property (strong, nonatomic) UIView *progressView;
@property (strong, nonatomic) CAGradientLayer *gradientLayer;

@end

@implementation UINavigationController (ProgressBar)

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createProgressBar];
}


#pragma mark - private methords

- (void)showProgress:(CGFloat)progress {
    [self showProgress:progress withBarColor:nil];
}

- (void)showProgress:(CGFloat)progress withBarColor:(UIColor *)barColor {
    if (barColor) {
        self.barColor = barColor;
    } else {
        self.barColor = [UIColor colorWithRed:65.0/255.0 green:105.0/255.0 blue:225.0/255.0 alpha:1];
    }
    if (self.gradientLayer.colors.count == 0) {
        self.gradientLayer.colors =  @[(__bridge id)self.barColor.CGColor, (__bridge id)[UIColor whiteColor].CGColor];
    }
    CGRect frame = CGRectMake(0,CGRectGetHeight(self.navigationBar.frame)-self.lineWidth, CGRectGetWidth(self.navigationBar.frame)*progress, self.lineWidth);
    self.progressView.frame = frame;
    self.gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.progressView.frame), self.lineWidth);
    if (progress >= 1) {
        [self performSelector:@selector(hiddenProgeree) withObject:nil afterDelay:0.6];
    }
}

- (void)hiddenProgeree {
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.progressView.frame = CGRectMake(CGRectGetWidth(self.navigationBar.frame),CGRectGetHeight(self.navigationBar.frame)-self.lineWidth, CGRectGetWidth(self.navigationBar.frame), self.lineWidth);
    } completion:^(BOOL finished) {
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        self.progressView.frame = CGRectMake(0,CGRectGetHeight(self.navigationBar.frame)-self.lineWidth, 0, self.lineWidth);
        self.gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.progressView.frame), self.lineWidth);
        [CATransaction commit];
    }];
}

- (void)createProgressBar {
    if (!self.progressView) {
        self.lineWidth = 5.0;
        self.progressView = [[UIView alloc] initWithFrame:CGRectMake(0,CGRectGetHeight(self.navigationBar.frame)-self.lineWidth, 0, self.lineWidth)];
        [self.navigationBar addSubview:self.progressView];
        self.gradientLayer = [CAGradientLayer layer];
        self.gradientLayer.locations = @[@0.5];
        self.gradientLayer.startPoint = CGPointMake(1.0, 0);
        self.gradientLayer.endPoint = CGPointMake(0, 0);
        self.gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.progressView.frame), self.lineWidth);
        self.gradientLayer.cornerRadius = self.lineWidth/2.0;
        [self.progressView.layer addSublayer:self.gradientLayer];
    }
}

#pragma mark - set and get

- (void)setBarColor:(UIColor *)barColor {
    objc_setAssociatedObject(self, @selector(setBarColor:), barColor, OBJC_ASSOCIATION_RETAIN);
}

- (UIColor *)barColor {
    return objc_getAssociatedObject(self, @selector(setBarColor:));
}

- (void)setProgressView:(UIView *)progressView {
    objc_setAssociatedObject(self, @selector(setProgressView:), progressView, OBJC_ASSOCIATION_RETAIN);
}

- (UIView *)progressView {
    return objc_getAssociatedObject(self, @selector(setProgressView:));
}


- (void)setLineWidth:(CGFloat)lineWidth {
    objc_setAssociatedObject(self, @selector(setLineWidth:), @(lineWidth), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)lineWidth {
    return [objc_getAssociatedObject(self, @selector(setLineWidth:)) floatValue];
}

- (void)setGradientLayer:(CAGradientLayer *)gradientLayer {
    objc_setAssociatedObject(self, @selector(setGradientLayer:), gradientLayer, OBJC_ASSOCIATION_RETAIN);
}

- (CAGradientLayer *)gradientLayer {
    return objc_getAssociatedObject(self, @selector(setGradientLayer:));
}



@end
