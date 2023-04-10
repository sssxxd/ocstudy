//
//  SearchModel.h
//  Find
//
//  Created by 孙旭东 on 2023/3/29.
//
#import "HomeModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol KeywordListDataModel <NSObject>
@end

@protocol SearchShareDataModel <NSObject>
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

@interface SearchShareDataAuthorModel : JSONModel
@property (nonatomic, copy) NSString* email;
@property (nonatomic, copy) NSString* nickName;
@property (nonatomic, copy) NSString* icon;
@end

@interface SearchShareDataModel : JSONModel
@property (nonatomic, copy) NSString* createdAt;
@property (nonatomic, strong) SearchShareDataAuthorModel* author;
@property (nonatomic, copy) NSString* content;
@property (nonatomic, copy) NSString* blogTitle;
@property (nonatomic, copy) NSArray<NSString>* pictures;
@property (nonatomic, assign) NSInteger getLikesNumber;
@property (nonatomic, copy) NSString* location;
@property (nonatomic, copy) NSString* highlight;
@end

@interface SearchShareModel : JSONModel
@property (nonatomic, copy) NSArray<SearchShareDataModel>* data;
@property (nonatomic, copy) NSString* code;
@property (nonatomic, copy) NSString* msg;
@property (nonatomic, strong) NSError* err;
@end

@interface SearchModel : JSONModel

@property (nonatomic, strong) KeywordListModel* keywordListModel;
@property (nonatomic, strong) SearchShareModel* searchShareModel;

@end

NS_ASSUME_NONNULL_END
