//
// Created by Arno Venter on 2014/08/27.
// Copyright (c) 2014 Runninghill Software Development. All rights reserved.
//

#import "SomeLogic.h"
#import "ServiceCaller.h"
#import "ServiceCallerDelegate.h"


@interface SomeLogic()

@property id<ServiceCallerDelegate> serviceCaller;

@end

@implementation SomeLogic {

}

- (id)initWithServiceCaller:(id<ServiceCallerDelegate>)caller {
    self = [super init];
    if (self) {
        self.serviceCaller = caller;
    }

    return self;
}


- (void)thisMethodWillRunInBackground:(MethodDelegates *)methods  {
    //code here

    id<ServiceCallerDelegate> serviceCaller = self.serviceCaller;
//    [serviceCaller runMethodThatWaitsForItsBlocksToComplete];

    int result = [serviceCaller runMethodOnAFNetworking];

    if(result != -1) {
        [methods completedSuccessfully:@"ohai"];
    } else {
        [methods completedWithError:[NSError new]];
    }
}

@end