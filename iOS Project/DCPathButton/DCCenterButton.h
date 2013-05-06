//
//  DCCenterButton.h
//  Example
//
//  Created by Paul on 5/5/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DCCenterButton;

@protocol DCCenterButtonDelegate <NSObject>

- (void)buttonAppear:(DCCenterButton *)centerButton;
- (void)buttonShrink:(DCCenterButton *)centerButton;
- (void)configureAxisXY:(CGPoint)current;
- (void)cinfigureExpandStatus;
- (void)centerButtonMoved;
- (void)centerButtonEnded;

@end

@interface DCCenterButton : UIButton{
    CGPoint finalLocation;
    BOOL isMoving;
}

@property (weak, nonatomic) id<DCCenterButtonDelegate> delegate;
@property (nonatomic) CGPoint finalLocation;

@end
