//
//  DCPathButton.m
//  DCPathButton
//
//  Created by tang dixi on 30/7/14.
//  Copyright (c) 2014 Tangdxi. All rights reserved.
//

#import "DCPathButton.h"
#import "DCPathCenterButton.h"
#import "DCPathButtonInstances.h"
#import "DCPathItemButton.h"

@interface DCPathButton ()<DCPathCenterButtonDelegate, DCPathItemButtonDelegate>

#pragma mark - Private Property

@property (assign, nonatomic, getter = isSubButtonExpand) BOOL subButtonExpand;

@property (assign, nonatomic) CGPoint expandCenter;
@property (strong, nonatomic) UIView *bottomView;
@property (strong, nonatomic) DCPathCenterButton *pathCenterButton;
@property (strong, nonatomic) NSMutableArray *itemButtons;

@property (strong, nonatomic) NSTimer *runloopTimer;

@end

@implementation DCPathButton

@synthesize subButtonExpand = _subButtonExpand;
@synthesize pathCenterButton = _pathCenterButton;

#pragma mark - Initialization

- (id)init
{
    if (self = [super init]) {
        
        
        self.frame = CGRectMake(0, 0, originWidth, originHeight);
        self.center = originCenter;
        
        _image = [UIImage imageNamed:@"chooser-button-tab"];
        _highlightedImage = [UIImage imageNamed:@"chooser-button-tab-highlighted"];
        _expandCenter = CGPointZero;
        
        _itemButtonImages = [[NSMutableArray alloc]initWithArray:@[
                                                                   [UIImage imageNamed:@"chooser-moment-icon-music"],
                                                                   [UIImage imageNamed:@"chooser-moment-icon-location"],
                                                                   [UIImage imageNamed:@"chooser-moment-icon-camera"],
                                                                   [UIImage imageNamed:@"chooser-moment-icon-thought"],
                                                                   [UIImage imageNamed:@"chooser-moment-icon-sleep"]
                                                                   ]];
        _itemButtonHighlightedImages = [[NSMutableArray alloc]initWithArray:@[
                                                                              [UIImage imageNamed:@"chooser-moment-icon-music-highlighted"],
                                                                              [UIImage imageNamed:@"chooser-moment-icon-location-highlighted"],
                                                                              [UIImage imageNamed:@"chooser-moment-icon-camera-highlighted"],
                                                                              [UIImage imageNamed:@"chooser-moment-icon-thought-highlighted"],
                                                                              [UIImage imageNamed:@"chooser-moment-icon-sleep-highlighted"]
                                                                              ]];
        _itemButtonBackgroundImages = [[NSMutableArray alloc]initWithArray:@[
                                                                             [UIImage imageNamed:@"chooser-moment-button"],
                                                                             [UIImage imageNamed:@"chooser-moment-button"],
                                                                             [UIImage imageNamed:@"chooser-moment-button"],
                                                                             [UIImage imageNamed:@"chooser-moment-button"],
                                                                             [UIImage imageNamed:@"chooser-moment-button"]
                                                                             ]];
        _itemButtonBackgroundHighlightedImages = [[NSMutableArray alloc]initWithArray:@[
                                                                                        [UIImage imageNamed:@"chooser-moment-button-highlighted"],
                                                                                        [UIImage imageNamed:@"chooser-moment-button-highlighted"],
                                                                                        [UIImage imageNamed:@"chooser-moment-button-highlighted"],
                                                                                        [UIImage imageNamed:@"chooser-moment-button-highlighted"],
                                                                                        [UIImage imageNamed:@"chooser-moment-button-highlighted"]
                                                                                        ]];
        
        // Init basic parameters
        
        _subButtonExpand = NO;
        _itemsCount = _itemButtonImages.count;
        _itemButtons = [[NSMutableArray alloc]initWithCapacity:self.itemsCount];
        _itemExpandRadius = 110;
        
        [self configureViews];
    }
    return self;
}

#pragma mark - Configure Center Button Images

- (void)setImage:(UIImage *)image
{
    NSAssert(image, @"Load image failed! >_< ");
    if (![image isEqual:_image]) {
        _image = image;
    }
}

- (void)setHighlightedImage:(UIImage *)highlightedImage
{
    NSAssert(highlightedImage, @"Load highlight image failed! >_< ");
    if (![highlightedImage isEqual:_highlightedImage]) {
        _highlightedImage = highlightedImage;
    }
}

#pragma mark - Configure Expand Center Point

- (void)setExpandCenter:(CGPoint)expandCenter
{
    // Just store the center point once
    //
    if (_expandCenter.x != 0 && _expandCenter.x != expandCenter.x) {
        return ;
    }
    _expandCenter = expandCenter;
}

#pragma mark - Configure ItemsCount

