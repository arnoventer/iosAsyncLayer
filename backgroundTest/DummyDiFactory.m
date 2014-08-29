//
// Created by Arno Venter on 2014/08/29.
// Copyright (c) 2014 Runninghill Software Development. All rights reserved.
//

#import "DummyDiFactory.h"
#import "SomeLogic.h"
#import "ServiceCaller.h"
#import "SomeLogicAsyncWrapper.h"


@implementation DummyDiFactory {

    ServiceCaller *_serviceCaller;
    SomeLogic *_someLogic;
    SomeLogicAsyncWrapper *_someLogicAsyncWrapper;
}

+ (DummyDiFactory *)instance {
    static DummyDiFactory *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [DummyDiFactory new];
    });
    return instance;
}

- (id)init {
    self = [super init];
    if (self) {
         _serviceCaller = [ServiceCaller new];
        _someLogic = [[SomeLogic alloc] initWithServiceCaller:_serviceCaller];
        _someLogicAsyncWrapper = [[SomeLogicAsyncWrapper alloc] initWithSomeLogic:_someLogic];
    }

    return self;
}

-(id)resolve:(id)objectToResolve {
    return _someLogicAsyncWrapper;
//     if ([objectToResolve conformsToProtocol:@protocol(SomeLogicAsyncWrapperDelegate)]) {
//         return _someLogicAsyncWrapper;
//     } else if ([objectToResolve protocol] conformsToProtocol:@protocol(SomeLogicAsyncWrapperDelegate)]) {
//         return _someLogic;
//     } else if ([objectToResolve conformsToProtocol:@protocol(ServiceCallerDelegate)]) {
//        return _serviceCaller;
//    }
    return nil;
}

@end