//
//  ABZMathOperations.m
//  25UIButton
//
//  Created by Predki on 07.06.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "ABZMathOperations.h"

@implementation ABZMathOperations

-(NSString *)performOperationOperandFirst:(NSString *) operand1 withOperandSecond:(NSString *) operand2 operation:(ABZMathOperation) operation {
        CGFloat op1 = [operand1 floatValue];
        CGFloat op2 = [operand2 floatValue];
        CGFloat result = [self mathOperationWithFloatValueOne:op1 valueTwo:op2 operation:operation];
        if (result == NSNotFound) {
            self.operand1 = @"Нельзя так бро)";
        } else {
            self.operand1 = [NSString stringWithFormat:@"%1.1f", result];
        }

    return self.operand1;
}

-(BOOL)isIntegerValue:(NSString *) value {
    NSRange range = [value rangeOfString:@"."];
    if (range.location != NSNotFound) {
        return NO;
    }
    return YES;
}

-(CGFloat)mathOperationWithFloatValueOne:(CGFloat) op1 valueTwo:(CGFloat) op2 operation:(ABZMathOperation) operation  {
    CGFloat result;
    switch (operation) {
        case ABZMathOperationAddition:
            result = op1 + op2;
            break;
        case ABZMathOperationSubtraction:
            result = op1 - op2;
            break;
        case ABZMathOperationMultiplication:
            result = op1 * op2;
            break;
        case ABZMathOperationDivision:
            (op2 != 0) ? result = op1 / op2 : (result = NSNotFound);
            break;
        default:
            break;
    }
    return result;
}

@end

