 
#DCPathButton 2.0 

![Foled](https://raw.githubusercontent.com/Tangdixi/DCPathButton/master/ScreenShot/1.png).
![Bloom](https://raw.githubusercontent.com/Tangdixi/DCPathButton/master/ScreenShot/2.png) 

**DCPathButton** 2.0 is a menu button for iOS. Designed by a famous iOS App [**Path**](path.com).  
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
pod 'DCPathButton', '~> 2.0.2'
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
DCPatButton *centerButton = [[DCPathButton alloc]initWithCenterImage:[UIImage imageNamed:@"chooser-button-tab"]
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
####DCPathButtonDelegate

**DCPathButtonDelegate** handle the action when you fire the item buttons which is similar to the **UITableViewDelegate**, control the items through the **index**  

You can add one item at least or five items at most. Assume we have five items, so the **index** is 0 to 4 :)

```objc
- (void)itemButtonTappedAtIndex:(NSUInteger)index
{
  if(index == 0){
    // When the user tap index 1 here ...
  }
  else{
    // other code here ...
  }
}
```

##Custom Property

```objc
@property (assign, nonatomic) CGFloat bloomRadius;
```

`bloomRadius` is use to handle the item button bloom radius, default is `105.0f`;

```objc
@property (assign, nonatomic) CGPoint dcButtonCenter;
```

`dcButtonCenter` is use to modify the center button's position.  
In default the **DCPathButton** will be located in the center of a TabBar, assume that you use a *TabBarController*
;

If you have any suggestions. Just open an [issue](https://github.com/Tangdixi/DCPathButton/issues), tell me what you want.  :) 

##Problems, bugs or advice

Open an [issue](https://github.com/Tangdixi/DCPathButton/issues) guys :)  
I will reply you as quickly as I can .

##Lisence

**DCPathButton** is available under the MIT license. See the LICENSE file for more info.

