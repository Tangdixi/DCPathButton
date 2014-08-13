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

@protocol DCPathButtonDelegate <NSObject>

- (void)itemButtonTappedAtIndex:(NSUInteger)index;

@end

@interface DCPathButton : UIView

@property (weak, nonatomic) id<DCPathButtonDelegate> delegate;

@property (assign, nonatomic) CGFloat bloomRadius;

- (id)initWithCenterImage:(UIImage *)centerImage hilightedImage:(UIImage *)centerHighlightedImage;
- (void)addPathItem:(NSArray *)pathItemButtons;

@end
