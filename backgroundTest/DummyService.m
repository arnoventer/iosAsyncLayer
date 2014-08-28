//
// Created by Arno Venter on 2014/08/28.
// Copyright (c) 2014 Runninghill Software Development. All rights reserved.
//

#import "DummyService.h"


@implementation DummyService {

}

-(void)runSomeLongOperationAndDo:(void (^)())bla {

    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [NSThread sleepForTimeInterval:5];

        bla();
    });


}


@end