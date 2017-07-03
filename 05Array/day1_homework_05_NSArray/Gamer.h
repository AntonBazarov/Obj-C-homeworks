//
//  Gamer.h
//  day1_homework_05_NSArray
//
//  Created by Predki on 21.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "Human.h"
#import "Runners.h"
#import "Jumpers.h"
#import "Swimmers.h"

@interface Gamer : Human <Swimmers, Jumpers, Runners>

@property (strong, nonatomic) NSString* game;
@property (assign, nonatomic) NSInteger age;

-(void) superMovement;

#pragma mark - Runners protocol

@property (assign,nonatomic) CGFloat speed;

#pragma mark - Jumpers protocol

@property (assign, nonatomic) CGFloat heightJump;

#pragma mark - Swimmers protocol

@property (strong, nonatomic) NSString* swim;
@end
