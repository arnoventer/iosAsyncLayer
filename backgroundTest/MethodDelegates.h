//
// Created by Arno Venter on 2014/08/27.
// Copyright (c) 2014 Runninghill Software Development. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SBStepUp;

@interface MethodDelegates : NSObject


- (id)initWithCaller:(id)caller;

- (id)initWithCaller:(id)caller completedSelector:(SEL)completedSelector errorSelector:(SEL)errorSelector;

- (id)initWithCaller:(id)caller completedSelector:(SEL)completedSelector errorSelector:(SEL)errorSelector stepUpSelector:(SEL)stepUpSelector;

+ (MethodDelegates *)create:(id)caller;

+ (MethodDelegates *)create:(id)caller completed:(SEL)completed error:(SEL)error;

+ (MethodDelegates *)create:(id)caller completed:(SEL)completed error:(SEL)error stepUp:(SEL)stepUp;

-(void)completedSuccessfully:(id)response;
-(void)completedWithError:(NSError *)error;
-(void)completedWithStepUp:(SBStepUp*)stepUp;

@property SEL completedSuccessfullySelector;
@property SEL completedWithErrorSelector;
@property SEL completedWithStepUpSelector;
@property (weak) id caller;

@end