


//
//  NSString+timeStampDateFormat.m
//  AiDiWisdomDoctor
//
//  Created by aorun on 2018/5/16.
//  Copyright © 2018年 aorun. All rights reserved.
//

#import "NSString+timeStampDateFormat.h"

@implementation NSString (DateFormat)
#pragma mark - 默认格式 yyyy/MM/dd/HH:mm
- (NSString *)timeStapDateFormat
{
    return  [self timeStapDateFormat:@"yyyy/MM/dd/HH:mm"];
}

- (NSString *)timeStapDateFormat:(NSString *)formatter
{
    //yyyy/MM/dd/HH:mm
    // iOS 生成的时间戳是10位
    NSTimeInterval interval    = [self doubleValue] / 1000.0;
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:formatter];
    NSString *dateString = [dateformatter stringFromDate: date];
    return dateString;
}


//计算年龄
- (NSInteger)ageWithDateOfBirth;
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [formatter dateFromString:self];
    // 出生日期转换 年月日
    NSDateComponents *components1 = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:date];
    NSInteger brithDateYear  = [components1 year];
    NSInteger brithDateDay   = [components1 day];
    NSInteger brithDateMonth = [components1 month];
    
    // 获取系统当前 年月日
    NSDateComponents *components2 = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:[NSDate date]];
    NSInteger currentDateYear  = [components2 year];
    NSInteger currentDateDay   = [components2 day];
    NSInteger currentDateMonth = [components2 month];
    
    // 计算年龄
    NSInteger iAge = currentDateYear - brithDateYear - 1;
    if ((currentDateMonth > brithDateMonth) || (currentDateMonth == brithDateMonth && currentDateDay >= brithDateDay)) {
        iAge++;
    }
    
    return iAge;
}




@end
