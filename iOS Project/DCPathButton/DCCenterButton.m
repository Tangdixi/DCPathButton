//
//  DCCenterButton.m
//  Example
//
//  Created by Paul on 5/5/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import "DCCenterButton.h"

@implementation DCCenterButton
@synthesize delegate = _delegate;
@synthesize finalLocation;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    isMoving = NO;
    self.highlighted = YES;
    startLocation = self.center;
    finalLocation = startLocation;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    isMoving = YES;
    self.highlighted = NO;
    if ([_delegate respondsToSelector:@selector(centerButtonMoved)]) {
        [_delegate centerButtonMoved];
    }
    self.center = [[touches anyObject]locationInView:self.superview];
    currentLocation = [[touches anyObject]locationInView:self.superview];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if (isMoving) {
        if ([_delegate respondsToSelector:@selector(centerButtonEnded)]) {
            [_delegate centerButtonEnded];
            finalLocation = currentLocation;
        }
    }
    else{
        [_delegate buttonAppear:self];
        [_delegate buttonShrink:self];
        [_delegate cinfigureExpandStatus];
        isMoving = NO;
    }
    
    [_delegate bottomFinalLocation:CGPointMake(finalLocation.x - startLocation.x, finalLocation.y - startLocation.y)];
    self.highlighted = NO;
}

@end
