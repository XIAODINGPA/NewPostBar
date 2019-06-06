//
//  PBCollectionViewCell.h
//  PostBar
//
//  Created by cyf on 2019/6/5.
//  Copyright © 2019 cyf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PBCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong,readonly) UIImageView *imageView;
@property (nonatomic, strong) NSString * url;
@end

NS_ASSUME_NONNULL_END
