//
//  AwemeListResponse.h
//  Douyin
//
//  Created by Abakus on 2021/3/28.
//  Copyright © 2021年 Abakus. All rights reserved.
//

#import "BaseResponse.h"
#import "Aweme.h"

@interface AwemeListResponse:BaseResponse

@property (nonatomic, copy) NSArray<Aweme *> <Aweme>   *data;

@end
