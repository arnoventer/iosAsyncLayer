//
// Created by Arno Venter on 2014/08/28.
// Copyright (c) 2014 Runninghill Software Development. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DummyService : NSObject
- (void)runSomeLongOperationAndDo:(void (^)())bla;
@end