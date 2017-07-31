//
//  ViewController.m
//  Testlsfs
//
//  Created by Linyoung on 2017/7/11.
//  Copyright © 2017年 Linyoung. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationController+ProgressBar.h"
#import "ImageHelper.h"


@interface ViewController ()

@property (assign, nonatomic) float progress;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) UIButton *downloadBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.downloadBtn.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width-120)/2.0, [UIScreen mainScreen].bounds.size.height - 150, 120, 50);
    [self.view addSubview:self.downloadBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - event response

- (void)btnAction:(UIButton *)sender {
    //开始动画
    sender.userInteractionEnabled = NO;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
}

- (void)timerAction:(NSTimer *)timer {
    self.progress +=0.3;
    [self.navigationController showProgress:self.progress withBarColor:nil];
    if (self.progress >= 1) {
        [self.timer invalidate];
        self.timer = nil;
        self.progress = 0;
        self.downloadBtn.userInteractionEnabled = YES;
        return;
    }
}

#pragma mark - set and get

- (UIButton *)downloadBtn {
    if (_downloadBtn == nil) {
        _downloadBtn = [[UIButton alloc] init];
        _downloadBtn.layer.cornerRadius = 5;
        _downloadBtn.layer.masksToBounds = YES;
        [_downloadBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
        [_downloadBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
        [_downloadBtn setTitle:@"下载" forState:UIControlStateNormal];
        [_downloadBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _downloadBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_downloadBtn setBackgroundImage:[ImageHelper drawImageWithColor:[UIColor colorWithRed:255.0/255.0 green:215.0/255.0 blue:0 alpha:1]] forState:UIControlStateNormal];
        [_downloadBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _downloadBtn;
}



@end
