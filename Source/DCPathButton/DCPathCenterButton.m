//
//  DCPathCenterButton.m
//  DCPathButton
//
//  Created by tang dixi on 30/7/14.
//  Copyright (c) 2014 Tangdxi. All rights reserved.
//

#import "DCPathCenterButton.h"

@implementation DCPathCenterButton

- (id)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage
{
    if (self = [super initWithImage:image highlightedImage:highlightedImage]) {
        
        self.userInteractionEnabled = YES;
        
        self.image = image;
        self.highlightedImage = highlightedImage;
        
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Center button Begin Tapped
    if ([_delegate respondsToSelector:@selector(centerButtonTapped)]) {
        [_delegate centerButtonTapped];
    }
    
    NSLog(@"Center Button Tapped");
    
    self.highlighted = YES;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.highlighted = NO;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.highlighted = NO;
}

@end
