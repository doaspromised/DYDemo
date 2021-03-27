//
//  DYUserHomePageController.m
//  DouyinDemo
//
//  Created by Abakus on 2021/3/27.
//

#import "DYUserHomePageController.h"
#import "HoverViewFlowLayout.h"
#import "DYUserInfoHeader.h"
#import "DYAwemeCollectionCell.h"
#import "AwemeListRequest.h"
#import "UserRequest.h"
#import "UserResponse.h"
#define kUserInfoHeaderHeight          350 + SafeAreaTopHeight
#define kSlideTabBarHeight             40

static NSString * const kUserInfoCell         = @"UserInfoCell";
static NSString * const kAwemeCollectionCell  = @"AwemeCollectionCell";

@interface DYUserHomePageController ()
<
UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout,
OnTabTapActionDelegate,
UserInfoDelegate
>

@property (nonatomic, copy) NSString                           *uid;
@property (nonatomic, strong) User                             *user;
@property (nonatomic, strong) NSMutableArray<Aweme *>          *workAwemes;
@property (nonatomic, strong) NSMutableArray<Aweme *>          *favoriteAwemes;
@property (nonatomic, assign) NSInteger                        pageIndex;
@property (nonatomic, assign) NSInteger                        pageSize;

@property (nonatomic, assign) NSInteger                        tabIndex;
@property (nonatomic, assign) CGFloat                          itemWidth;
@property (nonatomic, assign) CGFloat                          itemHeight;

@property (nonatomic, strong) DYUserInfoHeader                   *userInfoHeader;


@end
@implementation DYUserHomePageController

- (instancetype)init {
    self = [super init];
    if (self) {
        _uid = @"97795069353";
        
//        _workAwemes = [[NSMutableArray alloc]init];
//        _favoriteAwemes = [[NSMutableArray alloc]init];
//        _pageIndex = 0;
//        _pageSize = 18;
//
//        _tabIndex = 0;
//
//        _scalePresentAnimation = [ScalePresentAnimation new];
//        _scaleDismissAnimation = [ScaleDismissAnimation new];
//        _swipeLeftInteractiveTransition = [SwipeLeftInteractiveTransition new];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initCollectionView];
    [self loadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setNavigationBarTitleColor:ColorClear];
    [self setNavigationBarBackgroundColor:ColorClear];
    [self setStatusBarBackgroundColor:ColorClear];
    [self setStatusBarHidden:NO];
}

- (void)loadData {
    
    if(_user == nil) {
        [self loadUserData];
    }
    if(_favoriteAwemes.count == 0 && _workAwemes.count == 0) {
        [self loadData:_pageIndex pageSize:_pageSize];
    }
}

- (void)loadData:(NSInteger)pageIndex pageSize:(NSInteger)pageSize {
    AwemeListRequest *request = [AwemeListRequest new];
    request.page = pageIndex;
    request.size = pageSize;
    request.uid = _uid;
    __weak typeof (self) wself = self;
    if(_tabIndex == 0) {
        [NetworkHelper getWithUrlPath:FindAwemePostByPagePath request:request success:^(id data) {
            if(wself.tabIndex != 0) {
                return;
            }
            AwemeListResponse *response = [[AwemeListResponse alloc] initWithDictionary:data error:nil];
            NSArray<Aweme *> *array = response.data;
            wself.pageIndex++;
            
            [UIView setAnimationsEnabled:NO];
            [wself.collectionView performBatchUpdates:^{
                [wself.workAwemes addObjectsFromArray:array];
                NSMutableArray<NSIndexPath *> *indexPaths = [NSMutableArray array];
                for(NSInteger row = wself.workAwemes.count - array.count; row<wself.workAwemes.count; row++) {
                    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:1];
                    [indexPaths addObject:indexPath];
                }
                [wself.collectionView insertItemsAtIndexPaths:indexPaths];
            } completion:^(BOOL finished) {
                [UIView setAnimationsEnabled:YES];
            }];
            
//            [wself.loadMore endLoading];
            if(!response.has_more) {
//                [wself.loadMore loadingAll];
            }
        } failure:^(NSError *error) {
//            [wself.loadMore loadingFailed];
        }];
    }else {
        [NetworkHelper getWithUrlPath:FindAwemeFavoriteByPagePath request:request success:^(id data) {
            if(wself.tabIndex != 1) {
                return;
            }
            AwemeListResponse *response = [[AwemeListResponse alloc] initWithDictionary:data error:nil];
            NSArray<Aweme *> *array = response.data;
            wself.pageIndex++;
            
            [UIView setAnimationsEnabled:NO];
            [wself.collectionView performBatchUpdates:^{
                [wself.favoriteAwemes addObjectsFromArray:array];
                NSMutableArray<NSIndexPath *> *indexPaths = [NSMutableArray array];
                for(NSInteger row = wself.favoriteAwemes.count - array.count; row<wself.favoriteAwemes.count; row++) {
                    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:1];
                    [indexPaths addObject:indexPath];
                }
                [wself.collectionView insertItemsAtIndexPaths:indexPaths];
            } completion:^(BOOL finished) {
                [UIView setAnimationsEnabled:YES];
            }];
            
//            [wself.loadMore endLoading];
            if(!response.has_more) {
//                [wself.loadMore loadingAll];
            }
        } failure:^(NSError *error) {
//            [wself.loadMore loadingFailed];
        }];
    }
}

