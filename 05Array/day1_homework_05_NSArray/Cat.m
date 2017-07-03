//
//  Cat.m
//  day1_homework_05_NSArray
//
//  Created by Predki on 21.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "Cat.h"

@implementation Cat

-(void) animalMovement {
    NSLog(@"The animal movement cat!");
}

-(void) jump {
    NSLog(@"Vas'ka jump!");
    
}

-(void) sayHelloJumpers {
    NSLog(@"Hi My name is %@ ", self.monicker);
    
}
@end
