//
//  PBPostListCell.m
//  PostBar
//
//  Created by cyf on 2019/6/4.
//  Copyright © 2019 cyf. All rights reserved.
//

#import "PBPostListCell.h"
#import "PBPostNewGridView.h"

#import "PBPostListModel.h"

#import "Masonry.h"
#import "UIImageView+WebCache.h"
#import "NSString+timeStampDateFormat.h"

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
/**
 图片布局
 */
@property (nonatomic, strong) PBPostNewGridView *gridContentView;


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
    [self.contentView addSubview:self.postContentLabel];
    [self.contentView addSubview:self.gridContentView];
    [self.contentView addSubview:self.releaseDateLabel];
    [self.contentView addSubview:self.commentBtn];
    [self.contentView addSubview:self.reportBtn];
    [self.contentView addSubview:self.sepLineView];
}

- (void)layoutChildView{
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(12);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
    
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headerImageView.mas_right).offset(8);
        make.top.equalTo(self.headerImageView.mas_top).offset(3);
        
    }];
    
    [self.releaseDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.headerImageView.mas_bottom).offset(-3);
        make.left.equalTo(self.headerImageView.mas_right).offset(8);
    }];

    [self.postContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.top.equalTo(self.self.headerImageView.mas_bottom).offset(10);
    }];
    
    //默认高度为0
    [self.gridContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.top.equalTo(self.postContentLabel.mas_bottom).offset(5);
        make.height.mas_equalTo(0);

    }];


    [self.commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        make.left.equalTo(self.contentView);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(UIScreen.mainScreen.bounds.size.width/2);
    }];

    [self.reportBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        make.right.equalTo(self.contentView);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(UIScreen.mainScreen.bounds.size.width/2);
    }];
    
    [self.sepLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView);
        make.width.equalTo(self.contentView);
        make.height.mas_equalTo(1);
        
    }];
   
}



- (void)configData:(id )data{
    
    PBPostListModel *listModel = (PBPostListModel *)data;
    
    [_headerImageView sd_setImageWithURL:[NSURL URLWithString: listModel.memberIcon] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        NSLog(@"image *** %@",image);
    }];
    
    _userNameLabel.text = listModel.memberName;
    
    _releaseDateLabel.text = [NSString stringWithFormat:@"发布于%@",[listModel.createTime timeStapDateFormat:@"yyyy-MM-dd"]];
    
    [_commentBtn setTitle:[NSString stringWithFormat:@"评论 %@",listModel.replyCount] forState:UIControlStateNormal];

    NSString * str = [NSString stringWithFormat:@"#%@#%@",listModel.title,listModel.body];
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc]initWithString:str];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, listModel.title.length + 2)];
    _postContentLabel.attributedText = attributedString;
    //更新高度
    CGFloat gridHeight = listModel.gridHeight;
    _gridContentView.images = listModel.images;
    [_gridContentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.top.equalTo(self.postContentLabel.mas_bottom).offset(5);
        make.height.mas_equalTo(gridHeight);
    }];


    

}

#pragma mark - 属性
- (UIImageView *)headerImageView{
    if(_headerImageView == nil){
        _headerImageView = [[UIImageView alloc]init];
        _headerImageView.layer.cornerRadius = 5.f;
        _headerImageView.clipsToBounds = YES;
        _headerImageView.backgroundColor = [UIColor colorWithWhite:242.f/255 alpha:1];
    }
    return _headerImageView;
}

- (UILabel *)userNameLabel{
    if(_userNameLabel == nil){
        _userNameLabel = [[UILabel alloc]init];
        _userNameLabel.text = @"平安和谐";
        _userNameLabel.font = [UIFont systemFontOfSize:17];
        _userNameLabel.textColor = [UIColor blackColor];
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
        _postContentLabel.numberOfLines = 4;
        _postContentLabel.font = [UIFont systemFontOfSize:15];
        _postContentLabel.textColor = [UIColor blackColor];
    }
    return _postContentLabel;
}

- (PBPostNewGridView *)gridContentView{
    if(_gridContentView == nil){
        _gridContentView = [[PBPostNewGridView alloc]initWithFrame:CGRectZero];
//        _gridContentView.backgroundColor = [UIColor colorWithWhite:242.f/255 alpha:1];
    }
    return _gridContentView;
}

- (UILabel *)releaseDateLabel{
    if(_releaseDateLabel == nil){
        _releaseDateLabel = [[UILabel alloc]init];
        _releaseDateLabel.text = @"2019-04-08";
        _releaseDateLabel.font = [UIFont systemFontOfSize:13];
        _releaseDateLabel.textColor = [UIColor colorWithWhite:153.f/255 alpha:1];
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
