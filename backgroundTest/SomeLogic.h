//
// Created by Arno Venter on 2014/08/27.
// Copyright (c) 2014 Runninghill Software Development. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MethodDelegates;
@protocol ServiceCallerDelegate;

@interface SomeLogic : NSObject

- (id)initWithServiceCaller:(id <ServiceCallerDelegate>)caller;

- (void)thisMethodWillRunInBackground:(MethodDelegates *)methods;

@end