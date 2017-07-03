//
//  Student.h
//  day6_homework_16_NSDate
//
//  Created by Predki on 26.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (strong, nonatomic) NSDate* dateOfBirth;
@property (assign, nonatomic) NSUInteger maxAge;
@property (assign, nonatomic) NSUInteger minAge;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* lastName;



@end
