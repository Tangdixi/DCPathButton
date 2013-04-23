//
//  DCPathButoon.h
//  DCPathButton
//
//  Created by Paul on 4/19/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "DCPathButtonConstant.h"
#import "DCSubButton.h"

typedef enum{
    kDCPathButtonRotationNormal = 0,
    kDCPathButtonRotationReverse,
}DCPathButtonRotationOrientation;

@protocol DCPathButtonDelegate <NSObject>
@optional
- (void)button_0_action;
- (void)button_1_action;
- (void)button_2_action;
- (void)button_3_action;
- (void)button_4_action;
- (void)button_5_action;

@end

@class DCPathButton;
@interface DCPathButton : UIView<DCSubButtonDelegate>

- (id)initDCPathButtonWithSubButtons:(NSInteger)buttonCount
                         totalRadius:(CGFloat)totalRadius
                        centerRadius:(NSInteger)centerRadius
                           subRadius:(CGFloat)subRadius
                         centerImage:(NSString *)centerImageName
                    centerBackground:(NSString *)centerBackgroundName
                           subImages:(void(^)(DCPathButton *))imageBlock
                  subImageBackground:(NSString *)subImageBackgroundName
                         inLocationX:(CGFloat)xAxis
                           locationY:(CGFloat)yAxis
                        toParentView:(UIView *)parentView;

@property (nonatomic, weak) id<DCPathButtonDelegate> delegate;
@property (nonatomic, getter = isExpanded) BOOL expanded;

@property (nonatomic) CGFloat totalRaiuds;
@property (nonatomic) CGFloat centerRadius;
@property (nonatomic) CGFloat subRadius;
@property (nonatomic) NSInteger buttonCount;
@property (nonatomic) CGFloat centerLocationAxisX;
@property (nonatomic) CGFloat centerLocationAxisY;
@property (nonatomic, strong) UIView *parentView;

@property (strong, nonatomic) UIButton *centerButton;
@property (strong, nonatomic) DCSubButton *subButton;
@property (strong, nonatomic) NSMutableArray *buttons;

- (void)subButtonImage:(NSString *)imageName withTag:(NSInteger)tag;

//  -- Parameter illustrte
//  Count: How many button you want to show, range between 3 to 6, if you set this parameter above
//         6,it will set the maximum value 6, the same to the minimum value 3.
//  TotalRadius: The radius that whole the buttons expanded, maximum half screen width minus button
//               radius, this parameter shouldn't be 0.
//  CenterRadius: The center button's radius, shouldn't be nil but it already have a normal radius,
//                maximum 100.
//  SubRadius: The button which around the center button, they will have a same radius you give,
//                shouldn't be nil but have a normal radius, maximum 80.
//  SubImages: Use the block to add picture to each button, suah as......
//                          ^(DCPathButoon *dc){
//                                      [dc subButtonImage:@"xxx" withTag:0];
//                                      [dc subButtonImage:@"xxx" withTag:1];
//                                      [dc subButtonImage:@"xxx" withTag:2];
//                                       .............
//                          }
//                 It will use a default picture when you set this block nil.
//
//  ParentView:  The View which you add the DCPAthButton to, the view's bounds will influent the
//                  centerButton's location.
//
//
//  ***********************************************************************************************
//
//  Button tag: For example, you want to add a new image in (0),just add it in the buttonImags
//                array at tag 0.
//
//  *-------------------------------------------------------------------------------------------*
//  |                                                                                           |
//  |                                                                                           |
//  |                                                                                           |
//  |                                                                                           |
//  |              (0)     (1)                 (0)     (1)                   (0)     (1)        |
//  |                                                                                           |
//  |                 \   /                       \   /                         \   /           |
//  |     (type_1) ->  (x)           (type_2) ->   (x)             (type_3) ->   (x)            |
//  |                   |                         /   \                         / | \           |
//  |                                                                       (2)       (4)       |
//  |                  (2)                     (2)     (3)                       (3)            |
//  |                                                                                           |
//  |                                                                                           |
//  |                                                                                           |
//  |                                                                                           |
//  |                           (0)   (1)   (2)                                                 |
//  |                                                                                           |
//  |                                \ | /                                                      |
//  |                    (type_4) ->  (x)                                                       |
//  |                                / | \                                                      |
//  |                                                                 <The button tags>         |
//  |                           (3)   (4)   (5)                                                 |
//  |                                                                                           |
//  |                                                                                           |
//  |                                                                                           |
//  *-------------------------------------------------------------------------------------------*
//
//  ***********************************************************************************************

@end