- (void)setItemsCount:(NSUInteger)itemsCount
{
    // DCPathButton just support 1 to 5 item button
    //
    NSAssert((itemsCount > 0 && itemsCount <= 5), @"Oops... The DCPathButton just support 1 ~ 5 items >_< ");
    
    if (itemsCount != _itemsCount) {
        _itemsCount = itemsCount;
    }
}

#pragma mark - Expand Status

- (BOOL)isSubButtonExpand
{
    return _subButtonExpand;
}

#pragma mark - Item Button Images

- (void)setItemButtonImages:(NSMutableArray *)itemButtonImages
{
    NSAssert(itemButtonImages.count >= self.itemsCount, @"The item button images' number should equal to the items count");
    
    if (itemButtonImages && ![itemButtonImages isEqual:_itemButtonImages]) {
        _itemButtonImages = itemButtonImages;
    }
}

- (void)setItemButtonHighlightedImages:(NSMutableArray *)itemButtonHighlightedImages
{
    NSAssert(itemButtonHighlightedImages.count >= self.itemsCount, @"The item button highlighted images' number should equal to the items count");
    
    if (! [itemButtonHighlightedImages isEqual:_itemButtonHighlightedImages]) {
        _itemButtonHighlightedImages = itemButtonHighlightedImages;
    }
}

- (void)setItemButtonBackgroundImages:(NSMutableArray *)itemButtonBackgroundImages
{
    NSAssert(itemButtonBackgroundImages.count >= self.itemsCount, @"The item button background images' number should equal to the items count");
    
    if (! [itemButtonBackgroundImages isEqual:_itemButtonBackgroundImages]) {
        _itemButtonBackgroundImages = itemButtonBackgroundImages;
    }
}

- (void)setItemButtonBackgroundHighlightedImages:(NSMutableArray *)itemButtonBackgroundHighlightedImages
{
    NSAssert(itemButtonBackgroundHighlightedImages.count >= self.itemsCount, @"The item button background highlighted images' number should equal to the items count");
    
    if (! [itemButtonBackgroundHighlightedImages isEqual:_itemButtonBackgroundHighlightedImages]) {
        _itemButtonBackgroundHighlightedImages = itemButtonBackgroundHighlightedImages;
    }
}

#pragma mark - Configure Views

- (void)configureViews
{
    // Configure center button
    //
    _pathCenterButton = [[DCPathCenterButton alloc]initWithImage:self.image highlightedImage:self.highlightedImage];
    _pathCenterButton.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    _pathCenterButton.delegate = self;
    [self addSubview:_pathCenterButton];
    
    // Configure bottom view
    //
    _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, currentScreenWidth, currentScreenHeight)];
    _bottomView.backgroundColor = [UIColor blackColor];
    _bottomView.alpha = 0.0f;
    
}


#pragma mark - Center Button Delegate

- (void)centerButtonTapped
{
    if (self.isSubButtonExpand) {
        [self configureShrink];
        return ;
    }
    [self configureExpand];
}

- (CGPoint)createEndPointWithRadius:(CGFloat)itemExpandRadius andAngel:(CGFloat)angel
{
    CGPoint point = CGPointMake(centerButtonExpandCenter.x - cosf(angel * M_PI) * itemExpandRadius,
                       centerButtonExpandCenter.y - sinf(angel * M_PI) * itemExpandRadius);
    return point;
}

- (void)configureShrink
{
    
    [UIView animateWithDuration:0.0618f * 3
                          delay:0.0618f * 2
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         _pathCenterButton.transform = CGAffineTransformMakeRotation(0);
                     }
                     completion:nil];
    
    for (int i = 0; i < self.itemsCount; i++) {
        DCPathItemButton *itemButton = self.itemButtons[i];
        CAAnimationGroup *shrinkAnimation = [self shrinkAnimationFromPoint:itemButton.center];
        [itemButton.layer addAnimation:shrinkAnimation forKey:@"Shrink"];
        itemButton.center = centerButtonExpandCenter;
    }
    
    [self bringSubviewToFront:self.pathCenterButton];
    
    [UIView animateWithDuration:0.0618f * 2
                     animations:^{
                          //_bottomView.alpha = 0.0f;
                     }];
    
    
    // Remove all item buttons
    //
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0618f * 5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for (DCPathItemButton *itemButton in self.itemButtons) {
            [itemButton performSelector:@selector(removeFromSuperview)];
        }
        
        self.frame = CGRectMake(0, 0, originWidth, originHeight);
        self.center = self.expandCenter;
        self.pathCenterButton.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        
        [self.bottomView removeFromSuperview];
        [self.itemButtons removeAllObjects];
    });
    
    _subButtonExpand = NO;
    
}

