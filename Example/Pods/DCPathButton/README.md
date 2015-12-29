 
#DCPathButton 

![Build Status](https://api.travis-ci.org/Tangdixi/DCPathButton.svg?branch=master)

![Foled](https://raw.githubusercontent.com/Tangdixi/DCPathButton/master/ScreenShot/1.png).
![Bloom](https://raw.githubusercontent.com/Tangdixi/DCPathButton/master/ScreenShot/2.png) 

**DCPathButton** is a menu button for iOS. Designed by a famous iOS App [**Path**](www.path.com).  
Since **Path 4.0**, this beautiful button was moved into the tab bar, with a new design.  
So the **DCPathButton** is totally a copy, including the **animations**, the **sounds** and the **button's images** ( *of cource you can use your own images* ).  

## How To Get Started  

- Download [**DCPathButton**](https://codeload.github.com/Tangdixi/DCPathButton/zip/master)
- Clone **DCPathButton**

```bash
git clone git@github.com:Tangdixi/DCPathButton.git
```

##Installation

Of cource, you can install **DCPathButton** in a traditional way -- drag the **DCPathButton** folder into your projects. but I strongly recommanded that you install from **CocoaPods**

####Requirement

- **AudioToolBox.framework**
- **QuartzCore.framework**

##Install with CocoaPods
[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like **DCPathButton** in your projects.

####Podfile
```bash
platform :ios, '7.0'
pod 'DCPathButton', '~> 2.1.3'
``` 

##Usage

####Create a DCPathButton  

1.import the "DCPathButton" to your controller
```objc
import "DCPathButton.h"
```  
2.Add the `DCPathButtonDelegate` to your controller  
```objc
@interface ViewController ()<DCPathButtonDelegate>
```
3.Create a center button and add it into your view
```objc
DCPathButton *centerButton = [[DCPathButton alloc]initWithCenterImage:[UIImage imageNamed:@"chooser-button-tab"]
                                                      hilightedImage:[UIImage imageNamed:@"chooser-button-tab-highlighted"]];
[self.view addSubView:centerButton];
```
4.Create some item buttons and add them into the center button

```objc
DCPathItemButton *itemButton_1 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"image"]
                                                       highlightedImage:[UIImage imageNamed:@"highlightedImage"]
                                                        backgroundImage:[UIImage imageNamed:@"backgroundImage"]
                                             backgroundHighlightedImage:[UIImage imageNamed:@"backgroundhighlightedImage"]];

[centerButton addPathItems:@[itemButton_1]];                                                 
```
------

####DCPathButtonDelegate

`<DCPathButtonDelegate>` handle the action when you fire the item buttons which is similar to the **UITableViewDelegate**, control the items through the **index**  

You can add one item at least or five items at most. Assume we have five items, so the **itemButtonIndex** is 0 to 4 :)

```objc
- (void)pathButton:(DCPathButton *)dcPathButton clickItemButtonAtIndex:(NSUInteger)itemButtonIndex {
    NSLog(@"You tap %@ at index : %lu", dcPathButton, (unsigned long)itemButtonIndex);
}
```

You also can do something before or when the item buttons appear:

```objc
- (void)willPresentItemButton {
    
    NSLog(@"ItemButton will present");
    
}
- (void)didPresentItemButton {

    NSLog(@"ItemButton did present");
    
}
```

------

##Custom Property

```objc
@property (assign, nonatomic) CGFloat bloomRadius;
```

`bloomRadius` is use to handle the item button bloom radius, default is `105.0f`;

------

```objc
@property (assign, nonatomic) CGPoint dcButtonCenter;
```

`dcButtonCenter` is use to modify the center button's position.  

In default the **DCPathButton** will be located in bottom center.  

------

```objc
@property (assign, nonatomic) BOOL allowSounds;
```

`allowSounds ` is use to enable the button's sound, default is `YES`;

------

```objc
@property (copy, nonatomic) NSString *bloomSoundPath;
@property (copy, nonatomic) NSString *foldSoundPath;
@property (copy, nonatomic) NSString *itemSoundPath;
```
You can change the button's sound through change the path of the **sound file**, for instance:

```objc
self.bloomSoundPath = [[NSBundle mainBundle]pathForResource:@"bloom" ofType:@"caf"];
```

------

```objc
@property (assign, nonatomic) kDCPathButtonBloomDirection bloomDirection;
```
We have `9` directions in **DCPathButton**, use the `bloomDirection` property to change the direction. All the directions you can find in the `enum` below:

```objc
typedef NS_ENUM(NSUInteger, kDCPathButtonBloomDirection) {
    
    kDCPathButtonBloomDirectionTop = 1,
    kDCPathButtonBloomDirectionTopLeft = 2,
    kDCPathButtonBloomDirectionLeft = 3,
    kDCPathButtonBloomDirectionBottomLeft = 4,
    kDCPathButtonBloomDirectionBottom = 5,
    kDCPathButtonBloomDirectionBottomRight = 6,
    kDCPathButtonBloomDirectionRight = 7,
    kDCPathButtonBloomDirectionTopRight = 8,
    kDCPathButtonBloomDirectionCenter = 9,
    
};
```
------

```objc
@property (assign, nonatomic) CGFloat bloomAngel;
```
`bloomAngel` use for changing the item button's bloom angel. 

------

```objc
@property (assign, nonatomic) BOOL allowSubItemRotation;
```
`allowSubItemRotation ` use for handling the rotation of the subItem .

------

```objc
@property (assign, nonatomic) NSTimeInterval basicDuration;
```
`basicDuration ` is using for change the animation's duration, you can make the subItems bloom slowly, etc.

##Swift Example

I M working on a Swift version.  
There is a example show you how to use **DCPathButton** in you Swift code.

##Contribution 

Thanks these PR:  
*  [AlexJeng's](https://github.com/AlexJeng/DCPathButton/commit/05228d583626f839a17f40613afb30f013cc34f0)  
*  [wangweiarr's](https://github.com/wangweiarr/DCPathButton/commit/  d723afdcd32bcfffadba5e60698b027aa29e95df)
*  [thundertrick's](https://github.com/Tangdixi/DCPathButton/pull/33)  
*  [Ian Hirschfeld's](https://github.com/Tangdixi/DCPathButton/pull/47)  
*  [skyline75489](https://github.com/Tangdixi/DCPathButton/pull/49)
*  [tdubik](https://github.com/Tangdixi/DCPathButton/pull/50)

##Problems, bugs or advice

Open an [issue](https://github.com/Tangdixi/DCPathButton/issues) guys :)  
Reply U ASAP ~

##Lisence

**DCPathButton** is available under the MIT license. See the LICENSE file for more info.

