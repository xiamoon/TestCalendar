//
//  DateHelper.m
//  TestCalendar
//
//  Created by 李乾 on 2018/5/22.
//  Copyright © 2018年 liqian. All rights reserved.
//

#import "DateHelper.h"

@implementation DateHelper

+ (BOOL)isSameDate:(NSDate *)date toDate:(NSDate *)toDate {
    NSDateFormatter *dateFormater = [NSDateFormatter new];
    [dateFormater setDateFormat:@"YYYY-MM-dd"];
    NSString *str1 = [dateFormater stringFromDate:date];
    NSString *str2 = [dateFormater stringFromDate:toDate];
    return [str1 isEqualToString:str2];
}

@end
