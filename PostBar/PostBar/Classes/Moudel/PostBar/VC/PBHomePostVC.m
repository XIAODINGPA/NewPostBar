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
@interface PBHomePostVC ()

@end

@implementation PBHomePostVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"互动";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"登录" style:UIBarButtonItemStyleDone target:self action:@selector(loginAction)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"发帖" style:UIBarButtonItemStyleDone target:self action:@selector(postAction)];

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
    switch (index % 3) {
        case 0: return @"最新";
        case 1: return @"热贴";
        case 2: return @"图说";
        case 3: return @"秀吧";

    }
    return @"NONE";
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
   
    return [[PBBasePostListVC alloc] init];
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


@end
