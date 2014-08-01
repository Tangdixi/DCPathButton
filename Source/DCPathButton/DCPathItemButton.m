//
//  DCPathItemButton.m
//  DCPathButton
//
//  Created by tang dixi on 31/7/14.
//  Copyright (c) 2014 Tangdxi. All rights reserved.
//

#import "DCPathItemButton.h"

@implementation DCPathItemButton

- (id)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage
{
    if (self = [super initWithImage:image highlightedImage:highlightedImage]) {
        
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([_delegate respondsToSelector:@selector(itemButtonTapped)]) {
        [_delegate itemButtonTapped];
    }
    self.highlighted = YES;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.highlighted = NO;
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
