//
//  ViewController.m
//  Example
//
//  Created by Paul on 3/31/13.
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
    NSMutableArray *images = [NSMutableArray arrayContainImages:4];// Use a NSMutableArray catagory I provide, or you can use a mutable array to achive the same goal
    
    [images addImage:@"dc-button_0.png"];
    [images addImage:@"dc-button_1.png"];
    [images addImage:@"dc-button_2.png"];
    [images addImage:@"dc-button_3.png"];
    [images addImage:@"dc-button_4.png"];
    
    dcPathButton=[[DCPathButton alloc]initWithButtonCount:5
                                              totalRadius:60
                                             centerRadius:20
                                              centerImage:[UIImage imageNamed:kDCPathCenterButtonDefaultImage]
                                    centerBackgroundImage:[UIImage imageNamed:kDCPathCenterButtonDefaultImage]
                               centerButtonHighLightImage:[UIImage imageNamed:kDCPathCenterButtonDefaultHighLightImage]
                                             buttonRadius:15
                                    buttonBackgroundImage:[UIImage imageNamed:@"dc-buttonBackground.png"]
                                             buttonImages:images];
    dcPathButton.delegate = self;
    [self.view addSubview:dcPathButton];
}

#pragma mark - DCPathButton delegate

- (void)button_0_press{
    NSLog(@"Press 0");
}

- (void)button_1_press{
    NSLog(@"Press 1");
}

- (void)button_2_press{
    NSLog(@"Press 2");
}

- (void)button_3_press{
    NSLog(@"Press 3");
}

- (void)button_4_press{
    NSLog(@"Press 4");
}

@end

