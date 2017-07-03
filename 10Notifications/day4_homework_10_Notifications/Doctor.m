//
//  Doctor.m
//  day4_homework_10_Notifications
//
//  Created by Predki on 24.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "Doctor.h"

#import "Government.h"

@implementation Doctor

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                         selector:@selector(salaryChangedNotification:)
                                             name:GovernmentSalaryDidChangeNotification
                                           object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(averagePriceChangedNotification:)
                                                     name:GovernmentAveragePriceDidChangeNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationDidEnterBackgroundNotification:)
                                                     name:UIApplicationDidEnterBackgroundNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationWillEnterForegroundNotification:)
                                                     name:UIApplicationWillEnterForegroundNotification
                                                   object:nil];
        
        
    }
    return self;
}

-(void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notification

 - (void) salaryChangedNotification:(NSNotification*) notification {
 
    NSNumber* value = [notification.userInfo objectForKey:GovernmentSalaryUserInfoKey];
    CGFloat salary = [value floatValue];
     _increaseSalary = (salary / (self.salary / 100)) - 100;
     if (_increaseSalary < 0 ) {
         NSLog(@"Doctor say: Hmm.. Where's the vodka?");
     } else if (_increaseSalary > 0 ){
         NSLog(@"Doctor say: Finally! I will buy a car.");
     } else {
         NSLog(@"Doctor say: Сlearly understood... Government");
     }
     self.salary = salary;
}

-(void) averagePriceChangedNotification:(NSNotification* ) notification {
    
    NSNumber* value = [notification.userInfo objectForKey:GovernmentAveragePriceUserInfoKey];
    CGFloat averagePrice = [value floatValue];
    _iflation = (averagePrice / (self.averagePrice / 100)) - 100;
    if (_iflation < 0 && _increaseSalary > 0) {
        NSLog(@"Doctor say: It is logical..");
    } else if (_iflation > 0 && _increaseSalary < 0) {
        NSLog(@"Doctor say: Raised average price. Reduced pension .It's bad!");
    }  else {
        NSLog(@"Doctor say: Why?");
    }
    self.averagePrice = averagePrice;
}

#pragma mark - UIApplication

-(void) applicationDidEnterBackgroundNotification:(UIApplication* ) application {
    NSLog(@"Doc say: good night");
}

-(void) applicationWillEnterForegroundNotification:(UIApplication* ) application {
    NSLog(@"Doc say: good morning!");
}

@end
