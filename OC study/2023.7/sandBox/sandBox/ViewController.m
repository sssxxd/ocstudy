//
//  ViewController.m
//  sandBox
//
//  Created by 孙旭东 on 2023/7/26.
//

#import "ViewController.h"
#import "SXPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//
//    //获取沙盒根路径
//    NSString *path = NSHomeDirectory();
//    NSLog(@"沙盒根路径：%@", path);
//    //Document路径
//    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
//    NSLog(@"Document目录路径：%@", docDir);
    // 获取Library的目录路径
//    NSString *libDir = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
//    NSLog(@"Libarary目录路径：%@", libDir);
//    // 获取Caches目录路径
//    NSString *cachesDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
//    NSLog(@"Cacheas目录路径：%@", cachesDir);
//    // library Preference
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSLog(@"偏好设置目录路径：%@", defaults);
//    // 获取tmp目录路径
//    NSString *tmpDir =  NSTemporaryDirectory();
//    NSLog(@"tmp目录路径：%@", tmpDir);
    
//    [self writeToPlist];
    
//    [self writeToUserDefaults];
//    [self readFromUserDefaults];
//    [self writeUseNSKeyedArchiver];
//    [self readUseNSKeyedArchiver];
    [self setDataToPlist];
    [self getDataFromPlist];
}

- (void) writeToPlist {
    // 定义plistName
    NSString *plistName = @"test.plist";
    // 存取路径
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    // 打印路径
    NSLog(@"%@", path);
    // 连接路径
    NSString *filePath = [path stringByAppendingPathComponent:plistName];
    
    // 定义字典文件
    NSDictionary *dict = @{@"SXTTTTT":@"10"};
    
    //序列化
    [dict writeToFile:filePath atomically:YES];
    
    NSDictionary *dict1 = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSLog(@"%@", dict1);
}

- (void)writeToUserDefaults {
    // 获取偏好设置对象
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // 存储数据
    [defaults setObject:@"ouhaijian" forKey:@"name"];
    [defaults setObject:@"666666" forKey:@"password"];
    
    // 同步调用，立刻写到文件中，不写这个方法会异步，有延迟
//    [defaults synchronize];
    
//    // 获取数据
//    NSString *name = [defaults objectForKey:@"name"];
//    NSString *password = [defaults objectForKey:@"password"];
//
//    NSLog(@"name:%@", name);
//    NSLog(@"password:%@", password);
}
- (void)readFromUserDefaults {
    // 获取偏好设置对象
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // 获取数据
    NSString *name = [defaults objectForKey:@"name"];
    NSString *password = [defaults objectForKey:@"password"];
    
    NSLog(@"name:%@", name);
    NSLog(@"password:%@", password);
}

// 归档
- (void)writeUseNSKeyedArchiver {
    SXPerson *person = [[SXPerson alloc] init];
    person.age = 10;
    person.name = @"蔡徐坤";
    NSError * __autoreleasing *error = NULL;
    
    // 获得Document的全路径
    NSString *docu = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    // 获得新文件的全路径
    NSString *path = [docu stringByAppendingPathComponent:@"SXPerson.data"];
    // 将对象封装为Data并归档
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:person requiringSecureCoding:YES error:error];
    if (error) {
        NSLog(@"writeUseNSKeyedArchiver:%@", *error);
    } else {
        [data writeToFile:path atomically:YES];
    }
}

// 解档
- (void)readUseNSKeyedArchiver {
    NSError * __autoreleasing *error = NULL;
    // 获得Document的全路径
    NSString *docu = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSLog(@"%@", docu);
    // 获得新文件的全路径
    NSString *path = [docu stringByAppendingPathComponent:@"SXPerson.data"];
    // 从path路径中获取data数据
    NSData *unData = [NSData dataWithContentsOfFile:path];
    // 创建解档操作的客户端允许的类集合
        // 这个集合应包括自定义对象的属性的类
    NSSet *allowedClassesSet = [NSSet setWithObjects:[NSString class], [SXPerson class], nil];
    SXPerson *person = (SXPerson *)[NSKeyedUnarchiver unarchivedObjectOfClasses:allowedClassesSet fromData:unData error:error];
    // 打印结果
    if (error) {
        NSLog(@"readUseNSKeyedArchiver:%@", *error);
    } else {
        NSLog(@"%@-%d", person.name, person.age);
    }
}

// 写入程序plist
- (void)setDataToPlist {
    // 第一参数：文件名
    // 第二参数：文件后缀
    NSString *plist = [[NSBundle mainBundle] pathForResource:@"Show" ofType:@"plist"];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:@10 forKey:@"age"];
    [dict setValue:@"蔡徐坤" forKey:@"name"];
    [dict writeToFile:plist atomically:YES];
}

// 读取程序plist
- (void)getDataFromPlist {
    NSString *plist = [[NSBundle mainBundle] pathForResource:@"Show" ofType:@"plist"];
    NSLog(@"%@", plist);
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:plist];
    NSLog(@"%@", dict);
}

@end
