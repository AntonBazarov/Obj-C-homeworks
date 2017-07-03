//
//  Dog.m
//  day1_homework_05_NSArray
//
//  Created by Predki on 21.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "Dog.h"

@implementation Dog

-(void) animalMovement {
    NSLog(@"The animal movement dog!");
}

-(void) iCanSwim {
    NSLog(@"I Can swim! AND I'M DOG!");
}

-(void) run {
    NSLog(@"I can run");
}

-(void) sayHelloRunners {
    NSLog(@"Hi My name is %@ ", self.monicker);
}

-(void) sayHelloSwimmers {
    NSLog(@"Hi My name is %@ ", self.monicker);
}

@end
