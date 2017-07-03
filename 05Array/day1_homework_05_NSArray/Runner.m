//
//  Runner.m
//  day1_homework_05_NSArray
//
//  Created by Predki on 21.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "Runner.h"

@implementation Runner

-(void) movement {
    NSLog(@"The movement runner!");
}

#pragma mark - Runners protocol

-(void) run {
    NSLog(@"Run VASYA Run!");
}

-(void) doYouLike {
    NSLog(@"I like to run");
}

-(void) sayHelloRunners {
    NSLog(@"Hi My name is %@ ", self.name);
}
@end
