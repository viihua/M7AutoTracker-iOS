//
//  M7ButtonViewController.m
//  M7AutoTracker_Example
//
//  Created by DevMan7 on 2018/12/14.
//  Copyright © 2018年 yusipeng. All rights reserved.
//

#import "M7ButtonViewController.h"
#import "UIView+M7Frame.h"

@interface M7ButtonViewController ()

@property (nonatomic, strong) UIButton *trackerButton;

@end

@implementation M7ButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupSubViews];
    
    //配置打点info信息
    self.ddInfoDictionary = @{@"id":@"your id",
                              @"type":@"your type"};
}

- (void)setupSubViews {
    [self.view addSubview:self.trackerButton];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.trackerButton.dd_width = 180.f;
    self.trackerButton.dd_height = 44.f;
    self.trackerButton.center = self.view.center;
}

#pragma mark - button action

- (void)trackerButtonClick:(UIButton *)sender {
    
}

#pragma mark - setters and getters

- (UIButton *)trackerButton {
    if (nil == _trackerButton) {
        _trackerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_trackerButton setTitle:@"click me" forState:UIControlStateNormal];
        [_trackerButton setBackgroundColor:[UIColor orangeColor]];
        [_trackerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_trackerButton addTarget:self
                           action:@selector(trackerButtonClick:)
                 forControlEvents:UIControlEventTouchUpInside];
    }
    return _trackerButton;
}


@end
