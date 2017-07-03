//
//  Pensioner.h
//  day4_homework_10_Notifications
//
//  Created by Predki on 24.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Pensioner : NSObject
@property (strong, nonatomic) NSString* namePensioner;
@property (assign, nonatomic) CGFloat pension;
@property (assign, nonatomic) CGFloat averagePrice;
@property (assign, nonatomic) CGFloat iflationPensioner;
@property (assign, nonatomic) CGFloat increasePension;
@end
