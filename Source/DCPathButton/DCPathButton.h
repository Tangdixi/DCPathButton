//
//  DCPathButton.h
//  DCPathButton
//
//  Created by tang dixi on 30/7/14.
//  Copyright (c) 2014 Tangdxi. All rights reserved.
//

@import UIKit;
@import QuartzCore;

@protocol DCPathButtonDelegate <NSObject>

- (void)itemButtonTappedAtIndex:(NSUInteger)index;

@end

@interface DCPathButton : UIView

@property (weak, nonatomic) id<DCPathButtonDelegate> delegate;

@property (strong, nonatomic) NSMutableArray *itemButtonImages;
@property (strong, nonatomic) NSMutableArray *itemButtonHighlightedImages;

@property (strong, nonatomic) UIImage *itemButtonBackgroundImage;
@property (strong, nonatomic) UIImage *itemButtonBackgroundHighlightedImage;

@property (assign, nonatomic) CGFloat bloomRadius;

- (id)initWithCenterImage:(UIImage *)centerImage hilightedImage:(UIImage *)centerHighlightedImage;

@end
