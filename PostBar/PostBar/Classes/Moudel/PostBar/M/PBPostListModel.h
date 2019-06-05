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
/**
 bbstype = 0;
 body = "\U6652\U4e00\U4e0b\U6211\U7684\U82b1";
 bodyImageUrls = "http://mov.91catv.com/img/userfiles//images//bbs/topic//1559454458971.jpg,http://mov.91catv.com/img/userfiles//images//bbs/topic//1559454458980.jpg,http://mov.91catv.com/img/userfiles//images//bbs/topic//1559454458983.jpg";
 classId = 7;
 className = "\U56fe\U8bf4";
 createTime = 1559454372000;
 imageUrl = "http://mov.91catv.com/img/userfiles//images//bbs/topic//1559454458971.jpg,http://mov.91catv.com/img/userfiles//images//bbs/topic//1559454458980.jpg,http://mov.91catv.com/img/userfiles//images//bbs/topic//1559454458983.jpg";
 memberIcon = "http://mov.91catv.com/img/userfiles//images//member/image/null";
 memberId = 1437;
 memberName = "139****1214";
 replyCount = 0;
 replyDtos =                 (
 );
 shareUrl = "https://appymclient.91catv.com:8088//aladingshop-wap//bbs/bbsShare?topicId=39333";
 title = "\U9c9c\U82b1";
 topTime = "";
 topicId = 39333;
 updateTime = 1559461288000;
 videoUrl = "";
 },
 
 **/
