//
//  UIWindow+Extension.h
//  Douyin
//
//  Created by Abakus on 2021/3/28.
//  Copyright © 2018年 Abakus. All rights reserved.
//

#import <UIKit/UIKit.h>

static char tipsKey;
static char tapKey;

@interface UIWindow (Extension)

+(void)showTips:(NSString *)text;

@end
