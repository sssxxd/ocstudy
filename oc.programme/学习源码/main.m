//
//  main.m
//  oc.programme
//
//  Created by 孙旭东 on 2022/5/5.
//

#import <Foundation/Foundation.h>
#import "myClass.h"

//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        MyClass* person = [[MyClass alloc] init];
//        int arr[] = {1, 4, 6, 3, 2, 5};
//        [person Sort: arr numsSize: 6];
//    }
//    return 0;
//}

//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        VarArgs* va = [[VarArgs alloc] init];
//        [va test: @"疯狂iOS讲义", @"疯狂Android讲义", @"疯狂Ajax讲义", nil];
//    }
//    return 0;
//}

//int main(int argc, char * argv[]) {
//    @autoreleasepool {
//        FKPerson* p = [[FKPerson alloc] init];    // 创建FKPerson对象
//        NSLog(@"p变量的_name实例变量的值是：%@， p对象的_name实例变量是：%d", p->_name, p->_age);
//        // 通过指针变量来访问Person对象_name, _age实例变量。
//        p->_name = @"孙悟空";
//        p->_age = 500;
//        NSLog(@"p变量的_name实例变量的值是：%@， p对象的_name实例变量是：%d", p->_name, p->_age);
//    }
//}

//int main(int argc, char * argv[]) {
//    @autoreleasepool {
//        [FKUser setNation: @"中国"];
//        NSLog(@"nation：%@", [FKUser nation]);
//    }
//    return 0;
//}

//int main(void) {
//    @autoreleasepool {
//        if ([FKSingleton intance] == [FKSingleton intance]) {
//            // 如果两次创建单例相同打印1
//            NSLog(@"1");
//        } else {
//            // 否则打印0
//            NSLog(@"0");
//        }
//    }
//}

//int main(void) {
//    @autoreleasepool {
//        FKUser* user = [[FKUser alloc] init];
//        NSLog(@"User 姓名：%@，密码：%@，年龄%d\n", user.name, user.pass, user.age);
//    }
//    return 0;
//}

//int main(void) {
//    @autoreleasepool {
//        FKCar* myCar = [[FKCar alloc] initBrand:@"奥迪" model:@"01" color:@"Black"];
//        NSLog(@"%@ %@ %@", myCar.brand, myCar.model, myCar.color);
//    }
//}

//int main (void) {
//    @autoreleasepool {
//        FKBooks* books = [[FKBooks alloc] init];
//        NSMutableString* str1 = [NSMutableString stringWithString:@"《疯狂iOS讲义》"];
//        NSMutableString* str2 = [NSMutableString stringWithString:@"《疯狂jave讲义》"];
//        [books setBookWithCopy:str1];
//        [books setBookWithoutCopy:str2];
//        NSLog(@"bookWithCopy:%@\nbookWithoutCopy:%@", [books bookWithCopy], [books bookWithoutCopy]);
//        // 修改str1和str2字符串
//        [str1 appendString:@"好耶！"];
//        [str2 appendString:@"好耶！"];
//        // 该代码你会看到没有使用copy的bookWithoutCopy属性也被修改
//        NSLog(@"bookWithCopy:%@\nbookWithoutCopy:%@", [books bookWithCopy], [books bookWithoutCopy]);
//    }
//}

//int main(int argc, char * argv[]) {
//    @autoreleasepool {
//        FKCard* card = [[FKCard alloc] init];
//        // 使用点语法设置属性
//        card.flower = @"♤";
//        card.value = @"A";
//        // 使用点语法访问属性
//        NSLog(@"我的扑克牌：%@ %@", card.flower, card.value);
//    }
//}

//int main(int argc, char * argv[]) {
//    @autoreleasepool {
//        // 创建对象并实现初始化
//        FKUser* user = [[FKUser alloc] init];
//        // 访问对象的成员变量
//        NSLog(@"名字：%@ 年龄：%d\n", user.name, user.age);
//    }
//}

