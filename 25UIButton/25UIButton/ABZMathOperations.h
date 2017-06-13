//
//  ABZMathOperations.h
//  25UIButton
//
//  Created by Predki on 07.06.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    ABZMathOperationAddition,
    ABZMathOperationMultiplication,
    ABZMathOperationSubtraction,
    ABZMathOperationDivision,
    ABZMathOperationNone,
    ABZMathOperationEqual
}ABZMathOperation;

@interface ABZMathOperations : UIView

@property(assign, nonatomic) ABZMathOperation mathOperation;
@property(strong, nonatomic) NSString *operand1;
@property(strong, nonatomic) NSString *operand2;

-(NSString *)performOperationOperandFirst:(NSString *) operand1 withOperandSecond:(NSString *) operand2 operation:(ABZMathOperation) operation;

@end

