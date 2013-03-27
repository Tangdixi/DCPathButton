//
//  NSMutableArray+addImage.m
//  DCPathButton
//
//  Created by Paul on 3/25/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import "NSMutableArray+addImage.h"

@implementation NSMutableArray (addImage)

+ (NSMutableArray *)arrayContainImages:(NSUInteger)capacity{
    return [NSMutableArray arrayWithCapacity:capacity];
}

- (void)addImage:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    [self addObject:image];
}

@end
