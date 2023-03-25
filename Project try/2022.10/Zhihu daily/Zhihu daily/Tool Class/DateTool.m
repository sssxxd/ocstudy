//
//  DateTool.m
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/10/18.
//

#import "DateTool.h"

@implementation DateTool

+ (NSTimeInterval) getTimeStampWithTimeString:(NSString*)timeStr {
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"YYYYMMdd"];
    
    NSDate* date = [dateFormatter dateFromString:timeStr];
    
    NSTimeInterval timeStamp = [date timeIntervalSince1970];
    
    return timeStamp;
}

+ (NSString*) getMonthWithTimeString:(NSString*)timeStr {
    NSTimeInterval timeStamp = [DateTool getTimeStampWithTimeString:timeStr];
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"MM"];
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    
    NSString* monthString = [dateFormatter stringFromDate:date];
    
    int month = [monthString intValue];
    
    switch (month) {
        case 1:
            monthString = @"一月";
            break;
        case 2:
            monthString = @"二月";
            break;;
        case 3:
            monthString = @"三月";
            break;
        case 4:
            monthString = @"四月";
            break;
        case 5:
            monthString = @"五月";
            break;
        case 6:
            monthString = @"六月";
            break;
        case 7:
            monthString = @"七月";
            break;
        case 8:
            monthString = @"八月";
            break;
        case 9:
            monthString = @"九月";
            break;
        case 10:
            monthString = @"十月";
            break;
        case 11:
            monthString = @"十一月";
            break;
        case 12:
            monthString = @"十二月";
            break;
        default:
            monthString = nil;
            break;
    }
    
    return monthString;
}

+ (NSString*) getDayWithTimeString:(NSString *)timeStr {
    NSTimeInterval timeStamp = [DateTool getTimeStampWithTimeString:timeStr];
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"dd"];
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    
    NSString* dayString = [dateFormatter stringFromDate:date];
    
    return dayString;
}

+ (NSString*) getMonthAndDayWithTimeString:(NSString *)timeStr {
    NSTimeInterval timeStamp = [DateTool getTimeStampWithTimeString:timeStr];
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"MM月dd日"];
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    
    NSString* monthAndDayString = [dateFormatter stringFromDate:date];
    
    return monthAndDayString;
}

+ (NSString*) dateMinusOneWhithTimeString:(NSString *)timeStr {
    NSTimeInterval timeStamp = [DateTool getTimeStampWithTimeString:timeStr];
    
    timeStamp -= 24 * 60 * 60;
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"YYYYMMdd"];
    
    NSString* string = [dateFormatter stringFromDate:date];
    
    return string;
}

+ (NSString*) getMonthAndDayHaveHorizontalLineWithTimeStamp:(NSString*)timeStampStr {
    NSTimeInterval timeStamp = [timeStampStr doubleValue];
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"MM-dd"];
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    
    NSString* monthAndDayString = [dateFormatter stringFromDate:date];
    
    return monthAndDayString;
}

+ (NSString*) getExactTimeWithTimeStamp:(NSString*)timeStampStr {
    NSTimeInterval timeStamp = [timeStampStr doubleValue];
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"HH:ss"];
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    
    NSString* ExactTimeString = [dateFormatter stringFromDate:date];
    
    return ExactTimeString;
}

@end
