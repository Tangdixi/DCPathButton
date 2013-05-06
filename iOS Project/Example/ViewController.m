//
//  ViewController.m
//  DCPathButton
//
//  Created by Paul on 4/19/13.
//  Copyright (c) 2013 Paul. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.frame = CGRectMake(0, 0, 320, 460);
    self.view.backgroundColor = [UIColor whiteColor];
    DCPathButton *dcPathButton = [[DCPathButton alloc]
                                  initDCPathButtonWithSubButtons:6
                                  totalRadius:60
                                  centerRadius:15
                                  subRadius:15
                                  centerImage:@"custom_center"
                                  centerBackground:nil
                                  subImages:^(DCPathButton *dc){
                                      [dc subButtonImage:@"custom_1" withTag:0];
                                      [dc subButtonImage:@"custom_2" withTag:1];
                                      [dc subButtonImage:@"custom_3" withTag:2];
                                      [dc subButtonImage:@"custom_4" withTag:3];
                                      [dc subButtonImage:@"custom_5" withTag:4];
                                      [dc subButtonImage:@"custom_2" withTag:5];
                                  }
                                  subImageBackground:nil
                                  inLocationX:0 locationY:0 toParentView:self.view];
    dcPathButton.delegate = self;
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - DCPathButton delegate

- (void)button_0_action{
    NSLog(@"Button Press Tag 0!!");
}

- (void)button_1_action{
    NSLog(@"Button Press Tag 1!!");
}

- (void)button_2_action{
    NSLog(@"Button Press Tag 2!!");
}

- (void)button_3_action{
    NSLog(@"Button Press Tag 3!!");
}

- (void)button_4_action{
    NSLog(@"Button Press Tag 4!!");
}

- (void)button_5_action{
    NSLog(@"Button Press Tag 5!!");    
}

@end
