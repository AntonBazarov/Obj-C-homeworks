//
//  AppDelegate.m
//  day6_homework_16_NSDate
//
//  Created by Predki on 26.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"

@interface AppDelegate ()
@property (strong, nonatomic) NSDate* date;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSDateFormatter* dateOfBirthFormatter = [[NSDateFormatter alloc] init];
    [dateOfBirthFormatter setDateFormat:@"d MMM YYYY"];
    NSMutableArray* students = [NSMutableArray array];
    
//    for (int i = 0; i < 31; i++) {
//        Student* anyStudent = [[Student alloc] init];
//        [students addObject:anyStudent];
//    }
    
//    for (Student* student in students) {
//        NSLog(@"%@ %@ - %@", student.name, student.lastName, [dateOfBirthFormatter stringFromDate:student.dateOfBirth]);
//    }
//
    
    for (int i = 0; i < 10; i++) {
        Student* anyStudent = [[Student alloc] init];
        [students addObject:anyStudent];
    }

    NSArray* sortedStudents = [NSArray array];
    sortedStudents = [students sortedArrayUsingComparator:^NSComparisonResult(Student* _Nonnull student1, Student* _Nonnull student2) {
        return [student1.dateOfBirth compare:student2.dateOfBirth];
    }];
    
    for (Student* student in sortedStudents) {
        NSLog(@"%@ %@ - %@", student.name, student.lastName, [dateOfBirthFormatter stringFromDate:student.dateOfBirth]);
    }
    
    // Master
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth |
                                    NSCalendarUnitWeekOfMonth | NSCalendarUnitDay
                                               fromDate:[[sortedStudents firstObject] dateOfBirth]
                                                 toDate:[[sortedStudents lastObject] dateOfBirth]
                                                options:0];
    NSLog(@"Between yongest and oldest student:\n%ld - year \n%ld - Month\n%ld - Week\n%ld - day", (long)[components year], (long)[components month], (long)[components weekOfMonth], (long)[components day]);
    
    
    
//    self.date = [NSDate date];
//    [NSTimer scheduledTimerWithTimeInterval:0.5f
//                                     target:self
//                                   selector:@selector(timerOfBirth:)
//                                   userInfo:students
//                                    repeats:YES];
    // Master Superman
    NSDateComponents* componentsYear = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger year = [componentsYear year];
    
    [self printWorkDays:year];
    [self printSundays:year];
    [self printDayOfWeeksByYear:year];
    
    

    return YES;
}

-(void) printDayOfWeeksByYear:(NSInteger) year {
    NSDateFormatter* setFormatter = [[NSDateFormatter alloc] init];
    [setFormatter setDateFormat:@"yyyy/MM/d"];
    
    NSDateFormatter* printFirstDay = [[NSDateFormatter alloc] init];
    [printFirstDay setDateFormat:@"d.MM EEEE"];
    
    for (int month = 1; month < 13; month++) {
        NSString* stringYear = [NSString stringWithFormat:@"%ld/%d/%d", (long)year, month, 1];
        NSDate* date = [setFormatter dateFromString:stringYear];
        NSLog(@"%@", [printFirstDay stringFromDate:(date)]);
    }
}

- (void) printSundays:(NSInteger) year {
    NSDateFormatter* setFormatter = [[NSDateFormatter alloc] init];
    [setFormatter setDateFormat:@"yyyy/MM/d"];
    
    NSDateFormatter* setFormatterSunday = [[NSDateFormatter alloc] init];
    [setFormatterSunday setDateFormat:@"EEEE"];
    
    NSDateFormatter* printSunday = [[NSDateFormatter alloc] init];
    [printSunday setDateFormat:@"d MMMM"];
    
    NSString* currentYear = [NSString stringWithFormat:@"%ld/%d/%d", (long)year, 1, 1];
    NSDate* date = [setFormatter dateFromString:currentYear];
    currentYear = [NSString stringWithFormat:@"%ld/%d/%d", (long)year + 1, 1, 1];
    NSDate* dateNextYear = [setFormatter dateFromString:currentYear];
    
    NSLog(@"Sundays:");
    
    while ([date compare:dateNextYear] < 0) {
        if ([[setFormatterSunday stringFromDate:date] isEqualToString:@"Sunday"]) {
            NSLog(@"%@", [printSunday stringFromDate:date]);
        }
        date = [date dateByAddingTimeInterval:60*60*24];
    }
}

- (void) printWorkDays:(NSInteger) year {
    NSDateFormatter* setFormatter = [[NSDateFormatter alloc] init];
    [setFormatter setDateFormat:@"yyyy/MM/d"];
    
    NSDateFormatter* setFormatterSunday = [[NSDateFormatter alloc] init];
    [setFormatterSunday setDateFormat:@"EEEE"];
    
    NSString* currentYear = [NSString stringWithFormat:@"%ld/%d/%d", (long)year, 1, 1];
    NSDate* date = [setFormatter dateFromString:currentYear];
    currentYear = [NSString stringWithFormat:@"%ld/%d/%d", (long)year + 1, 1, 1];
    NSDate* dateNextYear = [setFormatter dateFromString:currentYear];
    
    NSLog(@"Work days:");
    int countWorkDays = 0;
    
    while ([date compare:dateNextYear] < 0) {
        if (![[setFormatterSunday stringFromDate:date] isEqualToString:@"Sunday"] && ![[setFormatterSunday stringFromDate:date] isEqualToString:@"Saturday"]) {
            countWorkDays++;
        }
        date = [date dateByAddingTimeInterval:60*60*24];
    }
    NSLog(@"%d", countWorkDays);
}

 
-(void) timerOfBirth:(NSTimer*) timer {
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"d MMM YYYY"];
    
    self.date = [self.date dateByAddingTimeInterval:60*60*24];
    NSMutableString* dateString = [NSMutableString stringWithFormat:@"%@", [dateFormatter stringFromDate:self.date]];
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* dateComponents = [calendar components:NSCalendarUnitDay | NSCalendarUnitMonth fromDate:self.date];
    
    BOOL addStudent = NO;
    for (Student* anyStudent in timer.userInfo) {
        NSDateComponents* dateOfBirthComponents = [calendar components:NSCalendarUnitDay | NSCalendarUnitMonth fromDate:anyStudent.dateOfBirth]
        ;
        
        if([dateComponents isEqual:dateOfBirthComponents] && !addStudent) {
            [dateString appendFormat:@" - Happy Birthday! %@ %@", anyStudent.name, anyStudent.lastName];
            addStudent = YES;
        } else if ([dateComponents isEqual:dateOfBirthComponents] && addStudent) {
            [dateString appendFormat:@" Happy Birthday! %@ %@", anyStudent.name, anyStudent.lastName];
        }
    }
    NSLog(@"%@",dateString);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
