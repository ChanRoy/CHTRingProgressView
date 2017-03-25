//
//  CHTRingProgressView.h
//  CHTRingProgressViewDemo
//
//  Created by cht on 2017/3/23.
//  Copyright © 2017年 cht. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHTRingProgressView : UIControl

@property (nonatomic, strong) UIColor *backgroundRingColor;

@property (nonatomic, strong) UIColor *progressRingColor;

@property (nonatomic, assign) CGFloat progress;

- (instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE; 

- (instancetype)initWithFrame:(CGRect)frame NS_DESIGNATED_INITIALIZER;

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

- (void)setProgress:(CGFloat)progress;

@end
