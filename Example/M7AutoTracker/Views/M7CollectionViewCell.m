//
//  M7CollectionViewCell.m
//  M7AutoTracker_Example
//
//  Created by DevMan7 on 2018/12/14.
//  Copyright © 2018年 yusipeng. All rights reserved.
//

#import "M7CollectionViewCell.h"
#import "UIView+M7Frame.h"

@interface M7CollectionViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *introLabel;

@end

@implementation M7CollectionViewCell

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    [self.contentView setBackgroundColor:[UIColor orangeColor]];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.introLabel];
}

- (void)setItemModel:(M7ItemModel *)itemModel {
    _itemModel = itemModel;
    //配置打点信息
    [self configInfoData:_itemModel];
    self.titleLabel.text = _itemModel.title;
    self.introLabel.text = _itemModel.intro;
}

#pragma mark - setters and getters

- (UILabel *)titleLabel {
    if (nil == _titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 100, 30)];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont boldSystemFontOfSize:14.f];
    }
    return _titleLabel;
}

- (UILabel *)introLabel {
    if (nil == _introLabel) {
        _introLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 100, 30)];
        _introLabel.textColor = [UIColor whiteColor];
        _introLabel.textAlignment = NSTextAlignmentCenter;
        _introLabel.font = [UIFont systemFontOfSize:12.f];
    }
    return _introLabel;
}

@end
