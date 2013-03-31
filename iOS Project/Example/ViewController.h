//
//  ViewController.h
//  Example
//
//  Created by Paul on 3/31/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCPathButton.h"

@interface ViewController : UIViewController<DCPathButtonDelegate>
@property (strong, nonatomic) DCPathButton *dcPathButton;

@end
