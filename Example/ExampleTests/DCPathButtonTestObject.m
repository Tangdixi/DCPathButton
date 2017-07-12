//
//  DCPathButtonTestObject.m
//  Example
//
//  Created by Kevin Morton on 7/11/17.
//  Copyright © 2017 Tangdxi. All rights reserved.
//

#import "DCPathButtonTestObject.h"
#import <DCPathButton/DCPathButton.h>

@interface DCPathButtonTestObject ()

@end

@implementation DCPathButtonTestObject

#pragma mark - Accessors -

- (NSArray *)pathButtonItems {
    DCPathItemButton *itemButton_1 = [[DCPathItemButton alloc] initWithImage:[UIImage imageNamed:@"chooser-moment-icon-music"]
                                                            highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-music-highlighted"]
                                                             backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                  backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];

    DCPathItemButton *itemButton_2 = [[DCPathItemButton alloc] initWithImage:[UIImage imageNamed:@"chooser-moment-icon-place"]
                                                            highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-place-highlighted"]
                                                             backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                  backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];

    DCPathItemButton *itemButton_3 = [[DCPathItemButton alloc] initWithImage:[UIImage imageNamed:@"chooser-moment-icon-camera"]
                                                            highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-camera-highlighted"]
                                                             backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                  backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];

    DCPathItemButton *itemButton_4 = [[DCPathItemButton alloc] initWithImage:[UIImage imageNamed:@"chooser-moment-icon-thought"]
                                                            highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-thought-highlighted"]
                                                             backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                  backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];

    DCPathItemButton *itemButton_5 = [[DCPathItemButton alloc] initWithImage:[UIImage imageNamed:@"chooser-moment-icon-sleep"]
                                                            highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-sleep-highlighted"]
                                                             backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                  backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];

    return @[
        itemButton_1,
        itemButton_2,
        itemButton_3,
        itemButton_4,
        itemButton_5
    ];
}

@end
