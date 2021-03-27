//
//  Visitor.m
//  Douyin
//
//  Created by Abakus on 2021/3/28.
//  Copyright © 2018年 Abakus. All rights reserved.
//

#import "Visitor.h"
@implementation Visitor
-(NSString *)formatUDID {
    if(_udid.length < 8) return @"************";
    NSMutableString *udid = [[NSMutableString alloc] initWithString:_udid];
    [udid replaceCharactersInRange:NSMakeRange(4, udid.length-8) withString:@"****"];
    return udid;
}
@end
