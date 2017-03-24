//
//  CHTRingProgressView.m
//  CHTRingProgressViewDemo
//
//  Created by cht on 2017/3/23.
//  Copyright © 2017年 cht. All rights reserved.
//

#import "CHTRingProgressView.h"

#define kRingRadius 20.0
#define kRingWidth 4.0

@interface CHTRingProgressView ()

@property (nonatomic, strong) CAShapeLayer *bgRingLayer;

@property (nonatomic, strong) CAShapeLayer *progressLayer;

@end

@implementation CHTRingProgressView

#pragma mark - init method

- (instancetype)init
{
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, kRingRadius, kRingRadius)];
    if (self) {
        
        [self initialize];
        
        [self setupBgRingLayer];
        
        [self setupProgressLayer];
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        [self initialize];
        
        [self setupBgRingLayer];
        
        [self setupProgressLayer];
    }
    return self;
}

#pragma mark - private method
- (void)initialize{
    
    _backgroundRingColor = [UIColor colorWithRed:60/ 255.0 green:60/ 255.0 blue:60/ 255.0 alpha:1];;
    _progressRingColor = [UIColor whiteColor];
}

- (void)setupBgRingLayer{
    
    _bgRingLayer = [CAShapeLayer new];
    _bgRingLayer.frame = self.bounds;
    _bgRingLayer.lineWidth = kRingWidth;
    _bgRingLayer.strokeColor = _backgroundRingColor.CGColor;
    _bgRingLayer.fillColor = nil;
    _bgRingLayer.lineCap = kCALineCapRound;
    
    CGPoint center = CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2);
    UIBezierPath *bgPath = [UIBezierPath bezierPathWithArcCenter:center radius:kRingRadius-kRingWidth/2 startAngle:-0.5f * M_PI endAngle:1.5f * M_PI clockwise:YES];
    _bgRingLayer.path = [bgPath CGPath];
    
    [self.layer addSublayer:_bgRingLayer];
}

- (void)setupProgressLayer{
    
    _progressLayer = [CAShapeLayer new];
    _progressLayer.frame = self.bounds;
    _progressLayer.lineWidth = kRingWidth;
    _progressLayer.strokeColor = _progressRingColor.CGColor;
    _progressLayer.fillColor = nil;
    _progressLayer.lineCap = kCALineCapRound;
    
    [self.layer addSublayer:_progressLayer];

}

#pragma mark - public method
- (void)setProgress:(CGFloat)progress{
    
    [self setProgress:progress animated:NO];
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated{
    
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    self.progressLayer.path = [UIBezierPath bezierPathWithArcCenter:center
                                                             radius:kRingRadius-kRingWidth/2
                                                         startAngle:-0.5f * M_PI
                                                           endAngle:1.5f * M_PI
                                                          clockwise:YES].CGPath;
    
    if (animated) {
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        animation.fromValue = _progress <= 0 ? @(0): nil;
        animation.toValue = [NSNumber numberWithFloat:progress];
        animation.duration = 0.25;
        self.progressLayer.strokeEnd = progress;
        
        [self.progressLayer addAnimation:animation forKey:@"animation"];
    } else {
        
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        self.progressLayer.strokeEnd = progress;
        [CATransaction commit];
    }
    
    _progress = progress;
}


@end
