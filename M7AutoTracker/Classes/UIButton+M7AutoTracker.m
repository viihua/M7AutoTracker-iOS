//
//  UIButton+M7AutoTracker.m
//  M7AutoTracker
//
//  Created by DevMan7 on 2018/12/18.
//

#import "UIButton+M7AutoTracker.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "M7AutoTrackerOperation.h"
#import "NSObject+M7AutoTracker.h"

@implementation UIButton (M7AutoTracker)

+ (void)startTracker {
    Method endTrackingMethod = class_getInstanceMethod(self, @selector(endTrackingWithTouch:withEvent:));
    Method ddEndTrackingMethod = class_getInstanceMethod(self, @selector(dd_endTrackingWithTouch:withEvent:));
    method_exchangeImplementations(endTrackingMethod, ddEndTrackingMethod);
}

- (void)dd_endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    //只监听UIButton
    if (![self isMemberOfClass:[UIButton class]]) {
        return;
    }
    
    [self dd_endTrackingWithTouch:touch withEvent:event];
    NSArray *targers = [self.allTargets allObjects];
    if (targers.count > 0) {
        NSArray *actions = [self actionsForTarget:[targers firstObject] forControlEvent:UIControlEventTouchUpInside];
        if (actions.count > 0 &&
            [[actions firstObject] length] > 0) {
            
            NSString *eventId = [NSString stringWithFormat:@"%@&&%@",NSStringFromClass([[targers firstObject] class]),[actions firstObject]];
            NSDictionary *infoDictionary = [[targers firstObject] ddInfoDictionary];
            [[M7AutoTrackerOperation sharedInstance] sendTrackerData:eventId
                                                                info:infoDictionary];
        }
    }
}

@end
