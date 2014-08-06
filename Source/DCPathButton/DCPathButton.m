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
    if (_expandCenter.x != 0 && _expandCenter.x != expandCenter.x) {
        return ;
    }
    _expandCenter = expandCenter;
}

#pragma mark - Configure ItemsCount

- (void)setItemsCount:(NSUInteger)itemsCount
{
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
        NSLog(@"Not equal");
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
    _pathCenterButton = [[DCPathCenterButton alloc]initWithImage:self.image highlightedImage:self.highlightedImage];
    _pathCenterButton.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    _pathCenterButton.delegate = self;
    [self addSubview:_pathCenterButton];
    
    // Configure the bottom view
    _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, currentScreenWidth, currentScreenHeight)];
    _bottomView.backgroundColor = [UIColor blackColor];
    _bottomView.alpha = 0.0f;
    
}


#pragma mark - Center Button Delegate

- (void)centerButtonTapped
{
    if (self.isSubButtonExpand) {
        //The shrink animtion code here ...
    
        self.frame = CGRectMake(0, 0, originWidth, originHeight);
        self.center = self.expandCenter;
        
        [self addSubview:self.bottomView];
        [UIView animateWithDuration:0.0618f animations:^{
            _bottomView.alpha = 0.0f;
        }];
        
        self.pathCenterButton.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        [self.bottomView removeFromSuperview];
        
        
        for (DCPathItemButton *itemButton in self.itemButtons) {
            [itemButton performSelector:@selector(removeFromSuperview)];
        }
        
        _subButtonExpand = NO;
        
        return ;
    }
    
    //The expand animation code here ...
    //1. Store the current center point
    
    _expandCenter = self.center;
    
    self.frame = CGRectMake(0, 0, currentScreenWidth, currentScreenHeight);
    self.center = CGPointMake(currentScreenWidth/2, currentScreenHeight/2);
    
    [self insertSubview:self.bottomView belowSubview:self.pathCenterButton];
    [UIView animateWithDuration:0.0618f animations:^{
        _bottomView.alpha = 0.618f;
    }];
    
    self.pathCenterButton.center = centerButtonExpandCenter;
    
    // Configure the item buttons
    
    CGFloat basicAngel = 180 / (_itemsCount + 1) ;
    
    NSLog(@"Basic angel : %f", basicAngel);
    
    for (int i = 1; i <= self.itemsCount; i++) {
        DCPathItemButton *pathItemButton = [[DCPathItemButton alloc]initWithImage:self.itemButtonImages[i - 1]
                                                                 highlightedImage:self.itemButtonHighlightedImages[i - 1]
                                                                  backgroundImage:self.itemButtonBackgroundImages[i - 1]
                                                       backgroundHighlightedImage:self.itemButtonBackgroundHighlightedImages[i - 1]];
        CGFloat currentAngel = (basicAngel * i)/180;
        
        
        pathItemButton.center = CGPointMake(centerButtonExpandCenter.x - cosf(currentAngel * M_PI) * self.itemExpandRadius,
                                            centerButtonExpandCenter.y - sinf(currentAngel * M_PI) * self.itemExpandRadius);
        
        NSLog(@"Location : (%.0f, %.0f)", pathItemButton.center.x, pathItemButton.center.y);
        
        [self addSubview:pathItemButton];
        
        [self.itemButtons insertObject:pathItemButton atIndex:i - 1];
    }
    
    _subButtonExpand = YES;
}

#pragma mark - Item Button Delegate

- (void)itemButtonTapped
{
    
}

#pragma mark - DCPathButton Touch Events

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //The shrink code here ...
    
    NSLog(@"DCPathButton Tapped");
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //Something after the shrink animation code ...
    
}

@end
