//
//  myClass.m
//  oc.programme
//
//  Created by 孙旭东 on 2022/5/5.
//

#import "myClass.h"
#define MAX_CACHE_LINE 10

//@implementation MyClass
//- (void) Sort: (int*) nums numsSize: (int) size {
//    for (_i = 1; _i < size; _i++) {
//        _temp = nums[_i];
//        for (_j = _i - 1; _j >= 0 && _temp < nums[_j]; _j--) {
//            nums[_j + 1] = nums[_j];
//        }
//        nums[_j + 1] = _temp;
//    }
//    [self printfNums: nums numsSize: size];
//}
//- (void) printfNums: (int *) nums numsSize: (int) size {
//    for (_i = 0; _i < 6; _i++) {
//        NSLog(@"%d", nums[_i]);
//    }
//}
//@end

//@implementation VarArgs
//
//- (void) test: (NSString*) name, ... {
//    // 使用va_list定义一个argList指针变量，该指针变量指向可变参数列表
//    va_list argList;
//    // 如果第一个name参数存在，才需要处理后面的参数
//    if (name) {
//        // 由于参数name不在参数列表里面，因此需要先处理name参数
//        NSLog(@"%@", name);
//        // 让argList指向第一个可变参数列表的第一个参数
//        va_start(argList, name);
//        // va_arg用于提取argList当前指向的参数，并让指针指向下一个参数
//        // arg变量用于保存当前获取的参数，如果该参数不为nil，进入循环体
//        NSString* arg = va_arg(argList, id);
//        while (arg) {
//            // 打印出每一个参数
//            NSLog(@"%@", arg);
//            // 再次提取argList当前指向的参数，并让指针指向下一个参数
//            arg = va_arg(argList, id);
//        }
//        // 释放argList指针
//        va_end(argList);
//    }
//}
//
//@end
//
//@implementation FKPerson
//@end

//static NSString* nation;
//
//@implementation FKUser
//+ (NSString*) nation {
//    return nation;
//}
//+ (void) setNation: (NSString *) newNation {
//    if (![nation isEqualToString: newNation]) {
//        nation = newNation;
//    }
//}
//@end
//
//static id intance;
//
//@implementation FKSingleton
//+ (id) intance {
//    if (!intance) {
//        intance = [[super alloc] init];
//    }
//    return intance;
//}
//@end

//@implementation FKPerson
//- (void) SetName: (NSString*) newName {
//    if ([newName length] > 6 || [newName length] < 2) {
//        NSLog(@"你设置的人名不符合要求\n");
//        return;
//    } else {
//        _name = newName;
//    }
//}
//- (NSString*) GetName {
//    return _name;
//}
//- (void) SetAge: (int) newAge {
//    if (newAge > 100 || newAge < 0) {
//        NSLog(@"你设置的年龄不符合要求\n");
//        return;
//    } else {
//        _age = newAge;
//    }
//}
//- (int) GetAge {
//    return _age;
//}
//@end

//@implementation FKUser
//@synthesize name;
//@synthesize pass;
//@synthesize age;
//- (id) init {
//    if (self = [super init]) {
//        self.name = @"小王";
//        self.pass = @"123456";
//        self.age = 10;
//    }
//    return self;
//}
//@end

//@implementation FKCar
//@synthesize brand;
//@synthesize model;
//@synthesize color;
//- (id) initBrand: (NSString*) brand model: (NSString*) model color: (NSString*) color {
//    if (self = [super init]) {
//        self.brand = brand;
//        self.model = model;
//        self.color = color;
//    }
//    return self;
//}
//@end

//@implementation FKBooks
//@synthesize bookWithCopy;
//@synthesize bookWithoutCopy;
//@end

//@implementation FKCard
//@synthesize flower;
//@synthesize value;
//@end

//@implementation FKUser
//@synthesize name;
//@synthesize age;
//- (id) init {
//    // 调用父类的init方法，将初始化对象返回给self
//    // 如果self不为nil，则基本初始化成功
//    if (self = [super init]) {
//        // 执行初始化
//        self.name = @"小王";
//        self.age = 10;
//    }
//    return self;
//}
//@end

