//
//  ViewController.m
//  Effective Objective
//
//  Created by 孙旭东 on 2023/1/8.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface NSString (EOCMyAdditions)
- (NSString*)eoc_myLowercaseString;
@end

@implementation NSString (EOCMyAdditions)

- (NSString*)eoc_myLowercaseString {
    NSString *lowercase = [self eoc_myLowercaseString];
    NSLog(@"%@ => %@", self, lowercase);
    return lowercase;
}

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    EOCPerson* aPerson = [[EOCPerson alloc] init];
    
//    aPerson.firstName = @"Bob"; //Same as:
//    [aPerson setFirstName:@"Bob"];
////
////    NSString* lastName = aPerson.lastName; // Same as:
//    NSString* lastName = [aPerson lastName];
    
//    [aPerson first];
    
//    EOCSmithPerson* aPerson = [[EOCSmithPerson alloc] init];
//
//    aPerson.firstName = @"Smith";
    
//    NSString* foo = @"Badger 123";
//    NSString* bar = [NSString stringWithFormat:@"Badger %i", 123];
//    BOOL equalA = (foo == bar); // < equalA = NO
//    BOOL equalB = [foo isEqual:bar]; // < equalB = YES
//    BOOL equalC = [foo isEqualToString:bar]; // < equalC = YES
    
//    NSMutableSet* set = [NSMutableSet set];
//
//    NSMutableArray* arrayA = [@[@1, @2] mutableCopy];
//    [set addObject:arrayA];
//    NSLog(@"set = %@", set);
//    // Output : set = {((1, 2))}
//
//    NSMutableArray* arrayB = [@[@1, @2] mutableCopy];
//    [set addObject:arrayB];
//    NSLog(@"set = %@", set);
//    // Output : set = {((1, 2))}
//
//    NSMutableArray* arrayC = [@[@1] mutableCopy];
//    [set addObject:arrayC];
//    NSLog(@"set = %@", set);
//    // Output : set = {((1), (1, 2))}
//
//    [arrayC addObject:@2];
//    NSLog(@"set = %@", set);
//    // Output : set = {((1, 2), (1, 2))}
    
    Method originalMethod = class_getInstanceMethod([NSString class], @selector(lowercaseString));
    
    Method swqppedMethod = class_getInstanceMethod([NSString class], @selector(eoc_myLowercaseString));
    
    method_exchangeImplementations(originalMethod, swqppedMethod);
    
    NSString* string = @"StrIng";
    NSString* lowercaseString = [string lowercaseString];
}


@end


@implementation EOCPerson

//- (void) first {
//    NSMutableString* name = [NSMutableString stringWithFormat:@"hello"];
//    self.firstName = name;
//
//    NSLog(@"%d", _firstName == name);
//}

- (void) setFirstName:(NSString *)firstName {
    self.firstName = firstName;
}

- (BOOL)isEqualToPerson:(EOCPerson *)otherPerson {
    if (self == otherPerson) return YES;
    
    if (![_firstName isEqualToString:otherPerson.firstName]) return NO;
    if (![_lastName isEqualToString:otherPerson.lastName]) return NO;
    if (_age != otherPerson.age) return NO;
    
    return YES;
}

- (BOOL)isEqual:(id)object {
    if ([self class] == [object class]) {
        return [self isEqualToPerson:(EOCPerson*)object];
    } else {
        return [super isEqual:object];
    }
}

//- (NSUInteger)hash {
//    NSString* stringToHash = [NSString stringWithFormat:@"%@:%@:%lu", _firstName, _lastName, _age];
//
//    return [stringToHash hash];
//}

- (NSUInteger)hash {
    NSUInteger firstNameHash = [_firstName hash];
    NSUInteger lastNameHash = [_lastName hash];
    NSUInteger ageHash = _age;
    return firstNameHash ^ lastNameHash ^ ageHash;
}

@end

@implementation EOCSmithPerson

- (void) setFirstName:(NSString *)firstName {
    if (![firstName isEqualToString:@"Smith"]) {
        NSLog(@"llllll");
    }
    self.firstName = firstName;
}

@end
