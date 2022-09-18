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

@interface NSNumber (fk)
- (NSInteger) addNumber:(NSNumber*) num;
@end
NS_ASSUME_NONNULL_END
