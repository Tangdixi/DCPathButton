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
    [images addImage:@"dc-button_0"];
    [images addImage:@"dc-button_1"];
    [images addImage:@"dc-button_2"];
    [images addImage:@"dc-button_3"];
    
    
    
    dcPathButton=[[DCPathButton alloc]initWithButtonCount:4
                                              totalRadius:60
                                             centerRadius:40
                                              centerImage:[UIImage imageNamed:kDCPathCenterButtonDefaultImage]
                                    centerBackgroundImage:[UIImage imageNamed:kDCPathCenterButtonDefaultImage]
                               centerButtonHighLightImage:[UIImage imageNamed:kDCPathCenterButtonDefaultHighLightImage]
                                             buttonRadius:30
                                    buttonBackgroundImage:[UIImage imageNamed:@"dc-buttonBackground.png"]
                                             buttonImages:images];
    [dcPathButton.button_0 addTarget:self action:@selector(button_0_Press:) forControlEvents:UIControlEventTouchUpInside];
    [dcPathButton.button_1 addTarget:self action:@selector(button_1_Press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dcPathButton];
}

#pragma mark - DCPathButton delegate

- (IBAction)button_0_Press:(id)sender{
    NSLog(@"Tap button_0");
}

- (IBAction)button_1_Press:(id)sender{
    NSLog(@"Tap button_1");
}

@end
