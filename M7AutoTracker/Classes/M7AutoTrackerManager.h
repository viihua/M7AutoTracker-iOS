//
//  M7AutoTrackerManager.h
//  M7AutoTracker
//
//  Created by DevMan7 on 2018/12/18.
//

#import <Foundation/Foundation.h>

static NSString *M7AutoTrackerEventIDKey = @"M7_TRACKER_EVENTID_KEY";
static NSString *M7AutoTrackerInfoKey = @"M7_TRACKER_INFO_KEY";

typedef void(^M7AutoTrackerManagerBlock)(NSDictionary *trackerDictionary);

@interface M7AutoTrackerManager : NSObject

/**
 是否开启调试模式
 */
@property (nonatomic, assign) BOOL isDebug;

/**
 配置数据
 */
@property (nonatomic, strong) NSArray *configArray;

@property (nonatomic, copy) M7AutoTrackerManagerBlock successBlock;
@property (nonatomic, copy) M7AutoTrackerManagerBlock debugBlock;

+ (M7AutoTrackerManager *)sharedInstance;

/**
 开始打点
 
 @param successBlock 成功回调
 @param debugBlock 调试模式回调
 */
- (void)startWithCompletionBlockWithSuccess:(M7AutoTrackerManagerBlock)successBlock debug:(M7AutoTrackerManagerBlock)debugBlock;

@end
