//
//  YAHTableViewCell.h
//  YAHUIKit
//
//  Created by wangsw on 2019/3/28.
//  Copyright © 2019 yahua. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YAHTableViewCell : UITableViewCell

- (void)refreshUIWithInfo:(id)info;

- (void)setupViews;

- (void)setupConstraints;

@end

NS_ASSUME_NONNULL_END
