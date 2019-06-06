//
//  PBHomeViewController.m
//  PostBar
//
//  Created by cyf on 2019/6/4.
//  Copyright © 2019 cyf. All rights reserved.
//

#import "PBHomePostVC.h"
#import "PBLoginVC.h"
#import "PBReleasePostInfoVC.h"
#import "PBBasePostListVC.h"
#import "Masonry.h"
@interface PBHomePostVC ()

/**
 底部悬浮按钮
 */
@property (nonatomic, strong) UIButton *bottomBtn;

@end

@implementation PBHomePostVC

- (instancetype)init{
    self = [super init];
    if(self){
        self.menuViewStyle = WMMenuViewStyleLine;
        self.progressColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.7];
        self.progressViewIsNaughty = 0.5;
        self.titleColorSelected = [UIColor blackColor];
        self.titleColorNormal = [UIColor colorWithWhite:53.f/255 alpha:1];
        self.titleSizeSelected = 20;
        self.titleSizeNormal = 17;
        self.progressWidth = 40;
        self.progressHeight = 4;
    }
    return self;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"互动吧";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStyleDone target:self action:@selector(loginAction)];
    self.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc]initWithTitle:@"下载" style:UIBarButtonItemStyleDone target:self action:@selector(postAction)];
    [self.view addSubview:self.bottomBtn];
    [self.view bringSubviewToFront:self.bottomBtn];
    [self.bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-20);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.safeAreaInsets.bottom).offset(-49);
        } else {
            // Fallback on earlier versions
            make.bottom.mas_equalTo(self.view.mas_bottom).offset(-49);

        }
        make.size.mas_equalTo(CGSizeMake(65, 65));
    }];
    // Do any additional setup after loading the view.
}

#pragma mark - Action
- (void)loginAction{
    
    PBLoginVC *loginVC = [[PBLoginVC alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:loginVC];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)postAction{
    PBReleasePostInfoVC *releasePostInfoVC = [[PBReleasePostInfoVC alloc]init];
    [self.navigationController pushViewController:releasePostInfoVC animated:YES];
}

#pragma mark - WMPageController
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return 4;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    switch (index) {
        case 0: return @"最新";
        case 1: return @"热贴";
        case 2: return @"图说";
        case 3: return @"秀吧";

    }
    return @"NONE";
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    //8 6 7 5
    PBBasePostListVC *postListVC = [[PBBasePostListVC alloc] init];
    switch (index) {
        case 0:
            postListVC.classId = @"8";
            break;
        case 1:
            postListVC.classId = @"6";
            break;
        case 2:
            postListVC.classId = @"7";
            break;
        case 3:
            postListVC.classId = @"5";
            break;
        default:
            break;
    }
    return postListVC;
}

- (CGFloat)menuView:(WMMenuView *)menu widthForItemAtIndex:(NSInteger)index {
    CGFloat width = [super menuView:menu widthForItemAtIndex:index];
    return width + 20;
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
//    if (self.menuViewPosition == WMMenuViewPositionBottom) {
//        menuView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
//        return CGRectMake(0, self.view.frame.size.height - 44, self.view.frame.size.width, 44);
//    }
    CGFloat leftMargin = self.showOnNavigationBar ? 50 : 0;
    CGFloat originY = self.showOnNavigationBar ? 0 : CGRectGetMaxY(self.navigationController.navigationBar.frame);
    return CGRectMake(leftMargin, originY, self.view.frame.size.width - 2*leftMargin, 44);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
//    if (self.menuViewPosition == WMMenuViewPositionBottom) {
//        return CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64 - 44);
//    }
    CGFloat originY = CGRectGetMaxY([self pageController:pageController preferredFrameForMenuView:self.menuView]);
  
    return CGRectMake(0, originY, self.view.frame.size.width, self.view.frame.size.height - originY);
}


- (UIButton *)bottomBtn{
    if(_bottomBtn == nil){
        _bottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _bottomBtn.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.7];
        [_bottomBtn setTitle:@"Go" forState:UIControlStateNormal];
        [_bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _bottomBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        _bottomBtn.layer.cornerRadius = 65.f/2;
        
    }
    return _bottomBtn;
}


@end
