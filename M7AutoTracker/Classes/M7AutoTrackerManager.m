//
//  M7AutoTrackerManager.m
//  M7AutoTracker
//
//  Created by DevMan7 on 2018/12/18.
//

#import "M7AutoTrackerManager.h"
#import "UIButton+M7AutoTracker.h"
#import "UITableView+M7AutoTracker.h"
#import "UICollectionView+M7AutoTracker.h"
#import "UIView+M7AutoTracker.h"

@implementation M7AutoTrackerManager

+ (instancetype)sharedInstance {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

#pragma mark - public method
/**
 开始打点
 
 @param successBlock 成功回调
 @param debugBlock 调试模式回调
 */
- (void)startWithCompletionBlockWithSuccess:(M7AutoTrackerManagerBlock)successBlock debug:(M7AutoTrackerManagerBlock)debugBlock {
    static dispatch_once_t once;
    dispatch_once(&once, ^ {
        [UIButton startTracker];
        [UITableView startTracker];
        [UICollectionView startTracker];
        [UIView startTracker];
    });
    
    self.successBlock = successBlock;
    self.debugBlock = debugBlock;
}

@end
