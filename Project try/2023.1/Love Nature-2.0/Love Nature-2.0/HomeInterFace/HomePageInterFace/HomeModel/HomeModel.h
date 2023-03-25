//
//  HomeModel.h
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/2/6.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol KeywordListDataModel <NSObject>
@end

@protocol TopRecommendDataModel <NSObject>
@end

@protocol HomeShareDataModel <NSObject>
@end

@interface KeywordListDataModel : JSONModel
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* image;
@end

@interface KeywordListModel : JSONModel
@property (nonatomic, copy) NSArray<KeywordListDataModel>* data;
@property (nonatomic, copy) NSString* code;
@property (nonatomic, copy) NSString* msg;
@property (nonatomic, strong) NSError* err;
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

@interface HomeShareDataModel : JSONModel
@property (nonatomic, copy) NSString* mainImage;
@property (nonatomic, copy) NSString* userIcon;
@property (nonatomic, copy) NSString* userName;
@property (nonatomic, copy) NSString* title;
@end

@interface HomeShareModel : JSONModel
@property (nonatomic, copy) NSArray<HomeShareDataModel>* data;
@property (nonatomic, copy) NSString* code;
@property (nonatomic, copy) NSString* msg;
@property (nonatomic, strong) NSError* err;
@end

@interface HomeModel : NSObject
@property (nonatomic, strong) KeywordListModel* keywordListModel;
@property (nonatomic, strong) TopRecommendModel* topRecommendModel;
@property (nonatomic, strong) HomeShareModel* homeShareModel;
@end

NS_ASSUME_NONNULL_END
