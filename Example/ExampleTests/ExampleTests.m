//
//  ExampleTests.m
//  ExampleTests
//
//  Created by tang dixi on 12/8/14.
//  Copyright (c) 2014 Tangdxi. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DCPathButtonTestObject.h"
#import <DCPathButton/DCPathButton.h>

@interface ExampleTests : XCTestCase

@property (nonatomic, strong) DCPathButtonTestObject *pathButtonTestView;
@property (nonatomic, strong) DCPathButton *dcPathButton;

@end

@implementation ExampleTests

#pragma mark - Setup -

- (void)setUp {
    [super setUp];

    self.pathButtonTestView = [DCPathButtonTestObject new];

    self.dcPathButton = [[DCPathButton alloc] initWithCenterImage:[UIImage imageNamed:@"chooser-button-tab"]
                                                 highlightedImage:[UIImage imageNamed:@"chooser-button-tab-highlighted"]];

    [self.dcPathButton addPathItems:self.pathButtonTestView.pathButtonItems];
}

- (void)tearDown {
    self.pathButtonTestView = nil;
    self.dcPathButton = nil;

    [super tearDown];
}

#pragma mark - Tests -

- (void)testDCPathButtonBloomDirectionIsTopDirectionTrue {
    self.dcPathButton.bloomDirection = kDCPathButtonBloomDirectionTop;
    XCTAssertTrue(self.dcPathButton.bloomDirection == kDCPathButtonBloomDirectionTop);
}

- (void)testDCPathButtonAllowsCenterRotationIsTrue {
    self.dcPathButton.allowCenterButtonRotation = YES;
    XCTAssertTrue(self.dcPathButton.allowCenterButtonRotation);
}

- (void)testDCPathButtonCenterMatchesAssignedCGPointIsTrue {
    CGPoint centerPoint = CGPointMake(250, 200);

    self.dcPathButton.center = centerPoint;

    XCTAssertTrue(CGPointEqualToPoint(self.dcPathButton.center, centerPoint));
}

- (void)testDCPathButtonAllowsSoundIsFalse {
    self.dcPathButton.allowSounds = NO;
    XCTAssertFalse(self.dcPathButton.allowSounds);
}

- (void)testDCPathButtonAllowSubItemRotationIsFalse {
    self.dcPathButton.allowSubItemRotation = NO;
    XCTAssertFalse(self.dcPathButton.allowSubItemRotation);
}

@end
