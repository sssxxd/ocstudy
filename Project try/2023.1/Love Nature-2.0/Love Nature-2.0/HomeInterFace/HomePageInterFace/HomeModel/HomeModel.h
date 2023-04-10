//
//  HomeModel.h
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/6.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TopRecommendDataModel <NSObject>
@end

@protocol HomeShareDataModel <NSObject>
@end

@protocol NSString <NSObject>
@end

@interface TopRecommendDataModel : JSONModel
@property (nonatomic, copy) NSString* imageString;
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* authorName;
@end

@interface TopRecommendModel : JSONModel
@property (nonatomic, copy) NSArray<TopRecommendDataModel>* data;
@property (nonatomic, copy) NSString* code;
@property (nonatomic, copy) NSString* msg;
@property (nonatomic, strong) NSError* err;
@end

@interface HomeShareAuthorDataModel : JSONModel
@property (nonatomic, copy) NSString* email;
@property (nonatomic, copy) NSString* nickName;
@property (nonatomic, copy) NSString* icon;
@end

@interface HomeShareDataModel : JSONModel
@property (nonatomic, copy) NSString* createdAt;
@property (nonatomic, strong) HomeShareAuthorDataModel* author;
@property (nonatomic, copy) NSString* content;
@property (nonatomic, copy) NSString* blogTitle;
@property (nonatomic, copy) NSArray<NSString>* pictures;
@property (nonatomic, assign) NSInteger getLikesNumber;
@property (nonatomic, copy) NSString* location;
@end

@interface HomeShareModel : JSONModel
@property (nonatomic, copy) NSArray<HomeShareDataModel>* data;
@property (nonatomic, copy) NSString* code;
@property (nonatomic, copy) NSString* msg;
@property (nonatomic, strong) NSError* err;
@end

@interface HomeModel : NSObject
@property (nonatomic, strong) TopRecommendModel* topRecommendModel;
@property (nonatomic, strong) HomeShareModel* homeShareModel;
@end

NS_ASSUME_NONNULL_END
