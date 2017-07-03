//
//  Dog.h
//  day1_homework_05_NSArray
//
//  Created by Predki on 21.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "Animal.h"
#import "Runners.h"
#import "Swimmers.h"

@interface Dog : Animal <Runners, Swimmers>

@property (strong, nonatomic) NSString* swim;

@property (assign,nonatomic) CGFloat speed;


@end