//@implementation FKCar
//@synthesize brand;
//@synthesize model;
//@synthesize color;
//- (id) init {
//    // 调用父类的init方法执行初始化，并将得到的对象赋值给self
//    if (self = [super init]) {
//        self.brand = @"奔驰";
//        self.model = @"01";
//        self.color = @"白色";
//    }
//    return self;
//}
//- (id) initBrand:(NSString*) brand Model:(NSString*) model {
//    // 调用本类的init方法执行初始化，并将得到的对象赋值给self
//    if (self = [self init]) {
//        self.brand = brand;
//        self.model = model;
//    }
//    return self;
//}
//- (id) initBrand:(NSString*) brand Model:(NSString*) model Color:(NSString*) color {
//    // 调用本类的initBrand: Model:方法执行初始化，并将得到的对象赋值给self
//    if (self = [self initBrand:brand Model:model]) {
//        self.color = color;
//    }
//    return self;
//}
//@end
//@implementation FKBrid
//+ (void) Fly {
//    NSLog(@"我在天空中飞！");
//}
//@end
//
//@implementation FKOsrich
//+ (void) Fly {
//    NSLog(@"我不能在天空中飞，我只能在地上跑！");
//}
//@end
//
//@implementation FKPasser
//@end

//@implementation FKFruit
//- (void) info {
//    NSLog(@"我是一个水果！重%g g", _weight);
//}
//@end
//
//@implementation FKApple
//@end


//@implementation FKBrid
//- (void) fly {
//    NSLog(@"我能在天上飞！");
//}
//@end
//
//// 实现FKOsrich类
//@implementation FKOsrich
//// 重写fly方法
//- (void) fly {
//    NSLog(@"我只能在地上跑！");
//}
//@end

//@implementation FKParent
//- (id) init {
//    if (self = [super init]) {
//        self.a = 5;
//    }
//    return self;
//}
//@end
//
//@implementation FKSub {
//    int _a;
//}
//- (id) init {
//    if (self = [super init]) {
//        self->_a = 7;
//    }
//    return self;
//}
//- (void) accessOwner {
//    NSLog(@"子类实现部分成员变量：%d", _a);
//    NSLog(@"父类被隐藏的成员变量：%d", super.a);
//}
//@end

//@implementation FKUser
//- (id) initName:(NSString *) name idStr:(NSString *) idStr {
//    if (self = [super init]) {
//        self.name = name;
//        self.idStr = idStr;
//    }
//    return self;
//}
//- (BOOL) isEqual:(id) other {
//    if (self == other) {
//        return YES;
//    }
//    FKUser* target = (FKUser*) other;
//    if (target.idStr == self.idStr) {
//        return YES;
//    } else {
//        return NO;
//    }
//}
//@end

//@implementation NSNumber (fk)
//- (NSNumber*) add:(double) num2 {
//    return [NSNumber numberWithDouble: ([self doubleValue] + num2)];
//}
//@end

//@implementation myClass
//- (void) info {
//    NSLog(@"这是一个普通的方法");
//}
//- (void) conceal {
//    NSLog(@"这是一个隐藏的方法");
//}
//@end

//@implementation FKCar
//- (void) drive:(NSString*) name {
//    NSLog(@"%@正在驾驶%@", name, self.brand);
//}
//- (NSString*) description {
//    return [NSString stringWithFormat:@"<FKCar[brand = %@, model = %@, color = %@]>", self.brand, self.model, self.color];
//}
//@end

//@implementation FKApple
//- (void) taste {
//    NSLog(@"这个苹果是甜的");
//}
//@end

//@implementation FKPrinter {
//    NSString* printData[MAX_CACHE_LINE];
//    int dataNum;
//}
//- (void) output {
//    while (dataNum > 0) {
//        NSLog(@"打印机使用%@打印%@", self.printColor, printData[0]);
//        dataNum--;
//        for (int i = 0; i < dataNum; i++) {
//            printData[i] = printData[i + 1];
//        }
//    }
//}
//- (void) addData:(NSString*) msg {
//    if (dataNum > MAX_CACHE_LINE) {
//        NSLog(@"输出队列已满!");
//    } else {
//        printData[dataNum++] = msg;
//    }
//}
//- (NSDate*) getProduceTime {
//    return [[NSDate alloc] init];
//}
//- (NSString*) printColor {
//    return @"红色";
//}
//@end

