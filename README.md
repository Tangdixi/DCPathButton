 
#DCPathButton 

[![Build Status](https://api.travis-ci.org/Tangdixi/DCPathButton.svg?branch=master)](https://travis-ci.org/Tangdixi/DCPathButton)

![Foled](https://raw.githubusercontent.com/Tangdixi/DCPathButton/master/ScreenShot/1.png)
![Bloom](https://raw.githubusercontent.com/Tangdixi/DCPathButton/master/ScreenShot/2.png) 

**DCPathButton** is a custom menu button for iOS. The original design for this control first appeared in the well-known iOS app, [**Path**](www.path.com). Starting in **Path 4.0**, this beautiful button appeared in the tab bar, with a new design. The **DCPathButton** is a close replication of Path's button, including the **animations**, the **sounds** and the **button's images** (*of course you can use your own images*).  

## How To Get Started  

- Download [**DCPathButton**](https://codeload.github.com/Tangdixi/DCPathButton/zip/master)
- Clone **DCPathButton**

```bash
git clone git@github.com:Tangdixi/DCPathButton.git
```

##Installation

You can install **DCPathButton** in a traditional way -- drag the **DCPathButton** folder into your project. However, it is strongly recommended that you install via **CocoaPods**.

####Requirements

- **AudioToolBox.framework**
- **QuartzCore.framework**

##Install with CocoaPods
[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C and Swift, which automates and simplifies the process of using 3rd-party libraries like **DCPathButton** in your projects.

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
4.Create some item buttons and add them to the center button

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

You can add a minimum of one item or a maximum of five items. The `itemButtonIndex` parameter is  Assuming we have five items, so the **itemButtonIndex** is 0 to 4.

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

##Custom Properties

```objc
@property (assign, nonatomic) CGFloat bloomRadius;
```

`bloomRadius` is used to handle the item button bloom radius. The default value is `105.0f`.

------

```objc
@property (assign, nonatomic) CGPoint dcButtonCenter;
```

`dcButtonCenter` is used to modify the center button's position.  The default value positions the **DCPathButton** in bottom center.  

------

```objc
@property (assign, nonatomic) BOOL allowSounds;
```

`allowSounds ` is used to enable the button's sound. The default value is `YES`.

------

```objc
@property (copy, nonatomic) NSString *bloomSoundPath;
@property (copy, nonatomic) NSString *foldSoundPath;
@property (copy, nonatomic) NSString *itemSoundPath;
```
You can change the button's sound by specifying the path of a custom sound file, for instance:

```objc
self.bloomSoundPath = [[NSBundle mainBundle] pathForResource:@"bloom" ofType:@"caf"];
```

------

```objc
@property (assign, nonatomic) kDCPathButtonBloomDirection bloomDirection;
```
There are `9` directions in **DCPathButton**, use the `bloomDirection` property to change the direction. All the directions are defined in the `NS_ENUM` below:

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
`bloomAngel` is used for changing the item button's bloom angle. 

------

```objc
@property (assign, nonatomic) BOOL allowSubItemRotation;
```
`allowSubItemRotation ` is used for handling the rotation of the subItems.

------

```objc
@property (assign, nonatomic) NSTimeInterval basicDuration;
```
`basicDuration ` is used for changing the bloom animation's duration / speed.

##Swift Example

A Swift version of the project is coming. For now refer to the included Swift example to understand how you might integrate this project into your own Swift app.

##Contribution 

Special Thanks for these Pull Requests:  
*  [AlexJeng's](https://github.com/AlexJeng/DCPathButton/commit/05228d583626f839a17f40613afb30f013cc34f0)  
*  [wangweiarr's](https://github.com/wangweiarr/DCPathButton/commit/  d723afdcd32bcfffadba5e60698b027aa29e95df)
*  [thundertrick's](https://github.com/Tangdixi/DCPathButton/pull/33)  
*  [Ian Hirschfeld's](https://github.com/Tangdixi/DCPathButton/pull/47)  
*  [skyline75489's](https://github.com/Tangdixi/DCPathButton/pull/49)
*  [tdubik's](https://github.com/Tangdixi/DCPathButton/pull/50)
*  [Sam Spencer's](https://github.com/Tangdixi/DCPathButton/pull/54)
*  [Peng90's](https://github.com/Tangdixi/DCPathButton/pull/56)

##Issues, Bugs, Suggestions

Open an [issue](https://github.com/Tangdixi/DCPathButton/issues) 

##License

**DCPathButton** is available under the MIT license. See the LICENSE file for more info.
