//
//  M7AutoTrackerOperation.m
//  M7AutoTracker
//
//  Created by DevMan7 on 2018/12/18.
//

#import "M7AutoTrackerOperation.h"
#import "M7AutoTrackerManager.h"
#import "NSObject+M7AutoTracker.h"

@implementation M7AutoTrackerOperation

+ (instancetype)sharedInstance {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

/**
 发送日志
 
 @param eventId 日志id
 @param info 日志内容
 */
- (void)sendTrackerData:(NSString *)eventId info:(NSDictionary *)info {
    NSDictionary *trackerDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                       eventId.length > 0 ? eventId : @"", M7AutoTrackerEventIDKey,
                                       info ? info : [[NSDictionary alloc] init], M7AutoTrackerInfoKey, nil];
    
    if ([M7AutoTrackerManager sharedInstance].configArray.count > 0 &&
        eventId.length > 0) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(M7_TRACKER_EVENTID_KEY == %@)",eventId];
        NSArray *filtered = [[M7AutoTrackerManager sharedInstance].configArray filteredArrayUsingPredicate:predicate];
        if ([filtered count] > 0) {
            if ([M7AutoTrackerManager sharedInstance].successBlock) {
                [M7AutoTrackerManager sharedInstance].successBlock(trackerDictionary);
            }
        }
    }
    
    if ([M7AutoTrackerManager sharedInstance].isDebug &&
        [M7AutoTrackerManager sharedInstance].debugBlock) {
        [M7AutoTrackerManager sharedInstance].debugBlock(trackerDictionary);
    }
}

@end

