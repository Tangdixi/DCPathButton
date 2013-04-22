//
//  DCSubButton.h
//  DCPathButton
//
//  Created by Paul on 4/19/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DCSubButton;
@protocol DCSubButtonDelegate <NSObject>
- (void)subButtonPress:(DCSubButton*)button;
@end

@interface DCSubButton : UIButton

@property (nonatomic, weak) id<DCSubButtonDelegate> delegate;

@end
