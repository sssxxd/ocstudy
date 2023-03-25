//
//  CommentModel.h
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/11/1.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol Comments <NSObject>
@end

@interface Reply_To : JSONModel

@property (nonatomic, copy) NSString* author;
@property (nonatomic, copy) NSString* content;
@property (nonatomic, assign) NSString* status;

@end

@interface Comments : JSONModel

@property (nonatomic, copy) NSString* author;
@property (nonatomic, copy) NSString* content;
@property (nonatomic, copy) NSString* avatar;
@property (nonatomic, copy) NSString* time;
@property (nonatomic, copy) NSString* likes;

@property (nonatomic, strong) Reply_To* reply_to;

@end

@interface CommentModel : JSONModel

@property (nonatomic, copy) NSArray<Comments>* comments;

@end

NS_ASSUME_NONNULL_END
