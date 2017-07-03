//
//  Student.m
//  day6_homework_16_NSDate
//
//  Created by Predki on 26.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "Student.h"

@implementation Student
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.maxAge = 50;
        self.minAge = 16;
        self.name = [Student createName];
        self.lastName = [Student createLastName];
        self.dateOfBirth = [self createDate];
    }
    return self;
}
#pragma mark - Create random date

-(NSDate*) createDate {
    NSDate* date = [[NSDate alloc] init];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"YYYY"];
    NSInteger currentYear = [[dateFormatter stringFromDate:date] integerValue];
    
    [dateFormatter setDateFormat:@"M"];
    NSInteger currentMonth = [[dateFormatter stringFromDate:date] integerValue];
    
    [dateFormatter setDateFormat:@"d"];
    NSInteger currentDay = [[dateFormatter stringFromDate:date] integerValue];
    
    [dateFormatter setDateFormat:@"YYYY/M/d"];
    NSString* minAgeString = [NSString stringWithFormat:@"%ld %ld %ld", currentYear - self.maxAge - 1, currentMonth, currentDay + 1];
    
    NSDate* minAgeDate = [dateFormatter dateFromString:minAgeString];
    
    NSString* maxAgeString = [NSString stringWithFormat:@"%ld %ld %ld", currentYear - self.minAge , currentMonth, currentDay];
    
    NSDate* maxAgeDate = [dateFormatter dateFromString:maxAgeString];
    
    NSTimeInterval interval = [maxAgeDate timeIntervalSinceDate:minAgeDate];
    
    NSDate* randomDate = [minAgeDate dateByAddingTimeInterval:arc4random_uniform(interval)];
    return randomDate;
}


#pragma mark - Create random name and last name

+ (NSString*) createName {
    NSArray* nameArray = [[NSArray alloc] initWithObjects:@"Gena", @"Petya", @"Vasyok", @"Dimaz", @"Il'dar", @"Zheka",@"Tema", @"Seryoga", @"Vavan", @"Kalyan", nil];
    return [nameArray objectAtIndex:(arc4random() % ((long)[nameArray count] - 1))];

}

+ (NSString*) createLastName {
    NSArray* lastNameArray = [[NSArray alloc] initWithObjects:@"Vlasov", @"Petrov", @"Sidorov", @"Kozlov", @"Zaycev", @"Lisicin",@"Zhirafov", @"Slonov", @"Cosmopolitan", @"Glamur", nil];
    return [lastNameArray objectAtIndex:(arc4random() % ((long)[lastNameArray count] - 1))];
    
}

@end
