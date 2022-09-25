

#import <Foundation/Foundation.h>
#import "KVCObject.h"
#import "Student.h"
#import "Course.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        KVCObject* simpObject = [[KVCObject alloc] init];
//
//        [simpObject setValue:@"李四" forKey:@"name"];
//        [simpObject printProtroty];
        
        Student* student = [[Student alloc] init];
        [student setValue:@"张三" forKey:@"name"];
        NSLog(@"%@", [student valueForKey:@"name"]);
        
        Course* course = [[Course alloc] init];
        [course setValue:@"语文课" forKey:@"courseName"];
        [student setValue:course forKey:@"course"];
        NSLog(@"课程名称：%@", [course valueForKey:@"courseName"]);
        
        // 或
        [student setValue:@"数学课" forKeyPath:@"course.courseName"];
        NSLog(@"课程名称：%@", [student valueForKeyPath:@"course.courseName"]);
        
        [student setValue:@"88" forKey:@"point"];
        NSLog(@"分数：%@", [student valueForKey:@"point"]);
        
        Student* student1 = [[Student alloc] init];
        Student* student2 = [[Student alloc] init];
        Student* student3 = [[Student alloc] init];
        
        [student1 setValue:@"89" forKey:@"point"];
        [student2 setValue:@"79" forKey:@"point"];
        [student3 setValue:@"96" forKey:@"point"];
        
        NSArray* array = [NSArray arrayWithObjects:student1, student2, student3, nil];
        [student setValue:array forKey:@"otherStudents"];
        
        NSLog(@"其他学生成绩：%@", [student valueForKeyPath:@"otherStudents.point"]);
        NSLog(@"共%@个学生", [student valueForKeyPath:@"otherStudents.@count"]);
        NSLog(@"最高成绩%@", [student valueForKeyPath:@"otherStudents.@max.point"]);
        NSLog(@"最低成绩%@", [student valueForKeyPath:@"otherStudents.@min.point"]);
        NSLog(@"平均成绩%@", [student valueForKeyPath:@"otherStudents.@avg.point"]);
    }
    return 0;
}