//int main(int argc, char * argv[]) {
//    @autoreleasepool {
//        FKCar *car1 = [[FKCar alloc] init];
//        FKCar *car2 = [[FKCar alloc] initBrand:@"宝马" Model:@"02"];
//        FKCar *car3 = [[FKCar alloc] initBrand:@"奥迪" Model:@"03" Color:@"Black"];
//        NSLog(@"Car1: %@ %@ %@", car1.brand, car1.model, car1.color);
//        NSLog(@"Car2: %@ %@ %@", car2.brand, car2.model, car2.color);
//        NSLog(@"Car3: %@ %@ %@", car3.brand, car3.model, car3.color);
//    }
//}

//int main(int argc, char * argv[]) {
//    @autoreleasepool {
//        // 尝试调用父类方法
//        [FKPasser Fly];
//        // 重写父类方法后，尝试调用
//        [FKOsrich Fly];
//    }
//}

//int main(int argc, char * argv[]) {
//    @autoreleasepool {
//        // 创建FKApple对象
//        FKApple* a = [[FKApple alloc] init];
//        // FKApple对象本身没有weight属性
//        // 因为FKFruit有weight属性，也可以访问FKApple对象的weight属性
//        a.weight = 56;
//        // 调用FKApple对象的info方法
//        [a info];
//    }
//}

//int main(int argc, char * argv[]) {
//    @autoreleasepool {
//        // 创建FKOsrich对象
//        FKOsrich* os = [[FKOsrich alloc] init];
//        // 执行os的fly方法
//        [os fly];
//    }
//}

//int main(int argc, char * argv[]) {
//    @autoreleasepool {
//        FKSub* sub = [[FKSub alloc] init];
//        [sub accessOwner];
//    }
//}

//int main(int argc, char * argv[]) {
//    @autoreleasepool {
//        NSNumber* num = [NSNumber numberWithInt:20];
//        NSNumber* be = [NSNumber numberWithDouble:3.4];
//        NSLog(@"%d", [num intValue]);
//        NSLog(@"%f", [be doubleValue]);
//    }
//}

//int main(int argc, char * argv[]) {
//    @autoreleasepool {
//        NSString* str1 = @"0";
//        NSString* str2 = @"0";
//        NSLog(@"%d", (str1 == str2));
//        NSLog(@"%p", &str1);
//        NSLog(@"%p", &str2);
//        str2 = [NSString stringWithFormat:@"hello"];
//        NSLog(@"%d", (str1 == str2));
//        NSLog(@"%p", &str1);
//        NSLog(@"%p", &str2);
//        str1 = [NSString stringWithFormat:@"hello"];
//        NSLog(@"%d", (str1 == str2));
//        NSLog(@"%p", &str1);
//        NSLog(@"%p", str2);
//    }
//}

//int main(void) {
//    @autoreleasepool {
//        FKUser* user1 = [[FKUser alloc] initName:@"小孙" idStr:@"123456"];
//        FKUser* user2 = [[FKUser alloc] initName:@"小王" idStr:@"123456"];
//        NSLog(@"%d", [user1 isEqual: user2]);
//    }
//}

//int main(void) {
//    @autoreleasepool {
//        NSNumber* myNum = [NSNumber numberWithInt:3];
//        NSNumber* add = [myNum add:3.4];
//        NSLog(@"%@", add);
//    }
//}

//@interface myClass (my)
//- (void) conceal;
//@end
//
//int main(void) {
//    @autoreleasepool {
//        myClass* m = [[myClass alloc] init];
//        [m info];
//        [m conceal];
//    }
//}

//int main(void) {
//    @autoreleasepool {
//        FKCar* car = [[FKCar alloc] init];
//        car.brand = @"奔驰";
//        car.model = @"01";
//        car.color = @"黑色";
//        [car drive:@"小王"];
//        NSLog(@"%@", [car description]);
//    }
//}

//int main(void) {
//    @autoreleasepool {
//        FKApple* apple = [[FKApple alloc] init];
//        [apple taste];
//    }
//}

