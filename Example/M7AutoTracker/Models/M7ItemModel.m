//
//  M7ItemModel.m
//  M7AutoTracker_Example
//
//  Created by DevMan7 on 2018/12/14.
//  Copyright © 2018年 yusipeng. All rights reserved.
//

#import "M7ItemModel.h"

@implementation M7ItemModel

- (instancetype)initWithTitle:(NSString *)title
                        intro:(NSString *)intro {
    if (self = [super init]) {
        _title = [title copy];
        _intro = [intro copy];
    }
    return self;
}

@end
