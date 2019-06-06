//
//  PBCollectionViewCell.m
//  PostBar
//
//  Created by cyf on 2019/6/5.
//  Copyright © 2019 cyf. All rights reserved.
//

#import "PBCollectionViewCell.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
@interface PBCollectionViewCell()
@property (nonatomic, strong,readwrite) UIImageView *imageView;
@end

@implementation PBCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self.contentView addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).insets(UIEdgeInsetsZero);
        }];
    }
    return self;
}

- (void)setUrl:(NSString *)url{
    _url = url;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:_url]];
}

- (UIImageView *)imageView{
    if(_imageView == nil){
        _imageView = [[UIImageView alloc]init];
        _imageView.backgroundColor = [UIColor whiteColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
    }
    return _imageView;
}
@end
