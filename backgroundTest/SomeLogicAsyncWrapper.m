//
// Created by Arno Venter on 2014/08/29.
// Copyright (c) 2014 Runninghill Software Development. All rights reserved.
//

#import "SomeLogicAsyncWrapper.h"
#import "SomeLogic.h"

@interface SomeLogicAsyncWrapper()

@property id<SomeLogicDelegate> someLogicDelegate;

@end

@implementation SomeLogicAsyncWrapper {

}


- (id)initWithSomeLogic:(id<SomeLogicDelegate>)delegate {
    self = [super init];
    if (self) {
        self.someLogicDelegate = delegate;
    }

    return self;
}


- (void)loginInBackground:(MethodDelegates *)methods {

    NSError *error;
    NSNumber * result = [self.someLogicDelegate login:&error];

    if(!error) {
        [methods completedSuccessfully:result];
    } else {
        [methods completedWithError:error];
    }
}

@end