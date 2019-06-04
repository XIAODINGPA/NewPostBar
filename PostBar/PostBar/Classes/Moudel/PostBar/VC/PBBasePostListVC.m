//
//  PBBaseListViewController.m
//  PostBar
//
//  Created by cyf on 2019/6/4.
//  Copyright © 2019 cyf. All rights reserved.
//

#import "PBBasePostListVC.h"
#import "PBPostListCell.h"

@interface PBBasePostListVC ()
@property (nonatomic, strong) NSMutableArray *postDataSource;
@end

@implementation PBBasePostListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableView];
    // Do any additional setup after loading the view.
}

- (NSMutableArray *)postDataSource{
    if(_postDataSource == nil){
        _postDataSource = [[NSMutableArray alloc]init];
    }
    return _postDataSource;
}

static NSString *const reuseIdentifier = @"PBBasePostListCellReuseId";
- (void)setUpTableView{
    
    [self.tableView registerClass:[PBPostListCell class] forCellReuseIdentifier:reuseIdentifier];
    self.tableView.estimatedRowHeight = 200;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PBPostListCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewAutomaticDimension ;
}

@end
