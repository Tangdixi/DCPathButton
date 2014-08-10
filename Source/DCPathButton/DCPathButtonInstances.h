//
//  DCPathButtonInstances.h
//  DCPathButton
//
//  Created by tang dixi on 30/7/14.
//  Copyright (c) 2014 Tangdxi. All rights reserved.
//

#ifndef DCPathButton_DCPathButtonInstances_h
#define DCPathButton_DCPathButtonInstances_h

#define originFrameWidth [UIImage imageNamed:@"chooser-button-tab"].size.width
#define originHeight [UIImage imageNamed:@"chooser-button-tab"].size.height
#define originCenter CGPointMake(currentScreenWidth/2, currentScreenHeight - tabBarHeight)

#define currentScreenWidth [UIScreen mainScreen].bounds.size.width
#define currentScreenHeight [UIScreen mainScreen].bounds.size.height

#define centerButtonDefaultCenter CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
#define centerButtonExpandCenter originCenter

#define tabBarHeight 25.5f

#endif