//HTTP data request
-(void)loadUserData {
    __weak typeof (self) wself = self;
    UserRequest *request = [UserRequest new];
    request.uid = _uid;
    [NetworkHelper getWithUrlPath:FindUserByUidPath request:request success:^(id data) {
        UserResponse *response = [[UserResponse alloc] initWithDictionary:data error:nil];
        wself.user = response.data;
        [wself setTitle:self.user.nickname];
        [wself.collectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
    } failure:^(NSError *error) {
        [UIWindow showTips:error.description];
    }];
}

- (void)initCollectionView {
    _itemWidth = (ScreenWidth - (CGFloat)(((NSInteger)(ScreenWidth)) % 3) ) / 3.0f - 1.0f;
    _itemHeight = _itemWidth * 1.35f;
    HoverViewFlowLayout *flowLayout = [[HoverViewFlowLayout alloc] initWithTopHeight:SafeAreaTopHeight + kSlideTabBarHeight];
    flowLayout.minimumLineSpacing = 1;
    flowLayout.minimumInteritemSpacing = 0;
    
    _collectionView = [[UICollectionView  alloc]initWithFrame:ScreenFrame collectionViewLayout:flowLayout];
    
    _collectionView.backgroundColor = ColorClear;
    if (@available(iOS 11.0, *)) {
        _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }

    _collectionView.alwaysBounceVertical = YES;
    _collectionView.showsVerticalScrollIndicator = NO;
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerClass:[DYUserInfoHeader class]
        forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
               withReuseIdentifier:kUserInfoCell];
    [_collectionView registerClass:[DYAwemeCollectionCell class] forCellWithReuseIdentifier:kAwemeCollectionCell];
    [self.view addSubview:_collectionView];
    
//    _loadMore = [[LoadMoreControl alloc] initWithFrame:CGRectMake(0, kUserInfoHeaderHeight, ScreenWidth, 50) surplusCount:3];
//    [_loadMore startLoading];
//    __weak __typeof(self) wself = self;
//    [_loadMore setOnLoad:^{
//        [wself loadData:wself.pageIndex pageSize:wself.pageSize];
//    }];
//    [_collectionView addSubview:_loadMore];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 1) {
        return 50;
    }
    return 0;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && [kind isEqualToString:UICollectionElementKindSectionHeader]) {
        DYUserInfoHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kUserInfoCell forIndexPath:indexPath];
        _userInfoHeader = header;
        if(_user) {
            [header initData:_user];
            header.delegate = self;
            header.slideTabBar.delegate = self;
        }
        return header;
    }
    
    return [UICollectionReusableView new];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DYAwemeCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kAwemeCollectionCell forIndexPath:indexPath];
//    Aweme *aweme;
//    if(_tabIndex == 0) {
//        aweme = [_workAwemes objectAtIndex:indexPath.row];
//    }else {
//        aweme = [_favoriteAwemes objectAtIndex:indexPath.row];
//    }
//    [cell initData:aweme];
    return cell;
}

//MARK: -  UICollectionFlowLayout Delegate

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if(section == 0) {
        return CGSizeMake(ScreenWidth, kUserInfoHeaderHeight);
    }
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return  CGSizeMake(_itemWidth, _itemHeight);
}

//OnTabTapDelegate
- (void)onTabTapAction:(NSInteger)index {
    if(_tabIndex == index){
        return;
    }
    _tabIndex = index;
    _pageIndex = 0;
    
    [UIView setAnimationsEnabled:NO];
    [self.collectionView performBatchUpdates:^{
        [self.workAwemes removeAllObjects];
        [self.favoriteAwemes removeAllObjects];
        
        if([self.collectionView numberOfItemsInSection:1]) {
            [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:1]];
        }
    } completion:^(BOOL finished) {
        [UIView setAnimationsEnabled:YES];
        
//        [self.loadMore reset];
//        [self.loadMore startLoading];
        
        [self loadData:self.pageIndex pageSize:self.pageSize];
    }];
    
}


//UserActionTap
- (void)onUserActionTap:(NSInteger)tag {
    switch (tag) {
        case UserInfoHeaderAvatarTag: {
//            PhotoView *photoView = [[PhotoView alloc] initWithUrl:_user.avatar_medium.url_list.firstObject];
//            [photoView show];
            break;
        }
        case UserInfoHeaderSendTag:
//            [self.navigationController pushViewController:[[ChatListController alloc] init] animated:YES];
            break;
        case UserInfoHeaderFocusCancelTag:
        case UserInfoHeaderFocusTag:{
            if(_userInfoHeader) {
                [_userInfoHeader startFocusAnimation];
            }
            break;
        }
        case UserInfoHeaderSettingTag:{
//            MenuPopView *menu = [[MenuPopView alloc] initWithTitles:@[@"清除缓存"]];
//            [menu setOnAction:^(NSInteger index) {
//                [[WebCacheHelpler sharedWebCache] clearCache:^(NSString *cacheSize) {
//                    [UIWindow showTips:[NSString stringWithFormat:@"已经清除%@M缓存",cacheSize]];
//                }];
//            }];
//            [menu show];
            break;
        }
            break;
        case UserInfoHeaderGithubTag:
//            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/sshiqiao/douyin-ios-objectc"]];
            break;
        default:
            break;
    }
}

@end
