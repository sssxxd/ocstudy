//
//  myClass.h
//  oc.programme
//
//  Created by 孙旭东 on 2022/5/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//@interface MyClass : NSObject {
//    int _i;
//    int _j;
//    int _temp;
//}
//- (void) Sort: (int*) nums numsSize: (int) size;
//- (void) printfNums: (int*) nums numsSize: (int) size;
//@end

//@interface VarArgs : NSObject
//// 定义形参可变的方法
//- (void) test: (NSString*) name, ...;
//@end
//
//@interface FKPerson : NSObject {
//    @public
//    // 定义两个实例变量
//    NSString* _name;
//    int _age;
//}
//@end

//@interface FKUser : NSObject
//+ (NSString*) nation;
//+ (void) setNation: (NSString*) newNation;
//@end
//
//@interface FKSingleton : NSObject
//+ (id) intance;
//@end

//@interface FKPerson : NSObject {
//    @package
//    NSString* _name;
//    int _age;
//}
//- (void) SetName: (NSString*) newName;
//- (NSString*) GetName;
//- (void) SetAge: (int) newAge;
//- (int) GetAge;
////@end
//@interface FKUser : NSObject
//@property (nonatomic) NSString* name;
//@property NSString* pass;
//@property int age;
//@end

//@interface FKCar : NSObject
//@property (nonatomic, copy) NSString* brand;
//@property (nonatomic, copy) NSString* model;
//@property (nonatomic, copy) NSString* color;
//- (id) initBrand: (NSString*) brand model: (NSString*) model color: (NSString*) color;
//@end

//@interface FKBooks : NSObject
//@property (nonatomic) NSString* bookWithoutCopy;
//@property (nonatomic, copy) NSString* bookWithCopy;
//@end

//@interface FKCard : NSObject
//@property (nonatomic, copy) NSString* flower;
//@property (nonatomic, copy) NSString* value;
//@end

//@interface FKUser : NSObject
//@property NSString* name;
//@property int age;
//@end

//@interface FKCar : NSObject
//@property (nonatomic) NSString* brand;
//@property (nonatomic) NSString* model;
//@property (nonatomic) NSString* color;
//- (id) initBrand:(NSString*) brand Model:(NSString*) model;
//- (id) initBrand:(NSString*) brand Model:(NSString*) model Color:(NSString*) color;
//@end

//@interface FKBrid : NSObject
//+ (void) Fly;
//@end
//
//@interface FKOsrich : FKBrid
//+ (void) Fly;
//@end;
//
//@interface FKPasser : FKBrid
//@end

//@interface FKFruit : NSObject
//@property (nonatomic, assign) double weight;
//- (void) info;
//@end;
//
//// FKApple只是一个空类，它是FKFruit的子类
//@interface FKApple : FKFruit
//@end

//@interface FKBrid : NSObject
//- (void) fly;
//@end
//
//// 声明FKOsrich类接口
//@interface FKOsrich : FKBrid
//@end
//
//@interface FKParent : NSObject {
//    int _a;
//}
//@property int a;
//@end
//
//@interface FKSub : FKParent
//- (void) accessOwner;
//@end

//@interface FKUser : NSObject
//@property (nonatomic, copy) NSString* name;
//@property (nonatomic, copy) NSString* idStr;
//- (id) initName:(NSString*) name idStr:(NSString*) idStr;
//@end

//@interface NSNumber (fk)
//- (NSNumber*) add:(double) num2;
//@end

//@interface myClass : NSObject
//- (void) info;
//@end

//@interface FKCar : NSObject
//@property (nonatomic, copy) NSString* brand;
//@property (nonatomic, copy) NSString* model;
//- (NSString*) description;
//@end
//
//@interface FKCar ()
//@property (nonatomic, copy) NSString* color;
//- (void) drive:(NSString*) name;
//@end

//@interface NSObject (Eatable)
//- (void) taste;
//@end
//
//@interface FKApple : NSObject
//@end
//
//@protocol FKOutput
//- (void) output;
//- (void) addData:(NSString*) msg;
//@end
//
//@protocol FKProductable
//- (NSDate*) getProduceTime;
//@end
//
//@protocol FKPrintable <FKOutput, FKProductable>
//- (NSString*) printColor;
//@end
//
//@interface FKPrinter : NSObject <FKPrintable>
//@end

//@interface FKApple : NSObject
//@property (nonatomic, copy) NSString* color;
//@property (nonatomic, assign) double weight;
//- (id) initWithColor:(NSString*) color andWeight:(double) weight;
//@end

//@interface Brid : NSObject
//@property (nonatomic, assign) NSString* kind;
//@property (nonatomic, assign) int age;
//- (id) initWithKind:(NSString*) kind andAge:(int) age;
//@end

//@interface NSNumber (fk)
//- (NSNumber*) add:(double) num2;
//- (NSNumber*) substract:(double) num2;
//- (NSNumber*) multipy:(double) num2;
//- (NSNumber*) divide:(double) num2;
//@end

//@interface FKCar : NSObject
//@property (nonatomic, assign) double price;
//- (void) info;
//@end

//@interface FKCar : NSObject
//@property (nonatomic, copy) NSString* brand;
//@property (nonatomic, copy) NSString* model;
//- (void) drive;
//@end
//
//@interface FKCar ()
//@property (nonatomic, copy) NSString* color;
//- (void) drive:(NSString*) name;
//@end


//@interface NSObject (Eatable)
//- (void) taste;
//@end
//
//@interface FKApple : NSObject
//@end

//@protocol myProtocol <NSObject>
//
//- (void) info;
//
//@end
//
//@protocol protocolAg <NSObject>
//
//- (void) text;
//
//@end
//
//@interface fatherClass : NSObject
//
//- (void) info;
//- (void) model;
//
//@end
//
//@interface sonClass : fatherClass <myProtocol>
//@end

//@protocol cleanTemple <NSObject>
//- (void) cleanTemple;
//@end
//
//@interface elder : NSObject
//// 委托对象
//@property (nonatomic, assign) id<cleanTemple> delegate;
//// 委托对象实现协议方法
//- (void) cleanDelegate;
//@end
//
//// 遵守打扫寺庙的协议
//@interface disciplen : NSObject <cleanTemple>
//@end

//@protocol myProtocal <NSObject>
//- (void) info;
//@end
//
//@interface myClass : NSObject <myProtocal>
//- (void) info;
//- (void) infoIn;
//@end

//@interface myClass : NSObject
//@property int count;
//- (void) info:(NSTimer*) timer;
//- (void) t;
//@end


NS_ASSUME_NONNULL_END
