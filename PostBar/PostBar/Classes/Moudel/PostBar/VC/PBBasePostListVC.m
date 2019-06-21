//
//  PBBaseListViewController.m
//  PostBar
//
//  Created by cyf on 2019/6/4.
//  Copyright © 2019 cyf. All rights reserved.
//

#import "PBBasePostListVC.h"
#import "PBPostListCell.h"
#import "YYPhotoGroupView.h"
#import "PPNetworkHelper.h"
#import "MJExtension.h"
#import "PBPostListModel.h"
#import "NSString+StringSizeFont.h"

@interface PBBasePostListVC ()
@property (nonatomic, strong) NSMutableArray *postDataSource;
@property (nonatomic, assign) NSUInteger pageIndex;

@end

@implementation PBBasePostListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableView];
    [self loadPostListData:YES];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didTapGridImage:) name:@"NotificationNameDidTapGridImage" object:nil];
}

- (void)didTapGridImage:(NSNotification *)notice{
    NSDictionary * dic  = (NSDictionary *)notice.object;
    NSString *url = dic[@"url"];
    NSString *index = dic[@"index"];
    NSDictionary *images = dic[@"images"];
    UIImageView *imageView = dic[@"imageView"];
    NSArray *imageViews = dic[@"imageViews"];
    NSLog(@"url = %@ \n index = %@ \n images = %@",url,index,images);
    NSMutableArray *items = [[NSMutableArray alloc]init];
    int i = 0;
    for (NSString *url in images) {
        YYPhotoGroupItem *item = [[YYPhotoGroupItem alloc]init];
        item.largeImageURL = [NSURL URLWithString:url];
        item.thumbView = imageViews[i];
        [items addObject:item];
        i ++;
    }
    
    YYPhotoGroupView *photoGroupView = [[YYPhotoGroupView alloc]initWithGroupItems:items.copy];
    [photoGroupView presentFromImageView:imageView  toContainer:self.navigationController.view  animated:YES completion:nil];
}

#pragma mark - Service 
- (void)loadPostListData:(BOOL)refresh{
    [PPNetworkHelper POST:@"https://appymclient.91catv.com:8443/fushionbaby-app/bbsTopic/findTopic"
               parameters:@{@"pageIndex":@(1),@"classId":self.classId} success:^(id responseObject) {
                   NSDictionary *response = (NSDictionary *)responseObject;
                   if([response[@"responseCode"] integerValue] != 0){
                       NSLog(@"error msg %@ ",response[@"msg"]);
                       return ;
                   }
                   
                   NSDictionary *data = response[@"data"];
                   NSArray *result = data[@"result"];
                   NSArray *dataSource = [PBPostListModel mj_objectArrayWithKeyValuesArray:result];
                   [self.postDataSource addObjectsFromArray:dataSource];
                   [self.postDataSource enumerateObjectsUsingBlock:^(PBPostListModel* obj, NSUInteger idx, BOOL * _Nonnull stop) {
                       //计算body文字高度 计算九宫格高度 计算cell 高度
                       NSString *bodyStr = obj.body;
                       CGFloat bodyHeight = 0.0;
                       CGFloat gridHeight = 0.0;
                       CGFloat cellHeight = 0.0;
                       if(bodyStr.length > 0){
                           bodyStr = [bodyStr stringByReplacingOccurrencesOfString:@" " withString:@""];
                           bodyHeight = [bodyStr stringSizeWithFont:[UIFont systemFontOfSize:15] Size:CGSizeMake(UIScreen.mainScreen.bounds.size.width - 20, MAXFLOAT)].height;
                           //[bodyStr boundingRectWithSize:CGSizeMake(UIScreen.mainScreen.bounds.size.width - 20, MAXFLOAT) options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]} context:nil].size.height + 1;
                       }
                       CGFloat itemWidth = ([UIScreen mainScreen].bounds.size.width - 20 - 10)/3;
                       if(obj.images.count > 0){
                           switch (obj.images.count-1) {
                               case 0:
                               case 1:
                               case 2:
                                   gridHeight = itemWidth;
                                   break;
                               case 3:
                               case 4:
                               case 5:
                                   gridHeight = itemWidth * 2 + 5;
                                   break;
                               case 6:
                               case 7:
                               case 8:
                                   gridHeight = itemWidth * 3 + 10;
                                   break;
                                   
                               default:
                                   break;
                           }
                       }
                       cellHeight = bodyHeight  + gridHeight + 44 + 12 + 8 + 16 + 5 + 5 + 44 ;
                       obj.gridHeight = gridHeight;
                       obj.bodyHeight = bodyHeight;
                       obj.cellHeight = cellHeight;

                   }];
                   [self.tableView reloadData];
                   
                  
               } failure:^(NSError *error) {
                   
               }];
}

static NSString *const reuseIdentifier = @"PBBasePostListCellReuseId";
- (void)setUpTableView
{
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.tableView registerClass:[PBPostListCell class] forCellReuseIdentifier:reuseIdentifier];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.postDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PBPostListCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if(self.postDataSource.count > 0){
        PBPostListModel *listModel = self.postDataSource[indexPath.row];
        [cell configData:listModel];
    }
   
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(self.postDataSource.count > 0){
        PBPostListModel *listModel = self.postDataSource[indexPath.row];
        return listModel.cellHeight;
    }
    return  44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
}

#pragma mark - 属性
- (NSMutableArray *)postDataSource{
    if(_postDataSource == nil){
        _postDataSource = [[NSMutableArray alloc]init];
    }
    return _postDataSource;
}


@end
