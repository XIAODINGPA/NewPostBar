//
//  PBPostGridView.m
//  PostBar
//
//  Created by cyf on 2019/6/5.
//  Copyright © 2019 cyf. All rights reserved.
//

#import "PBPostGridView.h"
#import "PBCollectionViewCell.h"
#import "YYPhotoGroupView.h"
#import "PBPostGridView.h"
#import "YYPhotoGroupView.h"
#import "NSObject+CurrenDisplayViewController.h"
#import "RTRootNavigationController.h"
@interface PBPostGridView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
//图片最多显示3张 视频只显示一张
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, copy) NSArray *images;
@end

@implementation PBPostGridView

- (instancetype)initWithFrame:(CGRect)frame{
    CGRect newFrame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width - 20, (UIScreen.mainScreen.bounds.size.width - 20 - 10) / 3);
    self = [super initWithFrame:newFrame];
    if(self){
    
        [self addSubview:self.collectionView];
    }
    return self;
}

- (void)configData:(NSArray *)data{
    _images = [data mutableCopy];
    [self.collectionView reloadData];
}

- (void)updateGridViewHeight:(CGFloat)height{
    self.collectionView.frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width - 20, height);
}

static NSString *const reuserId = @"PBPostCollectionID";
- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 5;
        layout.minimumInteritemSpacing = 5;
        
        CGFloat itemWidth = (self.bounds.size.width - 10)/3;
        layout.itemSize = CGSizeMake(itemWidth, itemWidth);
        // l
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollEnabled = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[PBCollectionViewCell class] forCellWithReuseIdentifier:reuserId];
    }
    return _collectionView;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PBCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuserId forIndexPath:indexPath];
    cell.url = self.images[indexPath.row];
    return  cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    RTContainerController *vc = (RTContainerController *)[NSObject currentViewController];
    PBCollectionViewCell *collectionCell = (PBCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];

    [vc.contentViewController performSelectorOnMainThread:@selector(didSelectImageAtIndex:) withObject:@{@"index":@(indexPath.row),@"images":self.images,@"imageView":collectionCell.imageView,@"subView":collectionCell.contentView.subviews} waitUntilDone:YES];
//    UIView *fromView = nil;
//
//    NSMutableArray *items = [NSMutableArray new];
//    UIImageView *imgView = collectionCell.imageView;
//    [self.images enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        YYPhotoGroupItem *item = [YYPhotoGroupItem new];
//        item.thumbView = imgView;
//        item.largeImageURL = [NSURL URLWithString:obj];
//        item.largeImageSize = CGSizeMake(UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.width);
//        [items addObject:item];
//    }];
//
//
//    YYPhotoGroupView *v = [[YYPhotoGroupView alloc] initWithGroupItems:items];
//    UIViewController *vc = [NSObject currentViewController];
//    [v presentFromImageView:fromView toContainer:vc.navigationController.view animated:YES completion:nil];
}

@end
