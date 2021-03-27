//
//  SlideTabBar.h
//  Douyin
//
//  Created by Abakus on 2021/10/22.
//  Copyright © 2018 Abakus. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OnTabTapActionDelegate

@required
- (void)onTabTapAction:(NSInteger)index;

@end

@interface SlideTabBar : UIView

@property (nonatomic, weak) id <OnTabTapActionDelegate> delegate;

- (void)setLabels:(NSArray<NSString *> *)titles tabIndex:(NSInteger)tabIndex;

@end
