//
// Created by Arno Venter on 2014/08/29.
// Copyright (c) 2014 Runninghill Software Development. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SomeLogicAsyncWrapperDelegate.h"

@protocol SomeLogicDelegate;

@interface SomeLogicAsyncWrapper : NSObject <SomeLogicAsyncWrapperDelegate>

- (id)initWithSomeLogic:(id <SomeLogicDelegate>)delegate;

@end