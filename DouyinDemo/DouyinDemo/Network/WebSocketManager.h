//
//  WebSocketManager.h
//  Douyin
//
//  Created by Abakus on 2021/3/28.
//  Copyright © 2021年 Abakus. All rights reserved.
//

#import <UIKit/UIKit.h>

//定义消息通知常量名称
extern NSString *const WebSocketDidReceiveMessageNotification;

@interface WebSocketManager:NSObject
//WebSocketManager单例
+ (instancetype)shareManager;
//断开连接
- (void)disConnect;
//连接
- (void)connect;
//发送消息
- (void)sendMessage:(id)msg;

@end
