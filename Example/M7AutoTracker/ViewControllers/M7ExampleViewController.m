//
//  M7ExampleViewController.m
//  M7AutoTracker_Example
//
//  Created by DevMan7 on 2018/12/14.
//  Copyright © 2018年 yusipeng. All rights reserved.
//

#import "M7ExampleViewController.h"
//Models
#import "M7ExampleModel.h"
//Controllers
#import "M7ButtonViewController.h"
#import "M7TableViewController.h"
#import "M7CollectionViewController.h"
#import "M7GestureViewController.h"

@interface M7ExampleViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<M7ExampleModel *> *data;

@end

@implementation M7ExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSStringFromClass([self class]);
    [self setupSubViews];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:nil
                                                                            action:nil];
}

- (void)setupSubViews {
    [self.view addSubview:self.tableView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *demoCellIdentifier = @"demoCellIdentifier";
    UITableViewCell *demoCell = [tableView dequeueReusableCellWithIdentifier:demoCellIdentifier];
    if (nil == demoCell) {
        demoCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:demoCellIdentifier];
        demoCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (self.data.count > indexPath.row) {
        M7ExampleModel *model = [self.data objectAtIndex:indexPath.row];
        demoCell.textLabel.text = model.name;
        //配置打点数据
        [demoCell configInfoData:model];
    }
    return demoCell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.data.count > indexPath.row) {
        M7ExampleModel *item = [self.data objectAtIndex:indexPath.row];
        if (item.controllerClass) {
            id obj = [[item.controllerClass alloc] init];
            if ([obj isKindOfClass:[UIViewController class]]) {
                UIViewController *viewController = (UIViewController *)obj;
                viewController.title = NSStringFromClass(item.controllerClass);
                viewController.view.backgroundColor = [UIColor whiteColor];
                [self.navigationController pushViewController:viewController animated:YES];
            }
        }
    }
}

#pragma mark - setters and getters

- (UITableView *)tableView {
    if (nil == _tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (NSArray<M7ExampleModel *> *)data {
    if (nil == _data) {
        _data = [[NSArray alloc] initWithObjects:
                 [[M7ExampleModel alloc] initWithName:@"UIButton Example"
                                      controllerClass:[M7ButtonViewController class]],
                 [[M7ExampleModel alloc] initWithName:@"UITableView Example"
                                      controllerClass:[M7TableViewController class]],
                 [[M7ExampleModel alloc] initWithName:@"UICollectionView Example"
                                      controllerClass:[M7CollectionViewController class]],
                 [[M7ExampleModel alloc] initWithName:@"Gesture Example"
                                      controllerClass:[M7GestureViewController class]],
                 nil];
    }
    return _data;
}

@end
