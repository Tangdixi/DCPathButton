//
//  DCPathItemButton.h
//  DCPathButton
//
//  Created by tang dixi on 31/7/14.
//  Copyright (c) 2014 Tangdxi. All rights reserved.
//

@import UIKit;

@class DCPathItemButton;

/*!
 *  `DCPathItemButtonDelegate` protocol defines method that informs the delegate object the event of item button's selection.
 */
@protocol DCPathItemButtonDelegate <NSObject>

/*!
 *  Tells the delegate that the `DCPathItemButton` has been selected.
 *
 *  @param itemButton A `DCPathItemButton` that has been selected.
 */
- (void)itemButtonTapped:(DCPathItemButton *)itemButton;

@end

@interface DCPathItemButton : UIButton

/*!
 *  The location of the `DCPathItemButton` object in a `DCPathButton` object.
 */
@property (assign, nonatomic) NSUInteger index;

/*!
 *  The object that acts as the delegate of the `DCPathItemButton` object.
 */
@property (weak, nonatomic) id<DCPathItemButtonDelegate> delegate;

/*!
 *  Creates a `DCPathItemButton` with normal and highlighted foreground and background images of the button.
 *
 *  @param image                      The normal foreground image.
 *  @param highlightedImage           The highlighted foreground image.
 *  @param backgroundImage            The normal background image.
 *  @param backgroundHighlightedImage The highlighted background image.
 *
 *  @return A `DCPathItemButton` object.
 */
- (instancetype)initWithImage:(UIImage *)image
             highlightedImage:(UIImage *)highlightedImage
              backgroundImage:(UIImage *)backgroundImage
   backgroundHighlightedImage:(UIImage *)backgroundHighlightedImage;

@end
