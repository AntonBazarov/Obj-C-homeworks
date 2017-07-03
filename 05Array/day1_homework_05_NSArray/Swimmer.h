//
//  Swimmer.h
//  day1_homework_05_NSArray
//
//  Created by Predki on 21.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "Human.h"
#import "Jumpers.h"
#import "Swimmers.h"

@interface Swimmer : Human <Jumpers,Swimmers>

#pragma mark - Jumpers protocol

@property (assign, nonatomic) CGFloat heightJump;

#pragma mark - Swimmers protocol

@property (strong, nonatomic) NSString* swim;
@property (strong, nonatomic) NSString* swimSuit;

@end
