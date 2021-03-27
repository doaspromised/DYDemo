//
//  BaseResponse.h
//  Douyin
//
//  Created by Abakus on 2021/3/28.
//  Copyright © 2018年 Abakus. All rights reserved.
//

#import "JSONModel.h"

@interface BaseResponse:JSONModel

@property (nonatomic , assign) NSInteger        code;
@property (nonatomic , copy) NSString           *message;
@property (nonatomic , assign) NSInteger        has_more;
@property (nonatomic, assign) NSInteger         total_count;

@end
