//
// Created by Arno Venter on 2014/08/29.
// Copyright (c) 2014 Runninghill Software Development. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DummyDiFactory : NSObject

+ (DummyDiFactory *)instance;

- (id)resolve:(id)objectToResolve;
@end