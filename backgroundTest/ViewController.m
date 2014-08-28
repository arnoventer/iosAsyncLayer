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

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self methodThatCallsALogicMethodInTheBackground];
}

- (void)methodThatCallsALogicMethodInTheBackground {

//    MethodDelegates * objectWithCompletionMethods= [MethodDelegates create:self];
//    objectWithCompletionMethods.completedSuccessfullySelector = @selector(orlo:);
//    objectWithCompletionMethods.completedWithErrorSelector = @selector(error:);

    MethodDelegates * objectWithCompletionMethods= [MethodDelegates create:self completed:@selector(orlo:) error:@selector(error:)];
    async([SomeLogic thisMethodWillRunInBackground:objectWithCompletionMethods])
}

-(void)orlo:(NSString*)methodParam {
    NSLog(@"orlo from the method");
    NSLog(@"the param from the method: %@", methodParam);
}

-(void)error:(NSError*)methodParam {
    NSLog(@"orlo from the method");
    NSLog(@"the param from the method: %@", methodParam);
}

@end
