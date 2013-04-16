//
//  DCSubButton.m
//  DCPathButton
//
//  Created by Paul on 3/29/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import "DCSubButton.h"

@implementation DCSubButton
@synthesize delegate=_delegate;

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
    self.highlighted = NO;
    if ([_delegate respondsToSelector:@selector(subButtonPress:)]) {
        [_delegate subButtonPress:self];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
