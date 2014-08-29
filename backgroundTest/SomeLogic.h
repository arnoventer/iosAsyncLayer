//
// Created by Arno Venter on 2014/08/27.
// Copyright (c) 2014 Runninghill Software Development. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SomeLogicDelegate.h"

@protocol ServiceCallerDelegate;

@interface SomeLogic : NSObject <SomeLogicDelegate>

- (id)initWithServiceCaller:(id <ServiceCallerDelegate>)caller;

@end