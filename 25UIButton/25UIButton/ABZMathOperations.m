//
//  ABZMathOperations.m
//  25UIButton
//
//  Created by Predki on 07.06.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "ABZMathOperations.h"

@implementation ABZMathOperations


-(NSString *)additionOperandFirst:(NSString *) operand1 withOperandTwo:(NSString *) operand2 {
    CGFloat op1 = [operand1 floatValue];
    CGFloat op2 = [operand2 floatValue];
    CGFloat result = op1 + op2;
    NSString *resultString = [NSString stringWithFormat:@"%1.5f", result];
    return resultString;
}

-(NSString *)multiplicationOperandFirst:(NSString *) operand1 byOperandTwo:(NSString *) operand2 {
    CGFloat op1 = [operand1 floatValue];
    CGFloat op2 = [operand2 floatValue];
    CGFloat result = op1 * op2;
    NSString *resultString = [NSString stringWithFormat:@"%1.5f", result];
    return resultString;
    
}

-(NSString *)subtractionOperandFirst:(NSString *) operand1 fromOperandTwo:(NSString *) operand2 {
    CGFloat op1 = [operand1 floatValue];
    CGFloat op2 = [operand2 floatValue];
    CGFloat result = op1 - op2;
    NSString *resultString = [NSString stringWithFormat:@"%1.5f", result];
    return resultString;
    
}
-(NSString *)divisionOperandFirst:(NSString *) operand1 byOperandTwo:(NSString *) operand2 {
    CGFloat op1 = [operand1 floatValue];
    CGFloat op2 = [operand2 floatValue];
    CGFloat result = op1 / op2;
    NSString *resultString = [NSString stringWithFormat:@"%1.5f", result];
    return resultString;
}

@end
