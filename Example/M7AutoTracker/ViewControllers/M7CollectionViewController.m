//
//  M7CollectionViewController.m
//  M7AutoTracker_Example
//
//  Created by DevMan7 on 2018/12/14.
//  Copyright © 2018年 yusipeng. All rights reserved.
//

#import "M7CollectionViewController.h"
#import "M7ItemModel.h"
#import "M7CollectionViewCell.h"

static NSString *kM7CollectionViewCellIdentify = @"kM7CollectionViewCellIdentify";

@interface M7CollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray<M7ItemModel *> *data;

@end

@implementation M7CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupSubviews];
}

- (void)setupSubviews {
    [self.view addSubview:self.collectionView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

#pragma mark - UICollectionViewDataSource
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, 100);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    M7CollectionViewCell *collectionViewCell = (M7CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kM7CollectionViewCellIdentify forIndexPath:indexPath];
    if (self.data.count > indexPath.row) {
        M7ItemModel *model = [self.data objectAtIndex:indexPath.row];
        collectionViewCell.itemModel = model;
    }
    return collectionViewCell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - setters and getters

- (UICollectionView *)collectionView {
    if (nil == _collectionView) {
//        UICollectionViewFlowLayout *viewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
//        [viewFlowLayout setItemSize:CGSizeMake(100, 100)];
//        [viewFlowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                             collectionViewLayout:[UICollectionViewFlowLayout new]];
        [_collectionView setBackgroundColor:[UIColor whiteColor]];
        [_collectionView registerClass:[M7CollectionViewCell class] forCellWithReuseIdentifier:kM7CollectionViewCellIdentify];
        
        [_collectionView setDelegate:self];
        [_collectionView setDataSource:self];
    }
    return _collectionView;
}

- (NSArray<M7ItemModel *> *)data {
    if (nil == _data) {
        _data = @[[[M7ItemModel alloc] initWithTitle:@"title a" intro:@"intro a"],
                  [[M7ItemModel alloc] initWithTitle:@"title b" intro:@"intro b"],
                  [[M7ItemModel alloc] initWithTitle:@"title c" intro:@"intro c"],
                  [[M7ItemModel alloc] initWithTitle:@"title d" intro:@"intro d"],
                  [[M7ItemModel alloc] initWithTitle:@"title e" intro:@"intro e"],];
    }
    return _data;
}

@end
