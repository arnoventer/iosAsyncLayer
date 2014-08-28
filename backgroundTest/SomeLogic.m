//
// Created by Arno Venter on 2014/08/27.
// Copyright (c) 2014 Runninghill Software Development. All rights reserved.
//

#import "SomeLogic.h"
#import "MethodDelegates.h"
#import "ServiceCaller.h"


@implementation SomeLogic {

}

+ (void)thisMethodWillRunInBackground:(MethodDelegates *)methods  {
    //code here

    ServiceCaller * serviceCaller = [ServiceCaller new];
    [serviceCaller runMethodThatWaitsForItsBlocksToComplete];

    if(1 == 1) {
        [methods completedSuccessfully:@"ohai"];
    } else {
        [methods completedWithError:[NSError new]];
    }
}

@end