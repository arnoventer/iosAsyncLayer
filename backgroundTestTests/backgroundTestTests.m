//
//  backgroundTestTests.m
//  backgroundTestTests
//
//  Created by Arno Venter on 2014/08/27.
//  Copyright (c) 2014 Runninghill Software Development. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OCMock.h"
#import "ServiceCallerDelegate.h"
#import "SomeLogic.h"

@interface backgroundTestTests : XCTestCase

@end

@implementation backgroundTestTests {
    SomeLogic *systemUnderTest;
}

- (void)setUp
{
    [super setUp];


    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
//    id<ServiceCallerDelegate> mock = [OCMockObject mockForProtocol:@protocol(ServiceCallerDelegate)];
    id mock = [OCMockObject mockForProtocol:@protocol(ServiceCallerDelegate)];

    [[[mock stub] andReturnValue:@1] runMethodOnAFNetworking];

    systemUnderTest = [[SomeLogic alloc] initWithServiceCaller:mock];

    NSError *error;
    NSNumber *result = [systemUnderTest login:&error];

    XCTAssert(result.intValue == 1, @"It didn't return 1");

}

@end
