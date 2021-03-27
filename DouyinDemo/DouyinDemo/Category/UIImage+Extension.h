//
//  UIImage+Extension.h
//  Douyin
//
//  Created by Abakus on 2021/3/28.
//  Copyright © 2018年 Abakus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

- (UIImage *)drawRoundedRectImage:(CGFloat)cornerRadius width:(CGFloat)width height:(CGFloat)height;

- (UIImage *)drawCircleImage;

@end
