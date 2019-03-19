//
//  ViewController.m
//  YAHUIKit
//
//  Created by wangshiwen on 2018/11/28.
//  Copyright © 2018 yahua. All rights reserved.
//

#import "ViewController.h"
#import "YAHUIKit.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    YAHCircleProgressView *view = [[YAHCircleProgressView alloc] initWithFrame:CGRectMake(20, 50, 200, 200) startAngle:M_PI endAngle:2*M_PI bgColor:[UIColor grayColor] progressColor:[UIColor redColor] lineWidth:6];
    view.progress = 0.7;
    [self.view addSubview:view];
    
    YAHCircleGradientProgressView *g_view = [[YAHCircleGradientProgressView alloc] initWithFrame:CGRectMake(20, 300, 300, 300) startAngle:M_PI endAngle:2*M_PI bgColor:[UIColor grayColor] gradientStartColor:[UIColor redColor] gradientEndColor:[UIColor yellowColor] lineWidth:6];
    g_view.progress = 0.7;
    [self.view addSubview:g_view];
}


@end
