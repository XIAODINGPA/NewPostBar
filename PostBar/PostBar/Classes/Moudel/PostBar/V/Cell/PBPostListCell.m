//
//  PBPostListCell.m
//  PostBar
//
//  Created by cyf on 2019/6/4.
//  Copyright © 2019 cyf. All rights reserved.
//

#import "PBPostListCell.h"
#import "Masonry.h"
@interface PBPostListCell()

/**
 用户头像
 */
@property (nonatomic, strong) UIImageView *headerImageView;

/**
 用户名
 */
@property (nonatomic, strong) UILabel *userNameLabel;

/**
 帖子标题
 */
@property (nonatomic, strong) UILabel *postTitleLabel;

/**
 帖子内容
 */
@property (nonatomic, strong) UILabel *postContentLabel;

/**
 帖子发布时间
 */
@property (nonatomic, strong) UILabel *releaseDateLabel;

/**
 图片最大显示3张 视频只显示一个 发布的时候只能发布一个视频
 */
@property (nonatomic, strong) UIView *gridView;

/**
 评论按钮 需要显示评论数
 */
@property (nonatomic, strong) UIButton *commentBtn;

/**
 帖子举报按钮
 */
@property (nonatomic, strong) UIButton *reportBtn;

/**
 分割线
 */
@property (nonatomic, strong) UIView *sepLineView;


@end

@implementation PBPostListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addChildView];
        [self layoutChildView];
    }
    return self;
}

- (void)addChildView{
    [self.contentView addSubview:self.headerImageView];
    [self.contentView addSubview:self.userNameLabel];
    [self.contentView addSubview:self.postTitleLabel];
    [self.contentView addSubview:self.postContentLabel];
    [self.contentView addSubview:self.gridView];
    [self.contentView addSubview:self.releaseDateLabel];
    [self.contentView addSubview:self.commentBtn];
    [self.contentView addSubview:self.reportBtn];
    [self.contentView addSubview:self.sepLineView];
}

- (void)layoutChildView{
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(12);
        make.size.mas_equalTo(CGSizeMake(55, 55));
    }];
    
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headerImageView.mas_right).offset(8);
        make.centerY.equalTo(self.headerImageView.mas_centerY);
        
    }];

    [self.postTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.top.equalTo(self.headerImageView.mas_bottom).offset(8);
    }];

    [self.postContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.top.equalTo(self.postTitleLabel.mas_bottom).offset(5);
    }];

    CGFloat gridWidth = (UIScreen.mainScreen.bounds.size.width - 4 * 10)/3;
    [self.gridView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.top.equalTo(self.postContentLabel.mas_bottom).offset(5);
        make.height.mas_equalTo(gridWidth);

    }];

    [self.releaseDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.gridView.mas_bottom).offset(15);
        make.left.equalTo(self.contentView).offset(10);

    }];

    [self.commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        make.left.equalTo(self.contentView);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(UIScreen.mainScreen.bounds.size.width/2);
        make.top.equalTo(self.releaseDateLabel.mas_bottom).offset(8);
    }];

    [self.reportBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        make.right.equalTo(self.contentView);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(UIScreen.mainScreen.bounds.size.width/2);
        make.top.equalTo(self.releaseDateLabel.mas_bottom).offset(8);

    }];
    
    [self.sepLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView);
        make.width.equalTo(self.contentView);
        make.height.mas_equalTo(1);
        
    }];
}

- (void)configData:(id )data{
    
}

- (UIImageView *)headerImageView{
    if(_headerImageView == nil){
        _headerImageView = [[UIImageView alloc]init];
        _headerImageView.layer.cornerRadius = 5.f;
        _headerImageView.backgroundColor = [UIColor colorWithWhite:242.f/255 alpha:1];
    }
    return _headerImageView;
}

- (UILabel *)userNameLabel{
    if(_userNameLabel == nil){
        _userNameLabel = [[UILabel alloc]init];
        _userNameLabel.text = @"平安和谐";
        _userNameLabel.font = [UIFont systemFontOfSize:17];
        _userNameLabel.textColor = [UIColor colorWithRed:60.f/255 green:115.f/255    blue:242.f/255 alpha:1];
    }
    return _userNameLabel;
}

- (UILabel *)postTitleLabel{
    if(_postTitleLabel == nil){
        _postTitleLabel = [[UILabel alloc]init];
        _postTitleLabel.text = @"卖菜";
        _postTitleLabel.font = [UIFont systemFontOfSize:16];
        _postTitleLabel.textColor = [UIColor blackColor];
    }
    return _postTitleLabel;
}

- (UILabel *)postContentLabel{
    if(_postContentLabel == nil){
        _postContentLabel = [[UILabel alloc]init];
        _postContentLabel.text = @"这个菜真好";
        _postContentLabel.font = [UIFont systemFontOfSize:15];
        _postContentLabel.textColor = [UIColor colorWithWhite:53.f/255 alpha:1];
    }
    return _postContentLabel;
}

- (UIView *)gridView{
    if(_gridView == nil){
        _gridView = [[UIView alloc]init];
        _gridView.backgroundColor = [UIColor colorWithWhite:242.f/255 alpha:1];
    }
    return _gridView;
}

- (UILabel *)releaseDateLabel{
    if(_releaseDateLabel == nil){
        _releaseDateLabel = [[UILabel alloc]init];
        _releaseDateLabel.text = @"2019-04-08";
        _releaseDateLabel.font = [UIFont systemFontOfSize:14];
        _releaseDateLabel.textColor = [UIColor colorWithWhite:53.f/255 alpha:1];
    }
    return _releaseDateLabel;
}

- (UIButton *)commentBtn{
    if(_commentBtn == nil){
        _commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_commentBtn setTitle:@"评论" forState:UIControlStateNormal];
        _commentBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_commentBtn setTitleColor:[UIColor colorWithWhite:153.f/255 alpha:1] forState:UIControlStateNormal];
    }
    return _commentBtn;
}

- (UIButton *)reportBtn{
    if(_reportBtn == nil){
        _reportBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_reportBtn setTitle:@"举报" forState:UIControlStateNormal];
        _reportBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_reportBtn setTitleColor:[UIColor colorWithWhite:153.f/255 alpha:1] forState:UIControlStateNormal];
    }
    return _reportBtn;
}

- (UIView *)sepLineView{
    if(_sepLineView == nil){
        _sepLineView = [[UIView alloc]init];
        _sepLineView.backgroundColor = [UIColor colorWithWhite:242.f/255 alpha:1];
        
    }
    return _sepLineView;
}
@end
