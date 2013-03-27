//
//  NSMutableArray+addImage.h
//  DCPathButton
//
//  Created by Paul on 3/25/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (addImage)

+ (NSMutableArray *)arrayContainImages:(NSUInteger)capacity;
- (void)addImage:(NSString *)imageName;

@end
