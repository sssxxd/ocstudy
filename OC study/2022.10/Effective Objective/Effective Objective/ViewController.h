//
//  ViewController.h
//  Effective Objective
//
//  Created by 孙旭东 on 2023/1/8.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@end


//@interface EOCPerson : NSObject {
//    @public
//    NSDate *_dateOfBirth;
//    NSString *_firstName;
//    NSString *_lastName;
//    @private
//    NSString *_someInternalData;
//}
//@end

@interface EOCPerson : NSObject
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, assign) NSUInteger age;
- (BOOL)isEqualToPerson:(EOCPerson*)otherPerson;
@end

//@interface EOCPerson : NSObject
//- (NSString*)firstName;
//- (void)setFirstName:(NSString*)firstName;
//- (NSString*)lastName;
//- (void)setLastName:(NSString*)lastName;
//@end

@interface EOCSmithPerson : EOCPerson
@end
