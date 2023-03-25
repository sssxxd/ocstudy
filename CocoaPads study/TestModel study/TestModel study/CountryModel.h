//
//  CountryModel.h
//  TestModel study
//
//  Created by 孙旭东 on 2022/10/15.
//

#import "JSONModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface CountryModel : JSONModel

@property (nonatomic, copy) NSString* country;
@property (nonatomic, copy) NSString* dialCode;
@property (nonatomic, assign) BOOL isInEurope;

@end

NS_ASSUME_NONNULL_END


