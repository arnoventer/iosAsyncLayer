//
// Created by Arno Venter on 2014/08/29.
// Copyright (c) 2014 Runninghill Software Development. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SomeLogicAsyncWrapperDelegate <NSObject>

- (void)loginInBackground:(MethodDelegates *)methods;

@end