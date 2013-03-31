//
//  DCSubButton.h
//  DCPathButton
//
//  Created by Paul on 3/29/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class DCSubButton;
@protocol DCSubButtonDelegate <NSObject>
- (void)subButtonPress:(DCSubButton*)button;
@end

@interface DCSubButton : UIButton
@property (weak, nonatomic) id<DCSubButtonDelegate> delegate;

@end
