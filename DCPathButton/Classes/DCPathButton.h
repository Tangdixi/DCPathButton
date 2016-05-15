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

/**
 *  `DCPathButtonDelegate` protocol defines methods that inform the delegate object the events of item button's selection, presentation and dismissal.
 */
@protocol DCPathButtonDelegate <NSObject>

/**
 *  Tells the delegate that the item button at an index is clicked.
 *
 *  @param dcPathButton    A `DCPathButton` object informing the delegate about the button click.
 *  @param itemButtonIndex The index of the item button being clicked.
 */
- (void)pathButton:(DCPathButton *)dcPathButton clickItemButtonAtIndex:(NSUInteger)itemButtonIndex;

@optional

/**
 *  Tells the delegate that the `DCPathButton` object will present its items.
 *
 *  @param dcPathButton A `DCPathButton` object that is about to present its items.
 */
- (void)willPresentDCPathButtonItems:(DCPathButton *)dcPathButton;
/**
 *  Tells the delegate that the `DCPathButton` object has already presented its items.
 *
 *  @param dcPathButton A `DCPathButton` object that has presented its items.
 */
- (void)didPresentDCPathButtonItems:(DCPathButton *)dcPathButton;

/**
 *  Tells the delegate that the `DCPathButton` object will dismiss its items.
 *
 *  @param dcPathButton A `DCPathButton` object that is about to dismiss its items
 */
- (void)willDismissDCPathButtonItems:(DCPathButton *)dcPathButton;
/**
 *  Tells the delegate that the `DCPathButton` object has already dismissed its items.
 *
 *  @param dcPathButton A `DCPathButton` object that has dismissed its items.
 */
- (void)didDismissDCPathButtonItems:(DCPathButton *)dcPathButton;

@end

@interface DCPathButton : UIView <UIGestureRecognizerDelegate>

@property (weak, nonatomic) id<DCPathButtonDelegate> delegate;

@property (assign, nonatomic) NSTimeInterval basicDuration;
@property (assign, nonatomic) BOOL allowSubItemRotation;

@property (assign, nonatomic) CGFloat bloomRadius;
@property (assign, nonatomic) CGFloat bloomAngel;
@property (assign, nonatomic) CGPoint dcButtonCenter;

@property (assign, nonatomic) BOOL allowSounds;

@property (copy, nonatomic) NSString *bloomSoundPath;
@property (copy, nonatomic) NSString *foldSoundPath;
@property (copy, nonatomic) NSString *itemSoundPath;

@property (assign, nonatomic) BOOL allowCenterButtonRotation;

@property (strong, nonatomic) UIColor *bottomViewColor;

@property (assign, nonatomic) kDCPathButtonBloomDirection bloomDirection;

- (instancetype)initWithCenterImage:(UIImage *)centerImage
                   highlightedImage:(UIImage *)centerHighlightedImage;

- (instancetype)initWithButtonFrame:(CGRect)centerButtonFrame
                        centerImage:(UIImage *)centerImage
                   highlightedImage:(UIImage *)centerHighlightedImage;

- (void)addPathItems:(NSArray *)pathItemButtons;

@end
