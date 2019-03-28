//
//  YAHView.m
//  YAHUIKit
//
//  Created by wangsw on 2019/3/28.
//  Copyright © 2019 yahua. All rights reserved.
//

#import "YAHView.h"

@implementation YAHView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
        [self setupConstraints];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupViews];
        [self setupConstraints];
    }
    return self;
}

#pragma mark - Private

- (void)setupViews {
    
    
}

- (void)setupConstraints {
    
    
}

@end
