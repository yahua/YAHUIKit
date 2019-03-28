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

- (UIButton *)setupRightButtonWithTitle:(NSString *)title {
    
    UIFont *font = [UIFont systemFontOfSize:15];
    CGFloat widht = [title sizeWithFont:font constrainedToHeight:MAXFLOAT].width;
    if (widht<44) {
        widht = 44;
    }
    UIButton *tmpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tmpBtn.frame = CGRectMake(0, 0, widht, 44);
    tmpBtn.titleLabel.font = font;
    [tmpBtn setTitle:title forState:UIControlStateNormal];
    [tmpBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    tmpBtn.backgroundColor = [UIColor clearColor];
    [tmpBtn addTarget:self action:@selector(clickRightButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:tmpBtn];
    [self.navigationItem setRightBarButtonItem:barItem];
    
    return tmpBtn;
}

- (UIButton *)setupRightButtonWithImage:(UIImage *)image {
    
    UIButton *tmpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [tmpBtn setImage:image forState:UIControlStateNormal];
    tmpBtn.backgroundColor = [UIColor clearColor];
    [tmpBtn addTarget:self action:@selector(clickRightButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:tmpBtn];
    [self.navigationItem setRightBarButtonItem:barItem];
    
    return tmpBtn;
}

- (void)viewFirstWillAppear {}
- (void)viewFirstDidAppear {}
- (void)loadData {}
- (void)setupViews {}
- (void)setupConstraints {}
- (void)clickRightButton {}

@end
