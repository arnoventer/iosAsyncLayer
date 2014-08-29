//
//  ViewController.m
//  backgroundTest
//
//  Created by Arno Venter on 2014/08/27.
//  Copyright (c) 2014 Runninghill Software Development. All rights reserved.
//

#import "ViewController.h"
#import "SBStepUp.h"
#import "SomeLogic.h"
#import "ServiceCaller.h"
#import "DummyDiFactory.h"
#import "SomeLogicAsyncWrapper.h"

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)methodThatCallsALogicMethodInTheBackground {

//    MethodDelegates * objectWithCompletionMethods= [MethodDelegates create:self];
//    objectWithCompletionMethods.completedSuccessfullySelector = @selector(orlo:);
//    objectWithCompletionMethods.completedWithErrorSelector = @selector(error:);

    MethodDelegates * objectWithCompletionMethods= [MethodDelegates create:self completed:@selector(orlo:) error:@selector(error:)];

    id someLogicAsyncWrapper = @0;
    SomeLogicAsyncWrapper*wrapper =(SomeLogicAsyncWrapper*)[[DummyDiFactory instance] resolve:someLogicAsyncWrapper];

    async([wrapper loginInBackground:objectWithCompletionMethods])
}

-(void)orlo:(NSNumber *)methodParam {
    NSLog(@"orlo from the method");
    NSLog(@"the param from the method: %d", methodParam.intValue);
}

-(void)error:(NSError*)methodParam {
    NSLog(@"orlo from the method");
    NSLog(@"the param from the method: %@", methodParam);
}

- (IBAction)makeTheServiceCall:(id)sender {
    [self methodThatCallsALogicMethodInTheBackground];
}

@end
