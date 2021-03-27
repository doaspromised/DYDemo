//
//  DYUserHomePageController.h
//  DouyinDemo
//
//  Created by Abakus on 2021/3/27.
//

#import <UIKit/UIKit.h>
#import "User.h"
NS_ASSUME_NONNULL_BEGIN

@interface DYUserHomePageController : BaseViewController

@property (nonatomic, strong) UICollectionView                 *collectionView;
@property (nonatomic, assign) NSInteger                        selectIndex;

@end

NS_ASSUME_NONNULL_END
