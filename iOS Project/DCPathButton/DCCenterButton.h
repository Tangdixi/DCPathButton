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

- (void)bottomFinalLocation:(CGPoint)offSet;
- (void)buttonAppear:(DCCenterButton *)centerButton;
- (void)buttonShrink:(DCCenterButton *)centerButton;
- (void)cinfigureExpandStatus;
- (void)centerButtonMoved;
- (void)centerButtonEnded;

@end

@interface DCCenterButton : UIButton{
    CGPoint startLocation;
    CGPoint currentLocation;
    CGPoint finalLocation;
    BOOL isMoving;
}

@property (weak, nonatomic) id<DCCenterButtonDelegate> delegate;
@property (nonatomic) CGPoint finalLocation;

@end
