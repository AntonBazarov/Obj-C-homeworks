//
//  Businessman.m
//  day4_homework_10_Notifications
//
//  Created by Predki on 24.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "Businessman.h"
#import "Government.h"


@implementation Businessman

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(taxLevelChangedNotification:)
                                                     name:GovernmentTaxLevelDidChangeNotification
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

-(void) taxLevelChangedNotification:(NSNotification*) notification {
    NSNumber* value = [notification.userInfo objectForKey:GovernmentTaxLevelUserInfoKey];
    CGFloat taxLevel = [value floatValue];
    _increaseTaxLevel = (taxLevel / (self.taxLevel / 100)) - 100;
    if (_increaseTaxLevel < 0 ) {
        NSLog(@"Businessman say: Reduced tax level... It's bad!");
    } else if (_increaseTaxLevel > 0){
        NSLog(@"Businessman say: Raised tax level? Great!");
    } else {
        NSLog(@"Businessman say: Сlearly understood... Government");
    }
    self.taxLevel = taxLevel;
}

-(void) averagePriceChangedNotification:(NSNotification* ) notification {
    NSNumber* value = [notification.userInfo objectForKey:GovernmentAveragePriceUserInfoKey];
    CGFloat averagePrice = [value floatValue];
    _iflation = (averagePrice / (self.averagePrice / 100)) - 100;
    if (_iflation < 0 && _increaseTaxLevel > 0) {
        NSLog(@"Businessman say: Yeah! Like this!");
    } else if (_iflation > 0 && _increaseTaxLevel < 0) {
        NSLog(@"Businessman say: Really Nigga?");
    } else {
        NSLog(@"Businessman say: Why?");
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