- (CAAnimationGroup *)shrinkAnimationFromPoint:(CGPoint)endPoint
{
    // 1.Configure rotation animation
    //
    CAKeyframeAnimation *rotationAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.values = @[@(-M_PI * 4), @(0.0f)];
    rotationAnimation.duration = 0.0618f * 5;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    // 2.Configure moving animation
    //
    CAKeyframeAnimation *movingAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    // Create moving path
    //
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, endPoint.x, endPoint.y);
    CGPathAddLineToPoint(path, NULL, centerButtonExpandCenter.x, centerButtonExpandCenter.y);
    
    movingAnimation.path = path;
    movingAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    movingAnimation.duration = 0.0618f * 5;
    CGPathRelease(path);
    
    // 3.Merge animation together
    //
    CAAnimationGroup *animations = [CAAnimationGroup animation];
    animations.animations = @[rotationAnimation, movingAnimation];
    animations.duration = 0.0618f * 5;
    
    return animations;
}

#pragma mark - Configure Expand

- (void)configureExpand
{
    // The expand code here ...
    // 1. Store the current center point
    //
    _expandCenter = self.center;
    
    self.frame = CGRectMake(0, 0, currentScreenWidth, currentScreenHeight);
    self.center = CGPointMake(currentScreenWidth/2, currentScreenHeight/2);
    
    [self insertSubview:self.bottomView belowSubview:self.pathCenterButton];
    
    
    [UIView animateWithDuration:0.0618f * 3
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         _bottomView.alpha = 0.618f;
                     }
                     completion:nil];
    
    [UIView animateWithDuration:0.0618f * 5
                     animations:^{
                         _pathCenterButton.transform = CGAffineTransformMakeRotation(-0.75f * M_PI);
                     }];
    
    self.pathCenterButton.center = centerButtonExpandCenter;
    
    // Configure the item buttons
    //
    CGFloat basicAngel = 180 / (_itemsCount + 1) ;
    
    for (int i = 1; i <= self.itemsCount; i++) {
        
        DCPathItemButton *pathItemButton = [[DCPathItemButton alloc]initWithImage:self.itemButtonImages[i - 1]
                                                                 highlightedImage:self.itemButtonHighlightedImages[i - 1]
                                                                  backgroundImage:self.itemButtonBackgroundImages[i - 1]
                                                       backgroundHighlightedImage:self.itemButtonBackgroundHighlightedImages[i - 1]];
        pathItemButton.delegate = self;
        pathItemButton.tag = i - 1;
        // 1.Add pathItem button to the view
        //
        CGFloat currentAngel = (basicAngel * i)/180;
        pathItemButton.center = centerButtonExpandCenter;
        [self insertSubview:pathItemButton belowSubview:self.pathCenterButton];
        
        // 2.Excute expand animation
        //
        CGPoint endPoint = [self createEndPointWithRadius:self.itemExpandRadius andAngel:currentAngel];
        CGPoint farPoint = [self createEndPointWithRadius:self.itemExpandRadius + 10.0f andAngel:currentAngel];
        
        CAAnimationGroup *expandAnimation = [self expandAnimationWithEndPoint:endPoint
                                                                  andFarPoint:farPoint];
        [pathItemButton.layer addAnimation:expandAnimation forKey:@"ExpandAnimation"];
        pathItemButton.center = endPoint;
        
        [self.itemButtons insertObject:pathItemButton atIndex:i - 1];
    }
    
    _subButtonExpand = YES;

}

- (CAAnimationGroup *)expandAnimationWithEndPoint:(CGPoint)endPoint andFarPoint:(CGPoint)farPoint
{
    // 1.Configure rotation animation
    //
    CAKeyframeAnimation *rotationAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.values = @[@(M_PI * 4), @(0.0f)];
    rotationAnimation.duration = 0.0618f * 6;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    // 2.Configure moving animation
    //
    CAKeyframeAnimation *movingAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    // Create moving path
    //
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, centerButtonExpandCenter.x, centerButtonExpandCenter.y);
    CGPathAddLineToPoint(path, NULL, farPoint.x, farPoint.y);
    CGPathAddLineToPoint(path, NULL, endPoint.x, endPoint.y);
    
    movingAnimation.path = path;
    movingAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    movingAnimation.duration = 0.0618f * 6;
    CGPathRelease(path);
    
    // 3.Merge two animation together
    //
    CAAnimationGroup *animations = [CAAnimationGroup animation];
    animations.animations = @[movingAnimation, rotationAnimation];
    animations.duration = 0.0618f * 6;
    animations.delegate = self;
    
    return animations;
}

#pragma mark - DCPathButton Item Delegate

- (void)itemButtonTapped:(DCPathItemButton *)itemButton
{
    for (int i = 0; i < self.itemsCount; i++) {
        if (itemButton.tag == i) {
            // Blow up code here ...
            
            continue;
        }
        
        // Scale code here ...
        
        
    }
    if ([_delegate respondsToSelector:@selector(itemButtonTappedAtIndex:)]) {
        [_delegate itemButtonTappedAtIndex:itemButton.tag];
    }
}

#pragma mark - DCPathButton Touch Events

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //The shrink code here ...
    [self centerButtonTapped];
    
    NSLog(@"DCPathButton Tapped");
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //Something after the shrink animation code ...
    
}

@end
