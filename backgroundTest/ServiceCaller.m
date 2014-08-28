//
// Created by Arno Venter on 2014/08/28.
// Copyright (c) 2014 Runninghill Software Development. All rights reserved.
//

#import "ServiceCaller.h"
#import "DummyService.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"


@implementation ServiceCaller {

}

//
//http://www.g8production.com/post/76942348764/wait-for-blocks-execution-using-a-dispatch-semaphore
//
// GO check for examples on how to do this for SINGLE BLOCK, MULTIPLE BLOCKS, BLOCK IN BLOCK
//

-(int)runMethodThatWaitsForItsBlocksToComplete {
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);

    __block int valueThatGetsSetInBlock = -1;

    DummyService * dummyService = [DummyService new];

    [dummyService runSomeLongOperationAndDo:^{

        valueThatGetsSetInBlock = 14;
        dispatch_semaphore_signal(sema);
    }];

    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    int codeRunningAfterWaitingForBlock = valueThatGetsSetInBlock;
    return codeRunningAfterWaitingForBlock;
}


-(int)runMethodOnAFNetworking {
    AFHTTPRequestOperationManager* manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://beaconservice.azurewebsites.net/api/"]];

    dispatch_semaphore_t sema = dispatch_semaphore_create(0);

    __block int valueThatGetsSetInBlock = -1;

    [manager GET:@"location" parameters:@{@"device":@"Riaan6"}
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              valueThatGetsSetInBlock = 14;
              dispatch_semaphore_signal(sema);
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              valueThatGetsSetInBlock = 7;
              dispatch_semaphore_signal(sema);
          }
    ];

    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    int codeRunningAfterWaitingForBlock = valueThatGetsSetInBlock;
    return codeRunningAfterWaitingForBlock;
}

@end