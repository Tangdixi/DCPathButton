//
//  DCPathButton.h
//  DCPathButton
//
//  Created by tang dixi on 30/7/14.
//  Copyright (c) 2014 Tangdxi. All rights reserved.
//

#import "DCPathItemButton.h"

@import UIKit;
@import QuartzCore;
@import AudioToolbox;

typedef NS_ENUM(NSUInteger, DCPathButtonBloomDirection) {
    DCPathButtonBloomTop,
    DCPathButtonBloomLeft,
    DCPathButtonBloomBottom,
    DCPathButtonBloomRight,
};

@protocol DCPathButtonDelegate <NSObject>

- (void)itemButtonTappedAtIndex:(NSUInteger)index;

@end

@interface DCPathButton : UIView <UIGestureRecognizerDelegate>

@property (weak, nonatomic) id<DCPathButtonDelegate> delegate;

@property (strong, nonatomic) NSMutableArray *itemButtonImages;
@property (strong, nonatomic) NSMutableArray *itemButtonHighlightedImages;

@property (strong, nonatomic) UIImage *itemButtonBackgroundImage;
@property (strong, nonatomic) UIImage *itemButtonBackgroundHighlightedImage;

@property (assign, nonatomic) CGFloat bloomRadius;
@property (assign, nonatomic) CGPoint dcButtonCenter;

@property (nonatomic) DCPathButtonBloomDirection bloomDirection;
@property (nonatomic) BOOL soundsEnable;
@property (nonatomic) BOOL centerBtnRotationEnable;

- (id)initWithCenterImage:(UIImage *)centerImage hilightedImage:(UIImage *)centerHighlightedImage;
- (id)initWithButtonFrame:(CGRect)centerBtnFrame CenterImage:(UIImage *)centerImage hilightedImage:(UIImage *)centerHighlightedImage;
- (void)addPathItems:(NSArray *)pathItemButtons;

@end
