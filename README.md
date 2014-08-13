 
#DCPathButton 2.0 



DCPathButton 2.0 is a menu button for iOS. Designed by a famous iOS App [**Path**](path.com).  
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

##Install with CocoaPods
[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like **DCPathButton** in your projects.

####Podfile
```bash
platform :ios, '7.0'
pod 'DCPathButton', '~> 2.0'
``` 

##Usage

1.  import the "DCPathButton" to your controller
```objc
import "DCPathButton.h"
```  
2.  Add the `DCPathButtonDelegate` to your controller  
```objc
@interface ViewController ()<DCPathButtonDelegate>
```
3.   