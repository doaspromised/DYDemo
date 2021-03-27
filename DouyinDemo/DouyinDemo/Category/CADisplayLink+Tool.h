//
//  CADisplayLink+Tool.h
//  Douyin
//
//  Created by Abakus on 2021/9/27.
//  Copyright © 2021年 Abakus. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ExecuteMethodBlock) (CADisplayLink *displayLink);

@interface CADisplayLink (Tool)

@property (nonatomic,copy)ExecuteMethodBlock executeBlock;

+ (CADisplayLink *)displayLinkWithExecuteBlock:(ExecuteMethodBlock)block;

@end
