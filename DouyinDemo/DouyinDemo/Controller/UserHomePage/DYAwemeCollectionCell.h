//
//  DYAwemeCollectionCell.h
//  DouyinDemo
//
//  Created by Abakus on 2021/3/27.
//

#import <UIKit/UIKit.h>
@class WebPImageView;
@class Aweme;

NS_ASSUME_NONNULL_BEGIN

@interface DYAwemeCollectionCell : UICollectionViewCell

@property (nonatomic, strong) WebPImageView    *imageView;
@property (nonatomic, strong) UIButton         *favoriteNum;

- (void)initData:(Aweme *)aweme;

@end

NS_ASSUME_NONNULL_END
