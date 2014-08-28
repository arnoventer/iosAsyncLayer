//
// Created by Arno Venter on 2014/08/27.
// Copyright (c) 2014 Runninghill Software Development. All rights reserved.
//

#import "MethodDelegates.h"
#import "SBStepUp.h"


@implementation MethodDelegates {

}

- (id)initWithCaller:(id)caller {
    self = [super init];
    if (self) {
        self.caller = caller;
    }
    return self;
}

- (id)initWithCaller:(id)caller completedSelector:(SEL)completedSelector errorSelector:(SEL)errorSelector {
    self = [self initWithCaller:caller];
    if (self) {
        self.completedSuccessfullySelector = completedSelector;
        self.completedWithErrorSelector = errorSelector;
    }
    return self;
}

- (id)initWithCaller:(id)caller completedSelector:(SEL)completedSelector errorSelector:(SEL)errorSelector stepUpSelector:(SEL)stepUpSelector {
    self = [self initWithCaller:caller completedSelector:completedSelector errorSelector:errorSelector];
    if (self) {
        self.completedWithStepUpSelector = stepUpSelector;
    }
    return self;
}

+ (MethodDelegates *)create:(id)caller {
    return [[MethodDelegates alloc] initWithCaller:caller];
}

+ (MethodDelegates *)create:(id)caller completed:(SEL)completed error:(SEL)error {
    return [[MethodDelegates alloc] initWithCaller:caller completedSelector:completed errorSelector:error];
}

+ (MethodDelegates *)create:(id)caller completed:(SEL)completed error:(SEL)error stepUp:(SEL)stepUp {
    return [[MethodDelegates alloc] initWithCaller:caller completedSelector:completed errorSelector:error stepUpSelector:stepUp];
}

- (void)completedSuccessfully:(id)response {
//    id o = self.caller;
//    if ([o respondsToSelector:self.completedSuccessfullySelector]) {
//        [o performSelector:self.completedSuccessfullySelector withObject:response];
//    }


    //internet awesomeness
//    SEL selector = NSSelectorFromString(@"someMethod");

    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
//        __strong typeof(self) strongSelf = weakSelf;
//        if (strongSelf) {
//            IMP imp = [strongSelf.caller methodForSelector:strongSelf.completedSuccessfullySelector];
//            void (*func)(id, SEL, id) = (void *) imp;
//            func(strongSelf.caller, strongSelf.completedSuccessfullySelector, response);
        IMP imp = [_caller methodForSelector:_completedSuccessfullySelector];
        void (*func)(id, SEL, id) = (void *) imp;
        func(_caller, _completedSuccessfullySelector, response);
//        }
    });


}

- (void)completedWithError:(NSError *)error {
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        __strong typeof(self) strongSelf = weakSelf;
        if (strongSelf) {
            IMP imp = [strongSelf.caller methodForSelector:strongSelf.completedSuccessfullySelector];
            void (*func)(id, SEL, NSError *) = (void *) imp;
            func(strongSelf.caller, strongSelf.completedSuccessfullySelector, error);
        }
    });

}

- (void)completedWithStepUp:(SBStepUp *)stepUp {

    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        __strong typeof(self) strongSelf = weakSelf;
        if (strongSelf) {
            IMP imp = [strongSelf.caller methodForSelector:strongSelf.completedSuccessfullySelector];
            void (*func)(id, SEL, SBStepUp *) = (void *) imp;
            func(strongSelf.caller, strongSelf.completedSuccessfullySelector, stepUp);
        }
    });

}


@end