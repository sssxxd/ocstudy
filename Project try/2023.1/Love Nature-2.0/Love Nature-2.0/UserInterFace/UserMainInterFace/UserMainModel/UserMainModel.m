//
//  UserMainModel.m
//  Love Nature-2.0
//
//  Created by 孙旭东 on 2023/1/31.
//

#import "UserMainModel.h"

// 引入FMDB库
#import "FMDB.h"

@implementation UserInfoDataModel
+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

@implementation UserInfoModel
+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

@implementation UserContentDataModel

+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end

@implementation UserContentModel

+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end

// UserMainModel类别
@interface UserMainModel ()
@property (nonatomic, strong) FMDatabase* userDatabase;
@end

@implementation UserMainModel

// 重写init方法
- (id) init {
    if (self = [super init]) {
        
        [self getDatabaseAndCreateTable];
        [self getNicKNameAndTokenFormDatabase];
        
        self.userPetFileContentModel = [[UserContentModel alloc] init];
        self.userCollectContentModel = [[UserContentModel alloc] init];
        self.userLikeContentModel = [[UserContentModel alloc] init];
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

- (void) saveUserInfoNickName:(NSString *)nickName token:(NSString *)token icon:(NSString *)icon {
    if ([_userDatabase open]) {
        NSString* string = @"SELECT * FROM LNUserInfoDatabase";
        FMResultSet* resultSet = [_userDatabase executeQuery:string];
        
        if (![resultSet next]) {
            string = @"INSERT INTO LNUserInfoDatabase (nickName, token, iconLabel) VALUES (?, ?, ?);";
        } else {
            string = @"UPDATE LNUserInfoDatabase SET nickName = ?, token = ?, iconLabel = ?";
        }
        
        BOOL result = [_userDatabase executeUpdate:string, nickName, token, icon];
        
        if (result) {
            NSLog(@"saveUserInfo succeed");
        } else {
            NSLog(@"saveUserInfo error");
        }
        [_userDatabase close];
    }
}

@end
