# CHTRingProgressView
A ring progress view

![CHTRingProgressView](https://github.com/ChanRoy/CHTRingProgressView/blob/master/CHTRingProgressView.gif)

## Introduction

*A ring progress view.*

*The picture above show the usage.*

## Usage

### init method

```
- (instancetype)initWithFrame:(CGRect)frame NS_DESIGNATED_INITIALIZER;
```

### property

```
@property (nonatomic, strong) UIColor *backgroundRingColor;

@property (nonatomic, strong) UIColor *progressRingColor;

@property (nonatomic, assign) CGFloat progress;
```

### interface

```
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

- (void)setProgress:(CGFloat)progress;
```

## Example

```
	_ringView = [[CHTRingProgressView alloc]initWithFrame:CGRectMake(0, 0, 28, 28)];
    [self.view addSubview:_ringView];
    
    _ringView.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
```

```
- (void)updateTimer{
    
    [_ringView setProgress:_count++/10.0 animated:YES];
    
    if (_count > 10) {
        
        [_timer invalidate];
    }   
}
```

More detail showed in the `CHTRingProgressView project`.

## LICENSE

MIT