//int main(void) {
//    @autoreleasepool {
//        FKPrinter* printer = [[FKPrinter alloc] init];
//        [printer addData:@"疯狂iOS讲义"];
//        [printer addData:@"疯狂XML讲义"];
//        [printer output];
//        [printer addData:@"疯狂Android讲义"];
//        [printer addData:@"疯狂Ajax讲义"];
//        [printer output];
//        // 创建一个FKPrinter对象， 当成FKProductable使用
//        NSObject<FKProductable>* p = [[FKPrinter alloc] init];
//        NSLog(@"%@", p.getProduceTime);
//        // 创建一个FKPrinter对象，当成FKOutput使用
//        id<FKOutput> out = [[FKPrinter alloc] init];
//        [out addData:@"孙悟空"];
//        [out addData:@"猪八戒"];
//        [out output];
//    }
//}
//
////int main(void) {
////    @autoreleasepool {
////        unichar data[6] = {97, 98, 99, 100, 101, 102};
////        NSString* str = [[NSString alloc] initWithCharacters:data length:6];
////        NSLog(@"%@", str);
////        char* cstr = "Hello, iOS!";
////        NSString* str2 = [NSString stringWithUTF8String:cstr];
////        NSLog(@"%@", str2);
//////        [str2 writeToFile:@"myFile.txt"
//////               atomically:YES
//////                 encoding:NSUTF8StringEncoding
//////                    error:nil];
////        NSString* str3 = [NSString stringWithContentsOfFile:@"myFiled.txt"
////                                                   encoding:NSUTF8StringEncoding
////                                                      error:nil];
////        NSLog(@"%@", str3);
////    }
////}
//
////int main(void) {
////    @autoreleasepool {
////        // 调用类方法将int类型的值包装成NSNumber对象
////        NSNumber* num = [NSNumber numberWithInt:20];
////        // 调用类方法将double类型的值包装成NSNumber对象
////        NSNumber* de = [NSNumber numberWithDouble:3.14];
////        NSLog(@"%d", [num intValue]);
////        NSLog(@"%g", [de doubleValue]);
////        // 先创建NSNumber对象，在调用initWithXxx方法初始化
////        NSNumber* ch = [[NSNumber alloc] initWithChar:'J'];
////        NSLog(@"%c", [ch charValue]);
////    }
////}
//
////int main(void) {
////    @autoreleasepool {
////        FKApple* apple = [[FKApple alloc] initWithColor:@"red" andWeight:3.4];
////        NSLog(@"%@", [apple description]);
////    }
////}
//
////int main(void) {
////    @autoreleasepool {
////        int num1 = 0;
////        int num2 = 0;
////        int* per1 = &num1;
////        int* per2 = &num2;
////        NSString* str1 = @"hello word";
////        NSString* str2 = @"hello word";
////        NSString* str3 = @"hello user";
////        NSLog(@"%d", num1 == num2);
////        NSLog(@"%d", str1 == str2);
////        NSLog(@"%d", str1 == str3);
////        NSLog(@"%d", per1 == per2);
////    }
////
//
////int main(void) {
////    @autoreleasepool {
////        NSString* str1 = [NSString stringWithFormat:@"hello word"];
////        NSString* str2 = [NSString stringWithFormat:@"hello word"];
////        NSLog(@"%d", (str1 == str2));
////        NSLog(@"%d", [str1 isEqual:str2]);
////    }
////}
//
////int main(void) {
////    @autoreleasepool {
////        Brid* brid1 = [[Brid alloc] initWithKind:@"麻雀" andAge:3];
////        Brid* brid2 = [[Brid alloc] initWithKind:@"麻雀" andAge:2];
////        Brid* brid3 = [[Brid alloc] initWithKind:@"喜鹊" andAge:3];
////        NSLog(@"%d", [brid1 isEqual:brid2]);
////        NSLog(@"%d", [brid1 isEqual:brid3]);
////    }
////}
//
//
////int main(void) {
////    @autoreleasepool {
////        NSNumber* num1 = [NSNumber numberWithDouble:3];
////        NSNumber* add = [num1 add:2.4];
////        NSLog(@"%@", add);
////        NSNumber* substract = [num1 substract:2.4];
////        NSLog(@"%@", substract);
////        NSNumber* multipy = [num1 multipy:2.4];
////        NSLog(@"%@", multipy);
////        NSNumber* divide = [num1 divide:2.4];
////        NSLog(@"%@", divide);
////
////    }
////}
//
////@interface FKCar (fk)
////- (double) calDiscount:(double) discount;
////@end
////
////int main(void) {
////    @autoreleasepool {
////        FKCar* car = [[FKCar alloc] init];
////        car.price = 1000;
////        double discount = 0.87;
////        // 调用普通方法
////        [car info];
////        // 调用私有方法
////        NSLog(@"%g", [car calDiscount:discount]);
////    }
////}
//
////int main(void) {
////    @autoreleasepool {
////        FKCar* car = [[FKCar alloc] init];
////        // 使用点语法为car对象的属性赋值
////        car.brand = @"宝马";
////        car.model = @"01";
////        car.color = @"黑色";
////        // 调用接口部分的方法
////        [car drive];
////        // 调用扩占部分的方法
////        [car drive:@"老王"];
////    }
////}
//
////int main(void) {
////    @autoreleasepool {
////        FKApple* app = [[FKApple alloc] init];
////        [app taste];
////    }
////}

