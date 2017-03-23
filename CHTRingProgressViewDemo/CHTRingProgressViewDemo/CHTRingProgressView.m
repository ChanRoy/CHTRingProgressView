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

@property (nonatomic, assign) CGFloat progress;

@end

@implementation CHTRingProgressView

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

- (void)initialize{
    
    _ringTintColor = [UIColor blackColor];
}

- (void)setupBgRingLayer{
    
    _bgRingLayer = [CAShapeLayer new];
    _bgRingLayer.frame = self.bounds;
    _bgRingLayer.lineWidth = kRingWidth;
    _bgRingLayer.strokeColor = _ringTintColor.CGColor;
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
    _progressLayer.strokeColor = [UIColor orangeColor].CGColor;
    _progressLayer.fillColor = nil;
    _progressLayer.lineCap = kCALineCapRound;
    
    CGPoint center = CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2);
//    UIBezierPath *trackPath = [UIBezierPath bezierPathWithArcCenter:center radius:kRingRadius-kRingWidth/2 startAngle:-0.5f * M_PI endAngle:(-0.5+2*_trackPercent) * M_PI clockwise:YES];
//    _progressLayer.path = [trackPath CGPath];
    
    [self.layer addSublayer:_progressLayer];

}

- (void)setProgress:(CGFloat)progress{
    
    [self setProgress:progress animated:NO];
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated{
    
    _progress = progress;
    
    if (progress > 0) {
        BOOL startingFromIndeterminateState = [self.progressLayer animationForKey:@"indeterminateAnimation"] != nil;
        
//        [self stopIndeterminateAnimation];
        
        self.progressLayer.lineWidth = kRingWidth;
        
        self.progressLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))
                                                              radius:kRingRadius-kRingWidth/2
                                                          startAngle:3*M_PI_2
                                                            endAngle:3*M_PI_2 + 2*M_PI
                                                           clockwise:YES].CGPath;
        
        if (animated) {
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            animation.fromValue = @(0);
            animation.toValue = [NSNumber numberWithFloat:progress];
            animation.duration = 2;
            self.progressLayer.strokeEnd = progress;
            
            [self.progressLayer addAnimation:animation forKey:@"animation"];
        } else {
            [CATransaction begin];
            [CATransaction setDisableActions:YES];
            self.progressLayer.strokeEnd = progress;
            [CATransaction commit];
        }
    } else {
        // If progress is zero, then add the indeterminate animation
        [self.progressLayer removeAnimationForKey:@"animation"];
        
//        [self startIndeterminateAnimation];
    }

}

@end
