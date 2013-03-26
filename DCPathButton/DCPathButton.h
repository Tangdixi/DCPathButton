//
//  DCPathButton.h
//  DCPathButton
//
//  Created by Paul on 3/21/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//
//  Developed by DC (Tang dixi)

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "DCPathButtonConstant.h"

@interface DCPathButton : UIView {
    BOOL isExpand;
}

- (id)initWithButtonCount:(NSUInteger)count
              totalRadius:(CGFloat)totalRadius
             centerRadius:(CGFloat)centerRadius
              centerImage:(UIImage *)centerImage
    centerBackgroundImage:(UIImage *)centerBackgroundImage
centerButtonHighLightImage:(UIImage *)centerButtonHighLightImage
             buttonRadius:(CGFloat)buttonRadius
    buttonBackgroundImage:(UIImage *)buttonBackgroundImage
             buttonImages:(NSArray *)buttonImages;

@property (strong, nonatomic) UIButton *centerButton;
@property (strong, nonatomic) UIButton *button_0;
@property (strong, nonatomic) UIButton *button_1;
@property (strong, nonatomic) UIButton *button_2;
@property (strong, nonatomic) UIButton *button_3;
@property (strong, nonatomic) UIButton *button_4;

//  -- Parameter illustrte
//  Count: How many button you want to show, range between 3 to 5, if you set this parameter above 
//         5,it will set the maximum value 5, the same to the minimum value 3.
//  TotalRadius: The radius that whole the buttons expanded, maximum half screen width minus button
//               radius, this parameter shouldn't be 0.
//  CenterRadius: The center button's radius, shouldn't be nil but it already have a normal radius,
//                maximum 100.
//  ButtonRadius: The button which around the center button, they will have a same radius you give,
//                shouldn't be nil but have a normal radius, maximum 80.
//  ButtonImages: Use an array to save whole the button images, you have to keep the images' number
//                equal to the parameter count, or greater than it.
//  CenterBackgroundImage & buttonBackgroundImage: If you set this parameter nil, it will use the 
//                                                 normal background image, hope you like it. (^_^)


//  ***********************************************************************************************
//
//  Button index: For example, you want to add a new image in (0),just add it in the buttonImags
//                array at index 0.
//
//  *-------------------------------------------------------------------------------------------*
//  |                                                                                           |
//  |              (0)     (1)                 (0)     (1)                   (0)     (1)        |
//  |                                                                                           |
//  |                 \   /                       \   /                         \   /           |
//  |     (type_1) ->  (x)           (type_2) ->   (x)             (type_3) ->   (x)            |
//  |                   |                         /   \                         / | \           |
//  |                                                                       (2)       (3)       |
//  |                  (2)                     (2)     (3)                       (4)            |
//  |                                                                                           |
//  *-------------------------------------------------------------------------------------------*
//
//  ***********************************************************************************************

@end