//
//  ViewController.m
//  Example
//
//  Created by tang dixi on 11/8/14.
//  Copyright (c) 2014 Tangdxi. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    uint8_t buffer = malloc(1024 * 1024 * 10);
    uint8_t buffer_2[1024 * 1024 * 10];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
