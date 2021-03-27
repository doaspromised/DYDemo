//
//  UserResponse.h
//  Douyin
//
//  Created by Abakus on 2021/3/28.
//  Copyright © 2021年 Abakus. All rights reserved.
//

#import "BaseResponse.h"
#import "User.h"

@interface UserResponse:BaseResponse

@property (nonatomic, strong) User    *data;

@end
