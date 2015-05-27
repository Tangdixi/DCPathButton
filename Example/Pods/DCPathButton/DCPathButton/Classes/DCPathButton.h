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

@class DCPathButton;

typedef NS_ENUM(NSUInteger, kDCPathButtonBloomDirection) {
    
    kDCPathButtonBloomDirectionTop = 1,
    kDCPathButtonBloomDirectionTopLeft = 2,
    kDCPathButtonBloomDirectionLeft = 3,
    kDCPathButtonBloomDirectionBottomLeft = 4,
    kDCPathButtonBloomDirectionBottom = 5,
    kDCPathButtonBloomDirectionBottomRight = 6,
    kDCPathButtonBloomDirectionRight = 7,
    kDCPathButtonBloomDirectionTopRight = 8,
    
};

@protocol DCPathButtonDelegate <NSObject>

- (void)pathButton:(DCPathButton *)dcPathButton clickItemButtonAtIndex:(NSUInteger)itemButtonIndex;

@optional

- (void)willPresentItemButton;
- (void)didPresentItemButton;

@end

@interface DCPathButton : UIView <UIGestureRecognizerDelegate>

@property (weak, nonatomic) id<DCPathButtonDelegate> delegate;

@property (assign, nonatomic) CGFloat bloomRadius;
@property (assign, nonatomic) CGFloat bloomAngel;
@property (assign, nonatomic) CGPoint dcButtonCenter;

@property (assign, nonatomic) BOOL allowSounds;

@property (copy, nonatomic) NSString *bloomSoundPath;
@property (copy, nonatomic) NSString *foldSoundPath;
@property (copy, nonatomic) NSString *itemSoundPath;

@property (assign, nonatomic) BOOL allowCenterButtonRotation;

@property (assign, nonatomic) kDCPathButtonBloomDirection bloomDirection;

- (instancetype)initWithCenterImage:(UIImage *)centerImage
                   highlightedImage:(UIImage *)centerHighlightedImage;

- (instancetype)initWithButtonFrame:(CGRect)centerButtonFrame
                        centerImage:(UIImage *)centerImage
                   highlightedImage:(UIImage *)centerHighlightedImage;

- (void)addPathItems:(NSArray *)pathItemButtons;

@end
