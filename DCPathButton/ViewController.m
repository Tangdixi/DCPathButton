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
    NSArray *images = [NSArray arrayWithObjects:[UIImage imageNamed:kDCPathButtonDefaultImage],[UIImage imageNamed:kDCPathButtonDefaultImage],[UIImage imageNamed:kDCPathButtonDefaultImage], nil];
    
    dcPathButton=[[DCPathButton alloc]initWithButtonCount:3 totalRadius:60 centerRadius:40 centerImage:nil centerBackgroundImage:nil centerButtonHighLightImage:nil buttonRadius:40 buttonBackgroundImage:nil buttonImages:images];
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
