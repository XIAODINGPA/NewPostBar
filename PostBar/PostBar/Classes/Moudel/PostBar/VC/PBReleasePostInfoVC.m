//
//  PBPostInfoViewController.m
//  PostBar
//
//  Created by cyf on 2019/6/4.
//  Copyright © 2019 cyf. All rights reserved.
//

#import "PBReleasePostInfoVC.h"

@interface PBReleasePostInfoVC ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
/*
 1.选择发帖类型
 2.发帖标题，发帖内容
 3.表情键盘
 4.图片浏览器+相册
 5.视频录制
 */
@end

@implementation PBReleasePostInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"发帖";
    
    // Do any additional setup after loading the view.
}


- (UIScrollView *)scrollView{
    if(_scrollView == nil){
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
        _scrollView.backgroundColor = [UIColor colorWithWhite:240.f/255 alpha:1];
        _scrollView.delegate = self;
    }
    return _scrollView;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
