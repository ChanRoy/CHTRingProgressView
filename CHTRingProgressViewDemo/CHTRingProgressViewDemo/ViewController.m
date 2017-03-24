//
//  ViewController.m
//  CHTRingProgressViewDemo
//
//  Created by cht on 2017/3/23.
//  Copyright © 2017年 cht. All rights reserved.
//

#import "ViewController.h"
#import "CHTRingProgressView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (nonatomic, strong) CHTRingProgressView *ringView;

@end

@implementation ViewController{
    
    NSInteger _count;
    NSTimer *_timer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _ringView = [[CHTRingProgressView alloc]initWithFrame:CGRectMake(0, 0, 28, 28)];
    [self.view addSubview:_ringView];
    
    _ringView.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
}

- (void)updateTimer{
    
    [_ringView setProgress:_count++/10.0 animated:YES];
    
    if (_count > 10) {
        
        [_timer invalidate];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
