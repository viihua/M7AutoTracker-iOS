//
//  M7TableViewController.m
//  M7AutoTracker_Example
//
//  Created by DevMan7 on 2018/12/14.
//  Copyright © 2018年 yusipeng. All rights reserved.
//

#import "M7TableViewController.h"
#import "M7ItemModel.h"

@interface M7TableViewController ()

@property (nonatomic, strong) NSArray<M7ItemModel *> *data;

@end

@implementation M7TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *tableViewCellIdentifier = @"tableViewCellIdentifier";
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier];
    if (nil == tableViewCell) {
        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                               reuseIdentifier:tableViewCellIdentifier];
        tableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (self.data.count > indexPath.row) {
        M7ItemModel *model = [self.data objectAtIndex:indexPath.row];
        tableViewCell.textLabel.text = model.title;
        tableViewCell.detailTextLabel.text = model.intro;
        
        //配置打点数据
        [tableViewCell configInfoData:model];
    }
    return tableViewCell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - setters and getters

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
