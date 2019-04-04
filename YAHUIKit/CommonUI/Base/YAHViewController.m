//
//  YAHViewController.m
//  YAHUIKit
//
//  Created by wangshiwen on 2018/12/2.
//  Copyright © 2018 yahua. All rights reserved.
//

#import "YAHViewController.h"
#import <YAHBaseKit/YAHBaseKit.h>

@interface YAHViewController ()

@property (nonatomic, assign) BOOL bDidAppear;
@property (nonatomic, assign) BOOL bWillAppear;

@end

@implementation YAHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
    [self setupViews];
    [self setupConstraints];
}

- (void)viewWillAppear:(BOOL)animated {
    
    if (!_bWillAppear) {
        _bWillAppear = YES;
        [self viewFirstWillAppear];
    }
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    
    if (!_bDidAppear) {
        _bDidAppear = YES;
        [self viewFirstDidAppear];
    }
    [super viewDidAppear:animated];
}

#pragma mark - Public

- (void)viewFirstWillAppear {}
- (void)viewFirstDidAppear {}
- (void)loadData {}
- (void)setupViews {}
- (void)setupConstraints {}

@end
