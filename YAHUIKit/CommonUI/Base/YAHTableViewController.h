//
//  YAHTableViewController.h
//  YAHUIKit
//
//  Created by wangsw on 2019/3/28.
//  Copyright © 2019 yahua. All rights reserved.
//

#import "YAHViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface YAHTableViewController : YAHViewController <
UITableViewDelegate,
UITableViewDataSource>

//默认与view frame一致，  子类可重写
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) UITableViewStyle style; //默认 plain
@property (nonatomic, strong) Class cellClass;
@property (nonatomic, assign) BOOL isCellXib;  //cell是否是xib创建的   默认NO
@property (nonatomic, assign) CGFloat cellHeight;

//数据
@property (nonatomic, strong) NSArray *dataList;

//子类如果有需要对list做过滤处理，可重写改方法
- (NSArray *)handleDataList:(NSArray *)list;

@end

NS_ASSUME_NONNULL_END
