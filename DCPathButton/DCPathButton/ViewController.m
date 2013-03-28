//
//  ViewController.m
//  DCPathButton
//
//  Created by Paul on 3/18/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize dcPathButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpDCPathButton];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpDCPathButton{
    NSMutableArray *images = [NSMutableArray arrayContainImages:4];
    [images addImage:@"dc-button_0.png"];
    [images addImage:@"dc-button_1.png"];
    [images addImage:@"dc-button_2.png"];
    [images addImage:@"dc-button_3.png"];
    [images addImage:@"dc-button_4.png"];
    
    dcPathButton=[[DCPathButton alloc]initWithButtonCount:5
                                              totalRadius:70
                                             centerRadius:30
                                              centerImage:[UIImage imageNamed:kDCPathCenterButtonDefaultImage]
                                    centerBackgroundImage:[UIImage imageNamed:kDCPathCenterButtonDefaultImage]
                               centerButtonHighLightImage:[UIImage imageNamed:kDCPathCenterButtonDefaultHighLightImage]
                                             buttonRadius:20
                                    buttonBackgroundImage:[UIImage imageNamed:@"dc-buttonBackground.png"]
                                             buttonImages:images];
    
    [dcPathButton.button_0 addTarget:self action:@selector(button_0_Press:) forControlEvents:UIControlEventTouchUpInside];
    [dcPathButton.button_1 addTarget:self action:@selector(button_1_Press:) forControlEvents:UIControlEventTouchUpInside];
    [dcPathButton.button_2 addTarget:self action:@selector(button_2_Press:) forControlEvents:UIControlEventTouchUpInside];
    [dcPathButton.button_3 addTarget:self action:@selector(button_3_Press:) forControlEvents:UIControlEventTouchUpInside];
    [dcPathButton.button_4 addTarget:self action:@selector(button_4_Press:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:dcPathButton];
}

#pragma mark - DCPathButton delegate

- (IBAction)button_0_Press:(id)sender{
    NSLog(@"Button_0:(%.0f,%.0f)",dcPathButton.button_0.frame.origin.x,dcPathButton.button_0.frame.origin.y);
}

- (IBAction)button_1_Press:(id)sender{
    NSLog(@"Button_1:(%.0f,%.0f)",dcPathButton.button_1.frame.origin.x,dcPathButton.button_1.frame.origin.y);
}

- (IBAction)button_2_Press:(id)sender{
    NSLog(@"Button_2:(%.0f,%.0f)",dcPathButton.button_2.frame.origin.x,dcPathButton.button_2.frame.origin.y);
}
- (IBAction)button_3_Press:(id)sender{
    NSLog(@"Button_3:(%.0f,%.0f)",dcPathButton.button_3.frame.origin.x,dcPathButton.button_3.frame.origin.y);
}
- (IBAction)button_4_Press:(id)sender{
    NSLog(@"Button_4:(%.0f,%.0f)",dcPathButton.button_4.frame.origin.x,dcPathButton.button_4.frame.origin.y);
}

@end
