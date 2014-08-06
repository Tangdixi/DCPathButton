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

@property (assign, nonatomic) NSUInteger itemsCount;

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) UIImage *highlightedImage;

@property (strong, nonatomic) NSMutableArray *itemButtonImages;
@property (strong, nonatomic) NSMutableArray *itemButtonHighlightedImages;
@property (strong, nonatomic) NSMutableArray *itemButtonBackgroundImages;
@property (strong, nonatomic) NSMutableArray *itemButtonBackgroundHighlightedImages;

@property (assign, nonatomic) CGFloat itemExpandRadius;

@end
