//
//  HoverViewFlowLayout.h
//  Douyin
//
//  Created by Abakus on 2021/3/28.
//  Copyright © 2021年 Abakus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HoverViewFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) CGFloat      topHeight;

- (instancetype)initWithTopHeight:(CGFloat)height;

@end
