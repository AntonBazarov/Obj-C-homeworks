//
//  Pensioner.m
//  day4_homework_10_Notifications
//
//  Created by Predki on 24.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "Pensioner.h"
#import "Government.h"

@implementation Pensioner

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(pensionChangedNotification:)
                                                     name:GovernmentPensionDidChangeNotification
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

-(void) pensionChangedNotification:(NSNotification* ) notification {
    NSNumber* value = [notification.userInfo objectForKey:GovernmentPensionUserInfoKey];
    CGFloat pension = [value floatValue];
    _increasePension = (pension / (self.pension / 100)) - 100;
    if (_increasePension < 0 ) {
        NSLog(@"Pensioner say: Reduced pension... It's bad!");
    } else if (_increasePension > 0){
        NSLog(@"Pensioner say: Raised pension. Great!");
    } else {
        NSLog(@"Pensioner say: Сlearly understood...");
    }
    self.pension = pension;
    
}

-(void) averagePriceChangedNotification:(NSNotification* ) notification {
    NSNumber* value = [notification.userInfo objectForKey:GovernmentAveragePriceUserInfoKey];
    CGFloat averagePrice = [value floatValue];
    _iflationPensioner = (averagePrice / (self.averagePrice / 100)) - 100;
    if (_iflationPensioner < 0 && _increasePension > 0) {
        NSLog(@"Pensioner say: It is Hohland.. Fantastic");
    } else if (_iflationPensioner > 0 && _increasePension < 0) {
        NSLog(@"Pensioner say: Raised average price. Reduced pension .It's bad!");
    }  else {
        NSLog(@"Pensioner say: Why?");
    }
    self.averagePrice = averagePrice;
    
}

#pragma mark - UIApplication

-(void) applicationDidEnterBackgroundNotification:(UIApplication* ) application {
    NSLog(@"Businessman say: good night");
}

-(void) applicationWillEnterForegroundNotification:(UIApplication* ) application {
    NSLog(@"Businessman say: good morning!");
}


@end
