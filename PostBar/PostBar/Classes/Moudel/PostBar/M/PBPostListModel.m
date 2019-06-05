//
//  PBPostListModel.m
//  PostBar
//
//  Created by cyf on 2019/6/4.
//  Copyright © 2019 cyf. All rights reserved.
//

#import "PBPostListModel.h"
#import <UIKit/UIKit.h>

@implementation PBPostListModel

- (NSArray *)images{
    if(_bodyImageUrls.length > 0 && [_bodyImageUrls containsString:@","]){
        NSArray *result = [_bodyImageUrls componentsSeparatedByString:@","];
        return [result mutableCopy];
    }
    return @[];
}
//- (CGFloat)gridHeight{
//    if(_bodyImageUrls.length > 0 && [_bodyImageUrls containsString:@","]){
//        NSUInteger row = self.images.count % 3;
//        CGFloat height = ([UIScreen mainScreen].bounds.size.width - 30) /3  * row;
//        return height;
//    }
//    return 0;
//}
@end