//int main(void) {
//    @autoreleasepool {
//        sonClass* son = [[sonClass alloc] init];
//        [son info];
//        [son info];
//        [son model];
//        id<protocolAg> my = [[sonClass alloc] init];
////        [my info];
////        [my model];
//    }
//}

//int main(void) {
//    @autoreleasepool {
//        // 创建长老对象
//        elder* a = [[elder alloc] init];
//        // 创建弟子对象
//        disciplen* b = [[disciplen alloc] init];
//        // 将长老的委托对象设置为弟子
//        a.delegate = b;
//        // 调用长老的方法委托弟子打扫
//        [a cleanDelegate];
//    }
//}

//int main(void) {
//    @autoreleasepool {
//        NSString* str = @"Hello";
//        NSString* book = @"《疯狂iOS讲义》";
//        str = [str stringByAppendingString:@",iOS"];
//        NSLog(@"%@", str);
//        const char* cstr = [str UTF8String];
//        NSLog(@"获取的C字符串：%s", cstr);
//        str = [str stringByAppendingFormat:@"%@是一本非常不错的书！", book];
//        NSLog(@"%@", str);
//        NSLog(@"str的字符个数为:%lu", [str length]);
//        NSLog(@"str按UTF-8字符集解码后字节数为:%lu", [str lengthOfBytesUsingEncoding:NSUTF8StringEncoding]);
//        NSString* s1 = [str substringFromIndex:10];
//        NSLog(@"%@", s1);
//        NSString* s2 = [str substringFromIndex:5];
//        NSLog(@"%@", s2);
//        NSString* s3 = [str substringWithRange:NSMakeRange(5, 15)];
//        NSLog(@"%@", s3);
//        NSRange pos = [str rangeOfString:@"iOS"];
//        NSLog(@"iOS在str中出现的开始位置：%ld，长度为:%ld", pos.location, pos.length);
//        str = [str uppercaseString];
//        NSLog(@"%@", str);
//    }
//}

//int main(void) {
//    @autoreleasepool {
//        NSString* book = @"《疯狂iOS讲义》";
//        NSMutableString* str = [NSMutableString stringWithString:@"Hello"];
//        [str appendString:@", iOS"];
//        NSLog(@"%@", str);
//        [str appendFormat:@"%@是一本非常不错的书！", book];
//        NSLog(@"%@", str);
//        [str insertString:@"fkit.org" atIndex:6];
//        NSLog(@"%@", str);
//        [str deleteCharactersInRange:NSMakeRange(6, 12)];
//        NSLog(@"%@", str);
//        [str replaceCharactersInRange:NSMakeRange(6, 9) withString:@"Objectove-C"];
//        NSLog(@"%@", str);
//    }
//}

//int main(void) {
//    @autoreleasepool {
//        id<myProtocal> p = [[myClass alloc] init];
//        [p info];
//        myClass* p2 = [[myClass alloc] init];
//        [p2 infoIn];
//    }
//}

//int main(void) {
//    @autoreleasepool {
//        NSDate* dt = [NSDate date];
//        NSLocale* lo = [NSLocale currentLocale];
//        NSLog(@"%@", lo);
//        NSLog(@"%@", dt);
//        NSLog(@"%@", [dt descriptionWithLocale:lo]);
//    }
//}

