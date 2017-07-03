//
//  Gamer.m
//  day1_homework_05_NSArray
//
//  Created by Predki on 21.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "Gamer.h"

@implementation Gamer

-(void) superMovement {
    [super movement];
    
}


-(void) movement {
    NSLog(@"The movement gamer!");
    
}

#pragma mark - Runners protocol

-(void) run {
    NSLog(@"Run VASYA Run!");
}

#pragma mark - Swimmers protocol

-(void) iCanSwim {
    NSLog(@"I Can swim!))");
}

#pragma mark - Jumpers protocol

-(void) jump {
    NSLog(@"Jump VASYA Jump!");
}

-(void) sayHelloRunners {
    NSLog(@"Hi My name is %@ ", self.name);
}

-(void) sayHelloSwimmers {
    NSLog(@"Hi My name is %@ ", self.name);
}

-(void) sayHelloJumpers {
    NSLog(@"Hi My name is %@ ", self.name);
}
@end
