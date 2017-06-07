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
    ABZMathOperationDivision
}ABZMathOperation;

@interface ABZMathOperations : UIView

@property(assign, nonatomic) ABZMathOperation mathOperation;


-(NSString *)additionOperandFirst:(NSString *) operand1 withOperandTwo:(NSString *) operand2;
-(NSString *)multiplicationOperandFirst:(NSString *) operand1 byOperandTwo:(NSString *) operand2;
-(NSString *)subtractionOperandFirst:(NSString *) operand1 fromOperandTwo:(NSString *) operand2;
-(NSString *)divisionOperandFirst:(NSString *) operand1 byOperandTwo:(NSString *) operand2;



@end
/*
 План по мастеру


 
 7. Создать метод, который по нажатию кнопки (=) будет выполнять одну из выбранных операций
 8. Установить результат в первое число
*/
