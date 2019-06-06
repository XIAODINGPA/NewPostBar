//
//  NSString+timeStampDateFormat.h
//  AiDiWisdomDoctor
//
//  Created by aorun on 2018/5/16.
//  Copyright © 2018年 aorun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DateFormat)

/**
  默认将时间戳转化为

 @return 格式化后的日期 yyyy/MM/dd/HH:mm
 */
- (NSString *)timeStapDateFormat;

/**

 @param formatter 日期格式
 @return 格式化后的日期
 */
//
- (NSString *)timeStapDateFormat:(NSString *)formatter;

//根据出生日期计算生日
- (NSInteger)ageWithDateOfBirth;



@end