//#if __LP64__ || (TARGET_OS_EMBEDDED && !TARGET_OS_IPHONE) || TARGET_OS_WIN32 || NS_BUILD_32_LIKE_64
//typedef long NSInteger;
//typedef unsigned long NSUInteger;
//#else
//typedef int NSInteger;
//typedef unsigned int NSUInteger;
//#endif
//
//#if defined(__LP64__) && __LP64__
//# define CGFLOAT_TYPE double
//# define CGFLOAT_IS_DOUBLE 1
//# define CGFLOAT_MIN DBL_MIN
//# define CGFLOAT_MAX DBL_MAX
//#else
//# define CGFLOAT_TYPE float
//# define CGFLOAT_IS_DOUBLE 0
//# define CGFLOAT_MIN FLT_MIN
//# define CGFLOAT_MAX FLT_MAX
//#endif
//
///* Definition of the 'CGFloat' type and 'CGFLOAT_DEFINED'.*/
//
//typedef CGFLOAT_TYPE CGFLoat;
//#define CGFLOAT_DEFINED 1
//

//@implementation FKApple
//- (id) initWithColor:(NSString*) color andWeight:(double)weight {
//    if (self = [super init]) {
//        self.color = color;
//        self.weight = weight;
//    }
//    return self;
//}
//- (NSString*) description {
//    return [NSString stringWithFormat:@"<FKApple [_color = %@, _weight = %g]>", self.color, self.weight];
//}
//@end

//@implementation Brid
//- (id) initWithKind:(NSString *) kind andAge:(int) age {
//    if (self = [super init]) {
//        self.kind = kind;
//        self.age = age;
//    }
//    return self;
//}
//- (BOOL) isEqual:(id) object {
//    // 指的是同一个对象
//    if (self == object) {
//        return YES;
//    } else {
//        Brid* other = (Brid*)object;
//        // 如果是同一种鸟则返回YES
//        if (self.kind == other.kind) {
//            return YES;
//        } else {
//            return NO;
//        }
//    }
//}
//@end

// 为类别提供实现部分
//@implementation NSNumber (fk)
//- (NSNumber*) add:(double) num2 {
//    return [NSNumber numberWithDouble:([self doubleValue] + num2)];
//}
//- (NSNumber*) substract:(double) num2 {
//    return [NSNumber numberWithDouble:([self doubleValue] - num2)];
//}
//- (NSNumber*) multipy:(double) num2 {
//    return [NSNumber numberWithDouble:([self doubleValue] * num2)];
//}
//- (NSNumber*) divide:(double) num2 {
//    return [NSNumber numberWithDouble:([self doubleValue] / num2)];
//}
//@end

//@implementation FKCar
//- (void) info {
//    NSLog(@"我是一个普通的方法");
//}
//// 定义私有方法
//- (double) calDiscount:(double) discount {
//    return self.price * discount;
//}
//@end

//@implementation FKCar
//- (void) drive {
//    NSLog(@"%@正在路上行驶", self.brand);
//}
//- (void) drive:(NSString*) name {
//    NSLog(@"%@正在驾驶着%@的%@在路上行驶", name, self.color, self.brand);
//}
//@end

//@implementation FKApple
//- (void) taste {
//    NSLog(@"苹果营养丰富，口味很好！");
//}
//@end

//@implementation fatherClass
//
//- (void) info {
//    NSLog(@"aaaaaaa");
//}
//
//- (void) model {
//    NSLog(@"01");
//}
//
//@end
//
//@implementation sonClass
//- (void) text {
//    NSLog(@"bbbbbb");
//}
//@end

//@implementation elder
//// 实现委托弟子打扫寺庙
//- (void) cleanDelegate {
//    // 调用delegate属性，即委托delegate对象实现cleanTemple方法
//    [self.delegate cleanTemple];
//}
//@end
//
//@implementation disciplen
//// 实现协议，即cleanTemple方法
//- (void) cleanTemple {
//    NSLog(@"弟子已经打扫了寺庙。");
//}
//@end

//@implementation myClass
//- (void) infoIn {
//    NSLog(@"jbasiudsahb");
//}
//- (void) info {
//    [self infoIn];
//}
//@end

//@implementation myClass
//- (void) info:(NSTimer*) timer {
//    NSLog(@"第%d次执行该方法", self.count);
//    self.count++;
//    if (self.count > 10) {
//        [timer invalidate];
//    }
//}
//- (void) t {
//    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(info:) userInfo:nil repeats:YES];
//}
//@end
