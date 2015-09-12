//
//  ViewController.m
//  EZOTestSync
//
//  Created by TangYunfei on 15/9/13.
//  Copyright (c) 2015年 TangYunfei. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+SyncExecuter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self executeSyncWithBlock:^(dispatch_semaphore_t semaphore) {
        
        
        [self executeAsynTask:semaphore];
        
    }];
    
    NSLog(@"finish executing Async task synchronously");
    
}

- (void)executeAsynTask:(dispatch_semaphore_t)semaphore
{
    //put your asynchronous work here,as long as you call dispatch_semaphore_signal(semaphore) after you get your work done,you are good to go, the following is an example
    
    //you should not do your asynchronous work in the same thread you are calling executeSyncWithBlock with
    
    
    NSLog(@"before executing Async task");
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), queue, ^{
        
        dispatch_semaphore_signal(semaphore);
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
