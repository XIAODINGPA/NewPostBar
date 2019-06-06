//
//  PBPostListCell.h
//  PostBar
//
//  Created by cyf on 2019/6/4.
//  Copyright © 2019 cyf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class PBPostGridView;
@interface PBPostListCell : UITableViewCell
/**
 图片最大显示3张 视频只显示一个 发布的时候只能发布一个视频
 */
@property (nonatomic, strong) PBPostGridView *gridView;

- (void)configData:(id )data;
@end

NS_ASSUME_NONNULL_END
