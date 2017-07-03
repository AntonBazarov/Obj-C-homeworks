//
//  Student.m
//  day5_homework_13_Threads
//
//  Created by Predki on 25.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "Student.h"
#import <UIKit/UIKit.h>


@implementation Student


-(void) guessNumber:(NSUInteger) requiredNumber range:(NSUInteger) range block:(void(^)(void)) block {
    dispatch_async([Student initQueue], ^{
            int randomNumber = arc4random() % range;
            double startTime = CACurrentMediaTime();
        NSLog(@"The student %@ began to guess", self.name);
        while (requiredNumber != randomNumber) {
            //NSLog(@"Student %@ did not guess a number: %d", self.name, randomNumber);
            randomNumber = arc4random() % range;
        }
        NSLog(@"Student %@ guess a number: %d", self.name, randomNumber);
        self.finishTime = CACurrentMediaTime() - startTime;
        block();
       
    });
}

+ (dispatch_queue_t) initQueue {
    static dispatch_queue_t queue;
    static dispatch_once_t onceTask;
    dispatch_once(&onceTask, ^{
        queue = dispatch_queue_create("com.bazar.jr", DISPATCH_QUEUE_CONCURRENT);
        
    });
    
    return queue;
    
}
@end
