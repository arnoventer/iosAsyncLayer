//
// Created by Arno Venter on 2014/08/29.
// Copyright (c) 2014 Runninghill Software Development. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SomeLogicDelegate <NSObject>

- (NSNumber *)login:(NSError **)error;

@end