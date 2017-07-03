//
//  StudentTwo.m
//  day5_homework_13_Threads
//
//  Created by Predki on 25.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "StudentTwo.h"
#import <UIKit/UIKit.h>

@implementation StudentTwo
-(void) guessNumber:(NSUInteger) requiredNumber range:(NSUInteger) range block:(void(^)(void)) block {
    [[StudentTwo initQueue] addOperationWithBlock:^{
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
    }];

}
    
    
+ (NSOperationQueue*) initQueue {
    static NSOperationQueue* queue;
    static dispatch_once_t onceTask;
    dispatch_once(&onceTask, ^{
        queue = [[NSOperationQueue alloc]init];
        
    });
    
    return queue;
    
}
@end
