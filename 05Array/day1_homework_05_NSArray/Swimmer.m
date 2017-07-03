//
//  Swimmer.m
//  day1_homework_05_NSArray
//
//  Created by Predki on 21.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "Swimmer.h"

@implementation Swimmer


-(void) movement {
    NSLog(@"The movement swimmer!");
}

#pragma mark - Swimmers protocol

-(void) iCanSwim {
    NSLog(@"I Can swim!))");

}

-(void) swimButterfly {
    NSLog(@"I can swim a batterfly!");
}

#pragma mark - Jumpers protocol

-(void) jump {
    NSLog(@"Jump VASYA Jump!");
}

-(void) thereAreAchievements {
    NSLog(@"Я КМС по прыжкам в воду. Хуй знает как это по-английски");
}

-(void) sayHelloSwimmers {
    NSLog(@"Hi My name is %@ ", self.name);
}

-(void) sayHelloJumpers {
    NSLog(@"Hi My name is %@ ", self.name);
}

@end
