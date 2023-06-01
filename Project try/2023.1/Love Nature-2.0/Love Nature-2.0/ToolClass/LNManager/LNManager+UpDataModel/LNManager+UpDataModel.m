//
//  LNManager+UpDataModel.m
//  Find
//
//  Created by 孙旭东 on 2023/4/11.
//

#import "LNManager+UpDataModel.h"

#import "UpDataModel.h"

@implementation LNManager (UpDataModel)

- (void) postNickName:(NSString *)nickName Token:(NSString *)token blogTitle:(NSString *)blogTitle Content:(NSString *)content Location:(NSString *)location pictures:(NSArray *)pictures succeedBlock:(nonnull UpDataTitleModelBlock)succeedBlock ErrorBlock:(nonnull ErrorBlock)errorBlock {
    
    AFHTTPSessionManager* AFManager = [AFHTTPSessionManager manager];
    AFManager.requestSerializer = [AFJSONRequestSerializer serializer];
    AFManager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [AFManager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    
    NSString* urlString = [NSString stringWithFormat:@"http://101.42.38.110:9999/api/v1/blog/content/%@", nickName];
    
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSDictionary* parameters = @{@"blogTitle":blogTitle, @"content":content, @"location":location};
    
    NSMutableArray* fileImageDataArray = [NSMutableArray array];
    
    for (UIImage* image in pictures) {
        NSData* imageData = UIImageJPEGRepresentation(image, 0.1);
        
        [fileImageDataArray addObject:imageData];
    }
    
    [AFManager POST:urlString parameters:parameters headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        for (NSData* data in fileImageDataArray) {
            NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString* string = [formatter stringFromDate:[NSDate date]];
            NSString* fileName = [NSString stringWithFormat:@"%@.jpeg", string];
            
            [formData appendPartWithFileData:data name:@"pictures" fileName:fileName mimeType:@"image/jpeg"];
        }
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@", responseObject);
        
        UpDataTitleModel* upDataTitleModel = [[UpDataTitleModel alloc] initWithDictionary:responseObject error:nil];
        succeedBlock(upDataTitleModel);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

-(NSData*)JSONData:(NSArray *) array {
    NSError* error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if ([jsonData length] > 0 && error == nil){
        return jsonData;
    }else{
        return nil;
    }
}
@end
