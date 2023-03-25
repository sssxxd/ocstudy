//
//  MyCollectModel.m
//  Zhihu daily
//
//  Created by 孙旭东 on 2022/11/7.
//

#import "MyCollectModel.h"

@implementation MyCollectModel

- (instancetype) init {
    if (self = [super init]) {
        self.collectSet = [[NSMutableSet alloc] init];
        
        self.collectTitle = [[NSMutableArray alloc] init];
        self.collectImagePath = [[NSMutableArray alloc] init];
        
        [self createCollectData];
    }
    return self;
}

- (void) createCollectData {
    NSString* doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString* filename = [doc stringByAppendingPathComponent:@"collectData.sqlite"];
    
    self.collectDatabase = [FMDatabase databaseWithPath:filename];
    
    if ([self.collectDatabase open]) {
        BOOL result = [self.collectDatabase executeUpdate:@"CREATE TABLE IF NOT EXISTS collectData (mainLable text NOT NULL)"];
        if (result) {
            FMResultSet* resultSet = [self.collectDatabase executeQuery:@"SELECT * FROM collectData"];
            while ([resultSet next]) {
                [self.collectSet addObject:[resultSet objectForColumn:@"mainLable"]];
            }
            NSLog(@"create table succeed");
        } else {
            NSLog(@"create table error");
        }
    }
}

- (void) reloadModel {
    self.collectSet = [[NSMutableSet alloc] init];
    
    self.collectTitle = [[NSMutableArray alloc] init];
    self.collectImagePath = [[NSMutableArray alloc] init];
    
    [self createCollectData];
}

@end
