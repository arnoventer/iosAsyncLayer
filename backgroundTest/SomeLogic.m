//
// Created by Arno Venter on 2014/08/27.
// Copyright (c) 2014 Runninghill Software Development. All rights reserved.
//

#import "SomeLogic.h"
#import "ServiceCaller.h"

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


- (NSNumber *)login:(NSError **)error  {

    id<ServiceCallerDelegate> serviceCaller = self.serviceCaller;

    int result = [serviceCaller runMethodOnAFNetworking];

    //
    //do some logic with the service response;
    //

    //if it fails set the error
    if(result == -1)
    {
        *error = [NSError new];
    }

    //return the response
    return @(result);
}

@end