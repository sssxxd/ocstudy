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

int main(void) {
    @autoreleasepool {
        
    }
}
