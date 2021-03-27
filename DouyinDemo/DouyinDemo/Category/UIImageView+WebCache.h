//
//  UIImageView+WebCache.h
//  Douyin
//
//  Created by Abakus on 2021/3/28.
//  Copyright © 2021年 Abakus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebCacheHelpler.h"

static char loadOperationKey;

typedef void(^WebImageProgressBlock)(CGFloat persent);
typedef void(^WebImageCompletedBlock)(UIImage *image, NSError *error);
typedef void(^WebImageCanceledBlock)(void);

@interface UIImageView (WebCache)

- (void)setImageWithURL:(NSURL *)imageURL;
- (void)setImageWithURL:(NSURL *)imageURL completedBlock:(WebImageCompletedBlock)completedBlock;
- (void)setImageWithURL:(NSURL *)imageURL progressBlock:(WebImageProgressBlock)progressBlock completedBlock:(WebImageCompletedBlock)completedBlock;
- (void)setWebPImageWithURL:(NSURL *)imageURL progressBlock:(WebImageProgressBlock)progressBlock completedBlock:(WebImageCompletedBlock)completedBlock;

@end
