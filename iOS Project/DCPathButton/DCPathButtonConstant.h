//
//  DCPathButtonConstant.h
//  DCPathButton
//
//  Created by Paul on 3/22/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import <Foundation/Foundation.h>

//  Define the default image name.
#define kDCPathCenterButtonDefaultBackgroundImage @"dc-centerBackground.png"
#define kDCPathCenterButtonDefaultImage @"dc-center.png"
#define kDCPathCenterButtonDefaultHighLightImage @"dc-centerHighLight.png"
#define kDCPathButtonDefaultImage @"dc-button.png"
#define kDCPathButtonDefaultBackgroundImage @"de-buttonBackground.png"

//  Define the screen 
#define kDCPathButtonCurrentScreenRect [[UIScreen mainScreen] bounds]
#define kDCPathButtonCurrentScreenHeight kDCPathButtonCurrentScreenRect.size.height
#define kDCPathButtonCurrentScreenWidth kDCPathButtonCurrentScreenRect.size.width

//  Define the basic angle
#define kDCPathButtonBasicAngle 54.0f
#define kDCPathButtonBasicAngle_2 72.0f
#define kDCPathButtonBasicRadian ((kDCPathButtonBasicAngle)*M_PI)/180
#define kDCPathButtonBasicRadian_2 ((kDCPathButtonBasicAngle_2)*M_PI)/180

@interface DCPathButtonConstant : NSObject

@end
