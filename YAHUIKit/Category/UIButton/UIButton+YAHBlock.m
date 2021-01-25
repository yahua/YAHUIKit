//
//  UIButton+Block.m
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIButton+YAHBlock.h"
#import <objc/runtime.h>
static const void *UIButtonBlockKey = &UIButtonBlockKey;
static const void *UIButtonAWhileBlockKey = &UIButtonAWhileBlockKey;

@implementation UIButton (YAHBlock)
-(void)addActionHandler:(YAHTouchedBlock)touchHandler{
    objc_setAssociatedObject(self, UIButtonBlockKey, touchHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(actionTouched:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addActionAndDisableAWhileHandler:(YAHTouchedBlock)touchHandler {
    
    objc_setAssociatedObject(self, UIButtonAWhileBlockKey, touchHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(actionAwhileTouched:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)actionTouched:(UIButton *)btn{
    YAHTouchedBlock block = objc_getAssociatedObject(self, UIButtonBlockKey);
    if (block) {
        block(btn.tag);
    }
}

- (void)actionAwhileTouched:(UIButton *)btn{
    
    YAHTouchedBlock block = objc_getAssociatedObject(self, UIButtonAWhileBlockKey);
    if (block) {
        block(btn.tag);
    }
    self.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.userInteractionEnabled = YES;
    });
}

@end

