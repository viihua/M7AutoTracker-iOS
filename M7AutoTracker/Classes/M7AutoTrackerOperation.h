//
//  M7AutoTrackerOperation.h
//  M7AutoTracker
//
//  Created by DevMan7 on 2018/12/18.
//

#import <Foundation/Foundation.h>

@interface M7AutoTrackerOperation : NSObject

+ (M7AutoTrackerOperation *)sharedInstance;

/**
 发送日志
 
 @param eventId 事件id
 @param info 日志内容
 */
- (void)sendTrackerData:(NSString *)eventId info:(NSDictionary *)info;

@end
