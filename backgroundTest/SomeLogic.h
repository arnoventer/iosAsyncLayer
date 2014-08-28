//
// Created by Arno Venter on 2014/08/27.
// Copyright (c) 2014 Runninghill Software Development. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MethodDelegates;


@interface SomeLogic : NSObject
+ (void)thisMethodWillRunInBackground:(MethodDelegates *)methods;
@end