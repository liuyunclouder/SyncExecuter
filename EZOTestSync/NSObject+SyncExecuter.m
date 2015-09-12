//
//  NSObject+SyncExecuter.m
//  EZOTestSync
//
//  Created by TangYunfei on 15/9/13.
//  Copyright (c) 2015年 TangYunfei. All rights reserved.
//

#import "NSObject+SyncExecuter.h"

@implementation NSObject(SyncExecuter)

- (void)executeSyncWithBlock:(void(^)(dispatch_semaphore_t semaphore))block
{

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    block(semaphore);
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    NSLog(@"after executing Async task");
    
}

@end
