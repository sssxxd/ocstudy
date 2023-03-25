//
//  main.m
//  Manage
//
//  Created by 孙旭东 on 2022/10/16.
//

#import <Foundation/Foundation.h>
#import "Manage.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Manage* manage = [Manage sharedManage];
        [manage NetWorkTestWithData:^(TestModel * _Nonnull mainViewNowModel) {
            NSLog(@"%@", mainViewNowModel);
            NSLog(@"OK");
        } error:^(NSError * _Nonnull error) {
            NSLog(@"error");
        }];
    }
    return 0;
}
