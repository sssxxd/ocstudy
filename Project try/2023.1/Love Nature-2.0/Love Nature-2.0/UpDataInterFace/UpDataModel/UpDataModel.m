//
//  UpDataModel.m
//  Find
//
//  Created by 孙旭东 on 2023/3/22.
//

#import "UpDataModel.h"

#import "FMDB.h"

@implementation UpDataTitleModel

+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end

@interface UpDataModel ()
@property (nonatomic, strong) FMDatabase* userDatabase;
@end

@implementation UpDataModel

- (instancetype) init {
    if (self = [super init]) {
        [self getDatabaseAndCreateTable];
        [self getNicKNameAndTokenFormDatabase];
    }
    return self;
}

#pragma mark - 数据库操作
// 获得数据库、创表
- (void) getDatabaseAndCreateTable {
    // 获得数据文件路径
    NSString* doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString* fileName = [doc stringByAppendingPathComponent:@"LNUserInfo.sqlite"];
    
    // 获得数据库
    self.userDatabase = [FMDatabase databaseWithPath:fileName];
    
    // 创建列表
    if ([_userDatabase open]) {
        NSString* string = @"CREATE TABLE IF NOT EXISTS LNUserInfoDatabase (nickName text NOT NULL, token text NOT NULL, iconLabel text NOT NULL);";
        BOOL result = [_userDatabase executeUpdate:string];
        
        if (result) {
            NSLog(@"CREATE LNUserInfo Succeed");
        } else {
            NSLog(@"CREATE LNUserInfo Error");
        }
        [_userDatabase close];
    }
}

// 获取token和昵称
- (void) getNicKNameAndTokenFormDatabase {
    if ([_userDatabase open]) {
        NSString* string = @"SELECT * FROM LNUserInfoDatabase";
        FMResultSet* resultSet = [_userDatabase executeQuery:string];
        
        while ([resultSet next]) {
            self.nickName = [resultSet stringForColumn:@"nickName"];
            self.token = [resultSet stringForColumn:@"token"];
        };
        [_userDatabase close];
    }
}

@end
