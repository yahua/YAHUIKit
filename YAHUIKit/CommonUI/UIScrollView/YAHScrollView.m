//
//  YAHScrollView.m
//  YAHUIKit
//
//  Created by yahua on 2019/8/2.
//  Copyright © 2019 yahua. All rights reserved.
//

#import "YAHScrollView.h"

@implementation YAHScrollView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    if(gestureRecognizer.state != 0) {
        return YES;
    }else {
        return NO;
    }
}

@end
