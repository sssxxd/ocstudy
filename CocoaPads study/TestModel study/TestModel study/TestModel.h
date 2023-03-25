//
//  TestModel.h
//  TestModel study
//
//  Created by 孙旭东 on 2022/10/9.
//

@protocol StoriesModel
@end

@protocol Top_StoriesModel
@end

#import <UIKit/UIKit.h>

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface StoriesModel : JSONModel
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* ga_prefix;
@property (nonatomic, copy) NSString* image_hue;
@property (nonatomic, copy) NSString* type;
@property (nonatomic, assign) NSString* id;
@end

@interface Top_StoriesModel : JSONModel
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* ga_prefix;
@property (nonatomic, copy) NSString* image_hue;
@property (nonatomic, copy) NSString* type;
@property (nonatomic, assign) NSString* id;

@end

@interface TestModel : JSONModel

@property (nonatomic, copy) NSString* data;
@property (nonatomic, copy) NSArray<StoriesModel>* stories;
@property (nonatomic, copy) NSArray<Top_StoriesModel>* top_tories;

//@property (nonatomic, assign) int status;
//@property (nonatomic, copy) NSString* msg;
//@property (nonatomic, copy) NSString* latest;
@end

NS_ASSUME_NONNULL_END
