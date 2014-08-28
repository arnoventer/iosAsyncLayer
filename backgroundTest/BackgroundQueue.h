//
// Created by Arno Venter on 2014/08/28.
// Copyright (c) 2014 Runninghill Software Development. All rights reserved.
//

#import <Foundation/Foundation.h>

#define async(o) dispatch_async([BackgroundQueue MyBackgroundSerialQueue],^{o;});

@interface BackgroundQueue : NSObject
+ (dispatch_queue_t)MyBackgroundSerialQueue;
@end