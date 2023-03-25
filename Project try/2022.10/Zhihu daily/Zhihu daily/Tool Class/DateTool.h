//
//  DateTool.h
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/10/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DateTool : NSObject

+ (NSTimeInterval) getTimeStampWithTimeString:(NSString*)timeStr;

+ (NSString*) getMonthWithTimeString:(NSString*)timeStr;

+ (NSString*) getDayWithTimeString:(NSString*)timeStr;

+ (NSString*) getMonthAndDayWithTimeString:(NSString*)timeStr;

+ (NSString*) dateMinusOneWhithTimeString:(NSString*)timeStr;

+ (NSString*) getMonthAndDayHaveHorizontalLineWithTimeStamp:(NSString*)timeStampStr;

+ (NSString*) getExactTimeWithTimeStamp:(NSString*)timeStampStr;


@end

NS_ASSUME_NONNULL_END
