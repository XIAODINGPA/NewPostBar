//
//  UIView+ParentController.m
//  SandLife
//
//  Created by cyf on 2019/5/28.
//  Copyright © 2019 Sand. All rights reserved.
//

#import "UIView+ParentController.h"

@implementation UIView (ParentController)

- (UIViewController *)parentController
{
    UIResponder *responder = [self nextResponder];
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = [responder nextResponder];
    }
    return nil;
}
@end
