//
//  ViewController.m
//  FMDB Study
//
//  Created by 孙旭东 on 2022/10/16.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString* doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"%@", doc);
    NSString* fileName = [doc stringByAppendingPathComponent:@"collectionData.sqlite"];
    
    FMDatabase *collectionData = [FMDatabase databaseWithPath:fileName];
    
    if ([collectionData open]) {
        BOOL result = [collectionData executeUpdate:@"CREATE TABLE IF NOT EXISTS collectionData(mainLable text NOT NULL);"];
        if (result) {
            NSLog(@"seccful");
        } else {
            NSLog(@"error");
        }
        [collectionData close];
    }
}


@end
