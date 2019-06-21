//
//  PBPostNewGridView.m
//  PostBar
//
//  Created by cyf on 2019/6/21.
//  Copyright © 2019 cyf. All rights reserved.
//

#import "PBPostNewGridView.h"
#import "UIImageView+WebCache.h"
#import "NSObject+CurrenDisplayViewController.h"
#import "PBBasePostListVC.h"

@interface PBPostNewGridView()

@end

@implementation PBPostNewGridView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addChildView];
        [self layoutChildView];
    }
    return self;
}

- (void)addChildView{
    
}

- (void)layoutChildView{
    
}

- (void)setImages:(NSArray *)images{
    _images = images;
    [self createIamgeViewWithImages:images];
}

- (void)createIamgeViewWithImages:(NSArray *)images{
    
    if(self.subviews.count > 0){
        for (UIView *view in self.subviews) {
            [view removeFromSuperview];
        }
    }
    
    for (int i = 0 ; i < images.count ; i ++ ) {
        CGFloat width = (UIScreen.mainScreen.bounds.size.width - 30)/3;
        NSString *url = images[i];
        CGFloat row = i / 3;
        CGFloat col = i % 3;
        UIImageView *imageView =  [[UIImageView alloc]init];
        imageView.frame = CGRectMake((5 + width) * col, (5 + width) * row, width, width);
        imageView.tag = i;
        imageView.userInteractionEnabled = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.layer.cornerRadius = 5;
        imageView.clipsToBounds = YES;
        imageView.layer.borderWidth = 1;
        imageView.layer.borderColor = [UIColor orangeColor].CGColor;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickImageView:)];
        [imageView addGestureRecognizer:tapGesture];
        if([url hasPrefix:@"http"]){
            [imageView sd_setImageWithURL:[NSURL URLWithString:url]];

        }
        [self addSubview:imageView];
    }
    
}


- (void)clickImageView:(UIGestureRecognizer *)ges{
    if(self.images.count == 0) return;
    
    UIImageView *imageView = (UIImageView *)ges.view;
    int index = (int)imageView.tag;
    NSString *url = self.images[index];
    NSLog(@"点击图片了 imageView = %@",imageView);
    NSDictionary *dic = @{@"url":url,@"index":@(index),@"images":self.images,@"imageView":imageView,@"imageViews":self.subviews};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NotificationNameDidTapGridImage" object:dic];
}

@end