//int main(void) {
//    @autoreleasepool {
//        NSDate* dt = [NSDate dateWithTimeIntervalSince1970:3600 * 24 * 366 * 20];
//        NSLocale* locales[] = {
//            [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"],
//            [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]
//        };
//        NSDateFormatter* df[8];
//        for (int i = 0; i < 2; i++) {
//            df[i * 4] = [[NSDateFormatter alloc] init];
//            [df[i * 4] setDateStyle:NSDateFormatterShortStyle];
//            [df[i * 4] setTimeStyle:NSDateFormatterShortStyle];
//            [df[i * 4] setLocale:locales[i]];
//            df[i * 4 + 1] = [[NSDateFormatter alloc] init];
//            [df[i * 4 + 1] setDateStyle:NSDateFormatterMediumStyle];
//            [df[i * 4 + 1] setTimeStyle:NSDateFormatterMediumStyle];
//            [df[i * 4 + 1] setLocale:locales[i]];
//            df[i * 4 + 2] = [[NSDateFormatter alloc] init];
//            [df[i * 4 + 2] setDateStyle:NSDateFormatterLongStyle];
//            [df[i * 4 + 2] setTimeStyle:NSDateFormatterLongStyle];
//            [df[i * 4 + 2] setLocale:locales[i]];
//            df[i * 4 + 3] = [[NSDateFormatter alloc] init];
//            [df[i * 4 + 3] setDateStyle:NSDateFormatterFullStyle];
//            [df[i * 4 + 3] setTimeStyle:NSDateFormatterFullStyle];
//            [df[i * 4 + 3] setLocale:locales[i]];
//        }
//        for (int i = 0; i < 2; i++) {
//            switch (i) {
//                case 0 :
//                    NSLog(@"-------中国格式-------");
//                    break;
//                case 1:
//                    NSLog(@"-------美国格式-------");
//                    break;
//            }
//            NSLog(@"%@", [df[i * 4] stringFromDate: dt]);
//            NSLog(@"%@", [df[i * 4 + 1] stringFromDate: dt]);
//            NSLog(@"%@", [df[i * 4 + 2] stringFromDate: dt]);
//            NSLog(@"%@", [df[i * 4 + 3] stringFromDate: dt]);
//        }
//        NSDateFormatter* df2 = [[NSDateFormatter alloc] init];
//        [df2 setDateFormat:@"yyyy-MM-DD"];
//        NSLog(@"%@", [df2 stringFromDate: dt]);
//        NSString* dateStr = @"2013-03-02";
//        NSDate* date2 = [df2 dateFromString: dateStr];
//        NSLog(@"%@", date2);
//    }
//}

//int main(void) {
//    @autoreleasepool {
//        NSCalendar* gargorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//        NSDate* dt = [NSDate date];
//        unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitHour | NSCalendarUnitDay | NSMinusSetExpressionType | NSCalendarUnitSecond | NSCalendarUnitWeekday;
//
//    }
//}

//int main(void) {
//    @autoreleasepool {
//        myClass* p = [[myClass alloc] init];
//        p.count = 0;
//        [p t];
//    }
//}

//int main(void) {
//    @autoreleasepool {
//        NSMutableString* str = [NSMutableString stringWithString:@"《疯狂iOS讲义》"];
//        // 复制str不可修改的副本
//        NSMutableString* strCopy = [str copy];
//        // 打印副本
//        NSLog(@"%@", strCopy);
//        // 因为strCopy是不可修改的，因此下面被注释的代码会报错
//        // [strCopy appendString:@"aa"];
//    }
//}

//int main(void) {
//    @autoreleasepool {
//        NSMutableString* str = [NSMutableString stringWithString:@"《疯狂iOS讲义》"];
//        // 复制str可修改的副本
//        NSMutableString* strCopy = [str mutableCopy];
//        // 尝试修改副本
//        [strCopy replaceCharactersInRange:NSMakeRange(3, 3)
//                               withString:@"Android"];
//        // 修改副本对原字符串无影响
//        NSLog(@"%@", str);
//        // 副本已被修改
//        NSLog(@"%@", strCopy);
//    }
//}

