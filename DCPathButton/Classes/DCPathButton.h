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

/*!
 *  The direction of a `DCPathButton` object's bloom animation.
 */
typedef NS_ENUM(NSUInteger, kDCPathButtonBloomDirection) {
    /*!
     *  Bloom animation gose to the top of the `DCPathButton` object.
     */
    kDCPathButtonBloomDirectionTop = 1,
    /*!
     *  Bloom animation gose to top left of the `DCPathButton` object.
     */
    kDCPathButtonBloomDirectionTopLeft = 2,
    /*!
     *  Bloom animation gose to the left of the `DCPathButton` object.
     */
    kDCPathButtonBloomDirectionLeft = 3,
    /*!
     *  Bloom animation gose to bottom left of the `DCPathButton` object.
     */
    kDCPathButtonBloomDirectionBottomLeft = 4,
    /*!
     *  Bloom animation gose to the bottom of the `DCPathButton` object.
     */
    kDCPathButtonBloomDirectionBottom = 5,
    /*!
     *  Bloom animation gose to bottom right of the `DCPathButton` object.
     */
    kDCPathButtonBloomDirectionBottomRight = 6,
    /*!
     *  Bloom animation gose to the right of the `DCPathButton` object.
     */
    kDCPathButtonBloomDirectionRight = 7,
    /*!
     *  Bloom animation gose around the `DCPathButton` object.
     */
    kDCPathButtonBloomDirectionTopRight = 8,
};

/*!
 *  `DCPathButtonDelegate` protocol defines methods that inform the delegate object the events of item button's selection, presentation and dismissal.
 */
@protocol DCPathButtonDelegate <NSObject>

/*!
 *  Tells the delegate that the item button at an index is clicked.
 *
 *  @param dcPathButton    A `DCPathButton` object informing the delegate about the button click.
 *  @param itemButtonIndex The index of the item button being clicked.
 */
- (void)pathButton:(DCPathButton *)dcPathButton clickItemButtonAtIndex:(NSUInteger)itemButtonIndex;

@optional

/*!
 *  Tells the delegate that the `DCPathButton` object will present its items.
 *
 *  @param dcPathButton A `DCPathButton` object that is about to present its items.
 */
- (void)willPresentDCPathButtonItems:(DCPathButton *)dcPathButton;
/*!
 *  Tells the delegate that the `DCPathButton` object has already presented its items.
 *
 *  @param dcPathButton A `DCPathButton` object that has presented its items.
 */
- (void)didPresentDCPathButtonItems:(DCPathButton *)dcPathButton;

/*!
 *  Tells the delegate that the `DCPathButton` object will dismiss its items.
 *
 *  @param dcPathButton A `DCPathButton` object that is about to dismiss its items
 */
- (void)willDismissDCPathButtonItems:(DCPathButton *)dcPathButton;
/*!
 *  Tells the delegate that the `DCPathButton` object has already dismissed its items.
 *
 *  @param dcPathButton A `DCPathButton` object that has dismissed its items.
 */
- (void)didDismissDCPathButtonItems:(DCPathButton *)dcPathButton;

@end

@interface DCPathButton : UIView <UIGestureRecognizerDelegate>

/*!
 *  The object that acts as the delegate of the `DCPathButton` object.
 */
@property (weak, nonatomic) id<DCPathButtonDelegate> delegate;

/*!
 *  `DCPathButton` object's bloom animation's duration.
 */
@property (assign, nonatomic) NSTimeInterval basicDuration;
/*!
 *  `YES` if allows `DCPathButton` object's sub items to rotate. Otherwise `NO`.
 */
@property (assign, nonatomic) BOOL allowSubItemRotation;

/*!
 *  `DCPathButton` object's bloom radius. The default value is 105.0f.
 */
@property (assign, nonatomic) CGFloat bloomRadius;

/*!
 *  `DCPathButton` object's bloom angle.
 */
@property (assign, nonatomic) CGFloat bloomAngel;

/*!
 *  The center of a `DCPathButton` object's position. The default value positions the `DCPathButton` object in bottom center.
 */
@property (assign, nonatomic) CGPoint dcButtonCenter;

/*!
 *  If set to `YES` a sound will be played when the `DCPathButton` object is being interacted. The default value is `YES`.
 */
@property (assign, nonatomic) BOOL allowSounds;

/*!
 *  The path to the `DCPathButton` object's bloom effect sound file.
 */
@property (copy, nonatomic) NSString *bloomSoundPath;

/*!
 *  The path to the `DCPathButton` object's fold effect sound file.
 */
@property (copy, nonatomic) NSString *foldSoundPath;

/*!
 *  The path to the `DCPathButton` object's item action sound file.
 */
@property (copy, nonatomic) NSString *itemSoundPath;

/*!
 *  `YES` if allows the `DCPathButton` object's center button to rotate. Otherwise `NO`.
 */
@property (assign, nonatomic) BOOL allowCenterButtonRotation;

/*!
 *  Color of the backdrop view when `DCPathButton` object's sub items are shown.
 */
@property (strong, nonatomic) UIColor *bottomViewColor;

/*!
 *  Direction of `DCPathButton` object's bloom animation.
 */
@property (assign, nonatomic) kDCPathButtonBloomDirection bloomDirection;

/*!
 *  Creates a `DCPathButton` object with a given normal image and highlited images for center button.
 *
 *  @param centerImage            The normal image for `DCPathButton` object's center button.
 *  @param centerHighlightedImage The highlighted image for `DCPathButton` object's center button.
 *
 *  @return A `DCPathButton` object.
 */
- (instancetype)initWithCenterImage:(UIImage *)centerImage
                   highlightedImage:(UIImage *)centerHighlightedImage;

/*!
 *  Creates a `DCPathButton` object with a given frame, normal and highlighted images for its center button.
 *
 *  @param centerButtonFrame      The frame of `DCPathButton` object.
 *  @param centerImage            The normal image for `DCPathButton` object's center button.
 *  @param centerHighlightedImage The highlighted image for `DCPathButton` object's center button.
 *
 *  @return A `DCPathButton` object.
 */
- (instancetype)initWithButtonFrame:(CGRect)centerButtonFrame
                        centerImage:(UIImage *)centerImage
                   highlightedImage:(UIImage *)centerHighlightedImage;

/*!
 *  Adds item buttons to an existing `DCPathButton` object.
 *
 *  @param pathItemButtons The item buttons to be added.
 */
- (void)addPathItems:(NSArray *)pathItemButtons;

@end
