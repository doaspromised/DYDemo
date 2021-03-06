//
//  DYUserInfoHeader.h
//  DouyinDemo
//
//  Created by Abakus on 2021/3/27.
//

#import <UIKit/UIKit.h>
#import "SlideTabBar.h"
@class User;

NS_ASSUME_NONNULL_BEGIN

static const NSInteger UserInfoHeaderAvatarTag = 0x01;
static const NSInteger UserInfoHeaderSendTag = 0x02;
static const NSInteger UserInfoHeaderFocusTag = 0x03;
static const NSInteger UserInfoHeaderFocusCancelTag = 0x04;
static const NSInteger UserInfoHeaderSettingTag = 0x05;
static const NSInteger UserInfoHeaderGithubTag = 0x06;

@protocol UserInfoDelegate

- (void)onUserActionTap:(NSInteger)tag;

@end

@interface DYUserInfoHeader : UICollectionReusableView

@property (nonatomic, weak)   id <UserInfoDelegate>        delegate;
@property (nonatomic, assign) BOOL                         isFollowed;

@property (nonatomic, strong) UIImageView                  *avatar;
@property (nonatomic, strong) UIImageView                  *topBackground;
@property (nonatomic, strong) UIImageView                  *bottomBackground;

@property (nonatomic, strong) UILabel                      *sendMessage;
@property (nonatomic, strong) UIImageView                  *focusIcon;
@property (nonatomic, strong) UIImageView                  *settingIcon;
@property (nonatomic, strong) UIButton                     *focusButton;

@property (nonatomic, strong) UILabel                      *nickName;
@property (nonatomic, strong) UILabel                      *douyinNum;
@property (nonatomic, strong) UIButton                     *github;
@property (nonatomic, strong) UILabel                      *brief;
@property (nonatomic, strong) UIImageView                  *genderIcon;
@property (nonatomic, strong) UITextView                   *city;
@property (nonatomic, strong) UILabel                      *likeNum;
@property (nonatomic, strong) UILabel                      *followNum;
@property (nonatomic, strong) UILabel                      *followedNum;

@property (nonatomic, strong) SlideTabBar                  *slideTabBar;

- (void)initData:(User *)user;
- (void)overScrollAction:(CGFloat) offsetY;
- (void)scrollToTopAction:(CGFloat) offsetY;
- (void)startFocusAnimation;


@end

NS_ASSUME_NONNULL_END
