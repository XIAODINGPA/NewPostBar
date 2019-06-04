//
//  PBPostListModel.h
//  PostBar
//
//  Created by cyf on 2019/6/4.
//  Copyright © 2019 cyf. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PBPostListModel : NSObject

/**
 用户头像
 */
@property (nonatomic, copy) NSString *url;
/**
 用户名
 */
@property (nonatomic, copy) NSString *username;
/**
 帖子标题
 */
@property (nonatomic, copy) NSString *title;

/**
 帖子内容
 */
@property (nonatomic, copy) NSString *content;

/**
 帖子发布时间
 */
@property (nonatomic, copy) NSString *releaseDate;

/**
 帖子评论数
 */
@property (nonatomic, copy) NSString *comments;

/**
 帖子收藏数
 */
@property (nonatomic, copy) NSString *favotites;

/**
 帖子发布的图片/视频
 */
@property (nonatomic, copy) NSArray *images;

/**
 是否显示图片
 */
@property (nonatomic, assign, getter=isShowImage) BOOL showImage;


@end

NS_ASSUME_NONNULL_END
