//
//  M7ExampleModel.m
//  M7AutoTracker_Example
//
//  Created by DevMan7 on 2018/12/14.
//  Copyright © 2018年 yusipeng. All rights reserved.
//

#import "M7ExampleModel.h"

@implementation M7ExampleModel

- (instancetype)initWithName:(NSString *)name
             controllerClass:(Class)controllerClass {
    if (self = [super init]) {
        _name = [name copy];
        _controllerClass = [controllerClass copy];
    }
    return self;
}

@end
