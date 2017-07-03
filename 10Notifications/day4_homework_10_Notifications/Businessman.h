//
//  Businessman.h
//  day4_homework_10_Notifications
//
//  Created by Predki on 24.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Businessman : NSObject
@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) CGFloat taxLevel;
@property (assign, nonatomic) CGFloat averagePrice;
@property (assign, nonatomic) CGFloat iflation;
@property (assign, nonatomic) CGFloat increaseTaxLevel;

@end
