//
//  NSObject+SyncExecuter.h
//  EZOTestSync
//
//  Created by TangYunfei on 15/9/13.
//  Copyright (c) 2015年 TangYunfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(SyncExecuter)

- (void)executeSyncWithBlock:(void(^)(dispatch_semaphore_t semaphore))block;

@end
