//
//  M7ItemModel.h
//  M7AutoTracker_Example
//
//  Created by DevMan7 on 2018/12/14.
//  Copyright © 2018年 yusipeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface M7ItemModel : NSObject

@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSString *intro;

- (instancetype)initWithTitle:(NSString *)title
                        intro:(NSString *)intro;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end
