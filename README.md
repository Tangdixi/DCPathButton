#DCPathButton  
### __________Create by Tangdixi
#Date:2013/3/25
---------------------

## Circle buttons
![](https://raw.github.com/Tangdixi/DCPathButton/master/ScreenShot/3.jpeg) .
![](https://raw.github.com/Tangdixi/DCPathButton/master/ScreenShot/4.jpeg) .
![](https://raw.github.com/Tangdixi/DCPathButton/master/ScreenShot/5.jpeg) .
![](https://raw.github.com/Tangdixi/DCPathButton/master/ScreenShot/6.jpeg) .

# Button Animations
![](https://raw.github.com/Tangdixi/DCPathButton/master/ScreenShot/3g.gif) .
![](https://raw.github.com/Tangdixi/DCPathButton/master/ScreenShot/4g.gif) .
![](https://raw.github.com/Tangdixi/DCPathButton/master/ScreenShot/5g.gif) .
![](https://raw.github.com/Tangdixi/DCPathButton/master/ScreenShot/6g.gif) .

How to use DCPathButton:
=================================================
### Create a dcPathButton

	    DCPathButton *dcPathButton = [[DCPathButton alloc]
                                  initDCPathButtonWithSubButtons:3
                                  				 	 totalRadius:85
                                  				    centerRadius:30
                                  					   subRadius:25
                                  					 centerImage:@"x"
                                  				centerBackground:@"x"
                                  					   subImages:^(DCPathButton *dc){
                                      						[dc subButtonImage:@"x" withTag:0];
                                      						[dc subButtonImage:@"x" withTag:1];
                                      						[dc subButtonImage:@"x" withTag:2];
                                      						[dc subButtonImage:@"x" withTag:3];
                                      						[dc subButtonImage:@"x" withTag:4];
                                      						[dc subButtonImage:@"x" withTag:5];
                                  						}
                                  			      subImageBackground:nil
                                  				     inLocationX:0 
                                  				       locationY:0 
                                  				    toParentView:self.view];

    
     						
### Add DCPathButton Delegate

		Example:
			#import <UIKit/UIKit.h>
			#import "DCPathButton.h"

			@interface ViewController : UIViewController<DCPathButtonDelegate>
			@property (strong, nonatomic) DCPathButton *dcPathButton;

			@end
				...................
	
		Set the DCPathButton Delegate:
			dcPathButton.delegate = self;
	

### Custom Your Button Action

####Add the "DCPathButtonDelegate" protocol,custom the button's action :
 		
			- (void)button_0_action{
    				NSLog(@"Button Press Tag 0!!");
			}

			- (void)button_1_action{
    				NSLog(@"Button Press Tag 1!!");
			}


### Parameter illustrate

	  -- Parameter illustrte
	  Count: 			How many button you want to show, range between 3 to 6, if you set this parameter above
	         		    6,it will set the maximum value 6, the same to the minimum value 3.
	  TotalRadius: 		The radius that whole the buttons expanded, maximum half screen width minus button
	               		radius, this parameter shouldn't be 0.
	  CenterRadius: 	The center button's radius, shouldn't be nil but it already have a normal radius,
	               		maximum 100.
	  ButtonRadius: 	The button which around the center button, they will have a same radius you give,
	                	shouldn't be nil but have a normal radius, maximum 80.
	  ButtonImages: 	Use an array to save whole the button images, you have to keep the images' number
	                	equal to the parameter count, or greater than it.
	  SubImages: 		Use the block to add picture to each button, suah as......
                          ^(DCPathButoon *dc){
                                      [dc subButtonImage:@"xxx" withTag:0];
                                      [dc subButtonImage:@"xxx" withTag:1];
                                      [dc subButtonImage:@"xxx" withTag:2];
                                       .............
                          }
                         It will use a default picture when you set this block nil.

	  ParentView:  		The View which you add the DCPAthButton to, the view's bounds will influent the
                         centerButton's location.

	
	
### The tag in Three different button types

		//  ***********************************************************************************************
		//
		//  Button tag: For example, you want to add a new image in (0),just add it in the buttonImags
		//                array at tag 0.
		//
		//  *-------------------------------------------------------------------------------------------*
		//  |                                                                                           |
		//  |                                                                                           |
		//  |                                                                                           |
		//  |                                                                                           |
		//  |              (0)     (1)                 (0)     (1)                   (0)     (1)        |
		//  |                                                                                           |
		//  |                 \   /                       \   /                         \   /           |
		//  |     (type_1) ->  (x)           (type_2) ->   (x)             (type_3) ->   (x)            |
		//  |                   |                         /   \                         / | \           |
		//  |                                                                       (2)       (4)       |
		//  |                  (2)                     (2)     (3)                       (3)            |
		//  |                                                                                           |
		//  |                                                                                           |
		//  |                                                                                           |
		//  |                                                                                           |
		//  |                           (0)   (1)   (2)                                                 |
		//  |                                                                                           |
		//  |                                \ | /                                                      |
		//  |                    (type_4) ->  (x)                                                       |
		//  |                                / | \                                                      |
		//  |                                                                 <The button tags>         |
		//  |                           (3)   (4)   (5)                                                 |
		//  |                                                                                           |
		//  |                                                                                           |
		//  |                                                                                           |
		//  *-------------------------------------------------------------------------------------------*
		//
		//  ***********************************************************************************************
