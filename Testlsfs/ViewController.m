//
//  ViewController.m
//  Testlsfs
//
//  Created by Linyoung on 2017/7/11.
//  Copyright © 2017年 Linyoung. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationController+ProgressBar.h"

@interface ViewController ()

@property (assign, nonatomic) float progress;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(30, 80, 80, 45)];
    btn.layer.borderColor = [UIColor blueColor].CGColor;
    btn.layer.borderWidth = 1;
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 5;
    [btn setTitle:@"动画" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnAction:(UIButton *)sender {
    //开始动画
   self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
}

- (void)timerAction:(NSTimer *)timer {

    self.progress +=0.1;
    [self.navigationController showProgress:self.progress withBarColor:nil];
    if (self.progress >= 1) {
        [self.timer invalidate];
        self.timer = nil;
        self.progress = 0;
//        [self.navigationController hiddenProgeree];
        return;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
