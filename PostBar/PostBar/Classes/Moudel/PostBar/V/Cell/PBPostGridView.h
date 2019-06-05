//
//  PBPostGridView.h
//  PostBar
//
//  Created by cyf on 2019/6/5.
//  Copyright © 2019 cyf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PBPostGridView : UIView

- (void)configData:(NSArray *)data;
- (void)updateGridViewHeight:(CGFloat)height;
@end

NS_ASSUME_NONNULL_END
