//
//  DCSubButton.m
//  DCPathButton
//
//  Created by Paul on 4/19/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import "DCSubButton.h"

@implementation DCSubButton
@synthesize delegate = _delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    self.highlighted = YES;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if ([_delegate respondsToSelector:@selector(subButtonPress:)]) {
        [_delegate subButtonPress:self];
    }
    self.highlighted= NO;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    self.highlighted = NO;
}

@end
