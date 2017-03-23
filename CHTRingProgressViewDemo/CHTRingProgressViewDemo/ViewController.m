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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CHTRingProgressView *ringView = [[CHTRingProgressView alloc]initWithFrame:CGRectMake(0, 0, 28, 28)];
    [self.view addSubview:ringView];
    
    ringView.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
    
//    [ringView setProgress:0.5 animated:YES];
    
    __block NSInteger count = 0;
    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
       
        NSLog(@"---%ld",count);
        [ringView setProgress:count++/10 animated:NO];
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
