//
//  ViewController.m
//  TestCalendar
//
//  Created by 李乾 on 2018/5/22.
//  Copyright © 2018年 liqian. All rights reserved.
//

#import "ViewController.h"
#import "FSCalendar.h"
#import "ESCalendarCell.h"
#import "DateHelper.h"

@interface ViewController () <FSCalendarDataSource, FSCalendarDelegate>
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (weak, nonatomic) FSCalendar *calendar;
@property (weak, nonatomic) UIButton *previousButton;
@property (weak, nonatomic) UIButton *nextButton;
@property (strong, nonatomic) NSCalendar *gregorian;
@property (nonatomic, strong) NSArray *dateArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的情绪";
    
    self.gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    self.dateFormatter = [[NSDateFormatter alloc] init];
    self.dateFormatter.dateFormat = @"yyyy-MM-dd";
    
    FSCalendar *calendar = [[FSCalendar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 280)];
    calendar.dataSource = self;
    calendar.delegate = self;
    calendar.backgroundColor = [UIColor whiteColor];
    calendar.appearance.headerTitleColor = [UIColor redColor];
    calendar.appearance.headerTitleFont = [UIFont boldSystemFontOfSize:17];
    calendar.appearance.headerMinimumDissolvedAlpha = 0; // header中左右两月的颜色
    [calendar registerClass:[ESCalendarCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:calendar];
    self.calendar = calendar;

}

- (FSCalendarCell *)calendar:(FSCalendar *)calendar cellForDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)position {
    ESCalendarCell *cell = [calendar dequeueReusableCellWithIdentifier:@"cell" forDate:date atMonthPosition:position];
    return cell;
}

- (void)calendar:(FSCalendar *)calendar willDisplayCell:(FSCalendarCell *)cell forDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition {
    ESCalendarCell *esCell = (ESCalendarCell *)cell;
    
    UIImage *image = [UIImage imageNamed:@"iconHappy"];
    esCell.imageView.image = image;
    [esCell setEmotionType:0];
    
    for (NSDate *date_ in self.dateArray) {
        if ([DateHelper isSameDate:date_ toDate:date]) {
            [esCell setEmotionType:1];
            break;
        }
    }
}

- (NSArray *)dateArray {
    if (!_dateArray) {
        NSDate *lDate = [NSDate dateWithTimeIntervalSinceNow:-7*24*60*60];
        NSDate *date1 = [NSDate date];
        NSDate *nDate = [NSDate dateWithTimeIntervalSinceNow:24*60*60];
        _dateArray = @[lDate,date1, nDate];
    }
    return _dateArray;
}

@end
