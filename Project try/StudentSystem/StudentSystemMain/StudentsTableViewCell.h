//
//  StudentsTableViewCell.h
//  StudentSystem
//
//  Created by 孙旭东 on 2022/8/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define ARRAY_STUDENTNAME 0
#define ARRAY_STUDENTCLASS 1
#define ARRAY_STUDENTNUMBER 2

@interface StudentsTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel* studentName;
@property (nonatomic, strong) UILabel* studentClass;
@property (nonatomic, strong) UILabel* studentNumber;

@end

NS_ASSUME_NONNULL_END
