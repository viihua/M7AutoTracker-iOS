//
//  M7ExampleModel.h
//  M7AutoTracker_Example
//
//  Created by DevMan7 on 2018/12/14.
//  Copyright © 2018年 yusipeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface M7ExampleModel : NSObject

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) Class controllerClass;

- (instancetype)initWithName:(NSString *)name
             controllerClass:(Class)controllerClass;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end
