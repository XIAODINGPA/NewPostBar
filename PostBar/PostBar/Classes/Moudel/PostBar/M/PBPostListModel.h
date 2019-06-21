//
//  PBPostListModel.h
//  PostBar
//
//  Created by cyf on 2019/6/4.
//  Copyright © 2019 cyf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PBPostListModel : NSObject

/**
 用户id
 */
@property (nonatomic, copy) NSString * memberId;
/**
 用户头像
 */
@property (nonatomic, copy) NSString *memberIcon;
/**
 用户名
 */
@property (nonatomic, copy) NSString *memberName;
/**
 帖子标题
 */
@property (nonatomic, copy) NSString *title;

/**
 帖子内容
 */
@property (nonatomic, copy) NSString *body;

/**
 帖子发布时间
 */
@property (nonatomic, copy) NSString *createTime;

/**
 帖子评论数
 */
@property (nonatomic, copy) NSString *replyCount;

/**
 帖子收藏数
 */
@property (nonatomic, copy) NSString *favotites;

/**
 图片数据
 */
@property (nonatomic, copy) NSString *bodyImageUrls;
/**
 帖子发布的图片/视频
 */
@property (nonatomic, copy) NSArray *images;

/**
 是否显示图片
 */
@property (nonatomic, assign, getter=isShowImage) BOOL showImage;

/**
 九宫格高度
 */
@property (nonatomic, assign) CGFloat gridHeight;

/**
 cell高度
 */
@property (nonatomic, assign) CGFloat cellHeight;

/**
 发布文字高度
 */
@property (nonatomic, assign) CGFloat bodyHeight;
@end

NS_ASSUME_NONNULL_END

