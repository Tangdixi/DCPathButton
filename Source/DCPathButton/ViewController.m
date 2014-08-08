//
//  ViewController.m
//  DCPathButton
//
//  Created by tang dixi on 30/7/14.
//  Copyright (c) 2014 Tangdxi. All rights reserved.
//

#import "ViewController.h"
#import "DCPathButton.h"

@interface ViewController ()<DCPathButtonDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    DCPathButton *pathButton = [[DCPathButton alloc]init];
    pathButton.delegate = self;
    
    [self.view addSubview:pathButton];
    
}

- (void)itemButtonTappedAtIndex:(NSUInteger)index
{
    if (index == 0) {
        NSLog(@"Done!");
        return ;
    }
    NSLog(@"Never!");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
