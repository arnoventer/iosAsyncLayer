//
// Created by Arno Venter on 2014/08/28.
// Copyright (c) 2014 Runninghill Software Development. All rights reserved.
//

#import "BackgroundQueue.h"


@implementation BackgroundQueue {

}

+ (dispatch_queue_t)MyBackgroundSerialQueue {
    static dispatch_queue_t q;

    if (q == nil) {
        q = dispatch_queue_create("MyBackgroundSerialQueue", NULL);
    }

    return q;
}

@end