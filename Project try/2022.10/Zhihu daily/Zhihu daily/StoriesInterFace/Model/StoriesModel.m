//
//  StoriesModel.m
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/10/22.
//

#import "StoriesModel.h"

@implementation StoriesModel

- (instancetype) init {
    if (self = [super init]) {
        _storiesIDArray = [[NSMutableArray alloc] init];
        _storiesExtraContentDictionary = [[NSMutableDictionary alloc] init];
        
        _storiesLikeSet = [[NSMutableSet alloc] init];
        _storiesCollectSet = [[NSMutableSet alloc] init];
        
        [self creatStroiesLikeSet];
        [self createStoriesCollectData];
    }
    return self;
}

- (void) creatStroiesLikeSet {
    NSString* doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString* fileName = [doc stringByAppendingPathComponent:@"likeData.sqlite"];
    
    self.likeDatabase = [FMDatabase databaseWithPath:fileName];
    
    if ([self.likeDatabase open]) {
        BOOL result = [self.likeDatabase executeUpdate:@"CREATE TABLE IF NOT EXISTS likeData (mainLable text NOT NULL)"];
        if (result) {
            FMResultSet* resultSet = [self.likeDatabase executeQuery:@"SELECT * FROM likeData"];
            while([resultSet next]) {
                [_storiesLikeSet addObject:[resultSet stringForColumn:@"mainLable"]];
            }
            NSLog(@"create table succeed");
        } else {
            NSLog(@"create table error");
        }
        [self.likeDatabase close];
    }
}

- (void) saveStroiesLikeSet {
    if ([self.likeDatabase open]) {
        for (NSString* ID in self.storiesLikeSet) {
            FMResultSet* resultSet = [self.likeDatabase executeQuery:@"SELECT * FROM likeData WHERE mainLable = ?", ID];
            if (![resultSet next]) {
                BOOL result = [self.likeDatabase executeUpdate:@"INSERT INTO likeData (mainLable) VALUES (?)", ID];
                if (result) {
                    NSLog(@"insert table succeed");
                } else {
                    NSLog(@"insert table error");
                }
            }
        }
        [self.likeDatabase close];
    }
}

- (void) deleteFormLikeDataWithID:(NSString*)ID {
    if ([self.likeDatabase open]) {
        BOOL result = [self.likeDatabase executeUpdate:@"delete from likeData WHERE mainLable = ?", ID];
        if (result) {
            NSLog(@"delete table succeed");
        } else {
            NSLog(@"delete table error");
        }
        [self.likeDatabase close];
    }
}

- (void) createStoriesCollectData {
    NSString* doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString* filename = [doc stringByAppendingPathComponent:@"collectData.sqlite"];
    
    self.collectDatabase = [FMDatabase databaseWithPath:filename];
    
    if ([self.collectDatabase open]) {
        BOOL result = [self.collectDatabase executeUpdate:@"CREATE TABLE IF NOT EXISTS collectData (mainLable text NOT NULL)"];
        
        if (result) {
            FMResultSet* resultSet = [self.collectDatabase executeQuery:@"SELECT * FROM collectData"];
            while ([resultSet next]) {
                [_storiesCollectSet addObject:[resultSet stringForColumn:@"mainLable"]];
            }
            NSLog(@"create table succeed");
        } else {
            NSLog(@"create table error");
        }
        [self.collectDatabase close];
    }
}

- (void) saveStoriesCollectSet {
    if ([self.collectDatabase open]) {
        for (NSString* ID in self.storiesCollectSet) {
            FMResultSet* resultSet = [self.collectDatabase executeQuery:@"SELECT * FROM collectData WHERE mainLable = ?", ID];
            if (![resultSet next]) {
                BOOL result = [self.collectDatabase executeUpdate:@"INSERT INTO collectData (mainLable) VALUES (?)", ID];
                if (result) {
                    NSLog(@"insert table succeed");
                } else {
                    NSLog(@"insert table error");
                }
            }
        }
        [self.collectDatabase close];
    }
}

- (void) deleteFormCollectDataWithID:(NSString*)ID {
    if ([self.collectDatabase open]) {
        BOOL result = [self.collectDatabase executeUpdate:@"delete from collectData WHERE mainLable = ?", ID];
        if (result) {
            NSLog(@"delete succeed");
        } else {
            NSLog(@"delete error");
        }
    }
}

@end
