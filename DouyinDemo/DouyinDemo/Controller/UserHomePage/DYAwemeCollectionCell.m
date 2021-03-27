//
//  DYAwemeCollectionCell.m
//  DouyinDemo
//
//  Created by Abakus on 2021/3/27.
//

#import "DYAwemeCollectionCell.h"

@implementation DYAwemeCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = ColorRandom;
    }
    return self;
}
@end
