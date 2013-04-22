//
//  DCPathButtonConstant.h
//  DCPathButton
//
//  Created by Paul on 4/19/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kDCPathButtonParentView self.parentView
#define kDCPathButtonCurrentFrameWidth kDCPathButtonParentView.frame.size.width
#define kDCPathButtonCurrentFrameHeight kDCPathButtonParentView.frame.size.height

#define kDCCovertAngelToRadian(x) ((x)*M_PI)/180

@interface DCPathButtonConstant : NSObject

@end
