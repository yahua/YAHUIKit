//
//  YAHTableViewController.m
//  YAHUIKit
//
//  Created by wangsw on 2019/3/28.
//  Copyright © 2019 yahua. All rights reserved.
//

#import "YAHTableViewController.h"
#import "YAHTableViewCell.h"

@interface YAHTableViewController ()

@end

@implementation YAHTableViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _isCellXib = NO;
        _style = UITableViewStylePlain;
    }
    return self;
}

- (void)viewDidLayoutSubviews {
    
    
}

#pragma mark - Private

- (void)setupViews {
    
    [super setupViews];
    [self.view addSubview:self.tableView];
}

- (void)setupConstraints {
    
    [super setupConstraints];
    self.tableView.frame = self.view.bounds;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

//子类如果有需要对list做过滤处理，可重写改方法
- (NSArray *)handleDataList:(NSArray *)list {
    
    return list;
}

#pragma mark - Detegate

// row数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.1f;
}

// cell设置
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YAHTableViewCell *cell = (YAHTableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.cellClass)];
    if ([cell isKindOfClass:YAHTableViewCell.class]) {
        if (indexPath.row<self.dataList.count) {
            id info = self.dataList[indexPath.row];
            [cell refreshUIWithInfo:info];
        }
    }else {
        NSLog(@"不是YAHTableViewCell的子类 cell无法刷新");
    }
    
    return cell;
}

#pragma mark - Getter Setter

- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:self.style];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        if (_isCellXib && self.cellClass) {
            [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass(self.cellClass) bundle:nil] forCellReuseIdentifier:NSStringFromClass(self.cellClass)];
        }else if (self.cellClass) {
            [_tableView registerClass:self.cellClass forCellReuseIdentifier:NSStringFromClass(self.cellClass)];
        }else {
            [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass(UITableViewCell.class)];
        }
    }
    
    return _tableView;
}

- (void)setDataList:(NSArray *)dataList {
    
    _dataList = [self handleDataList:dataList];
    
    [self.tableView reloadData];
}


@end
