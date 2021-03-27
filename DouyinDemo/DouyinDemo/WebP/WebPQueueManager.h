//
//  WebPQueueManager.h
//  Douyin
//
//  Created by Abakus on 2021/3/28.
//  Copyright © 2018年 Abakus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebPQueueManager:NSObject

//WebPQueueManager单例
+(WebPQueueManager *)shareWebPQueueManager;

//添加NSOperationQueue队列
-(void)addQueue:(NSOperationQueue *)queue;

//取消指定NSOperationQueue队列
-(void)cancelQueue:(NSOperationQueue *)queue;

//刮起NSOperationQueue队列
-(void)suspendQueue:(NSOperationQueue *)queue suspended:(BOOL)suspended;

@end
