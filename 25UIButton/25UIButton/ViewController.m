//
//  ViewController.m
//  25UIButton
//
//  Created by Predki on 07.06.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "ViewController.h"
#import "ABZMathOperations.h"

@interface ViewController ()

@property(assign, nonatomic) BOOL userIsInTheMiddleOfTyping;
@property(strong, nonatomic) ABZMathOperations *operation;
@property(strong, nonatomic) NSString *operand1;
@property(strong, nonatomic) NSString *operand2;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userIsInTheMiddleOfTyping = NO;
    self.operation = [ABZMathOperations new];
    for (UIButton *button in self.numbersCollection) {
        
        [button addTarget:self action:@selector(increaseFontSize:) forControlEvents:UIControlEventTouchDown];
        [button addTarget:self action:@selector(decreaseFontSize:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    for (UIButton *button in self.mathOperationsCollection) {
        [button addTarget:self
                   action:@selector(mathOperationButtonIsPressed:)
         forControlEvents:UIControlEventTouchDown];
        
    }
    
    [self.equallyButton addTarget:self
                           action:@selector(equallyButtonPressed:)
                 forControlEvents:UIControlEventTouchDown];
    

    
        /*
         Создать класс "Математические операции"
          1. Создать проперти для 1 и 2 числа
         1.а) Сохранить число 1 после нажатия кнопки мат операции
         2. После сохранения (1 и 2)числа переводить формат из строки в число
         3. Создать список для всех операций с числами
         
         3.а) создать методы для все выполняемых математических операций , которые принимают два числа , и возвращают результат (число)
         4. Создать метод, который по нажатию кнопки (=) будет выполнять одну из выбранных операций
         5. Установить результат в первое число
         
         */
    
}
#pragma mark - Font size

-(void)increaseFontSize:(UIButton *) button {
    
    NSString *buttonTitle = [NSString stringWithFormat:@"%@", button.currentTitle];
    NSDictionary *attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:60.f]};
    NSAttributedString *attributeString = [[NSAttributedString alloc] initWithString:buttonTitle attributes:attributes];
    [button setAttributedTitle:attributeString forState:UIControlStateHighlighted];
  
}

-(void)decreaseFontSize:(UIButton *) button {
    
    NSString *buttonTitle = [NSString stringWithFormat:@"%@", button.currentTitle];
    NSDictionary *attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:43.f]};
    NSAttributedString *attributeString = [[NSAttributedString alloc] initWithString:buttonTitle attributes:attributes];
    [button setAttributedTitle:attributeString forState:UIControlStateNormal];
    
}

#pragma mark - Math operations

-(void)mathOperationButtonIsPressed:(UIButton *) button {
    if ([button.currentTitle isEqualToString:@"+"]) {
        self.operation.mathOperation = ABZMathOperationAddition;
        self.operand1 = self.resultLabel.text;
        self.resultLabel.text = @"";
        self.operand2 = self.resultLabel.text;
    } else if ([button.currentTitle isEqualToString:@"-"]) {
        self.operation.mathOperation = ABZMathOperationSubtraction;
        self.operand1 = self.resultLabel.text;
        self.resultLabel.text = @"";
    } else if ([button.currentTitle isEqualToString:@"×"]) {
        self.operation.mathOperation = ABZMathOperationMultiplication;
        self.operand1 = self.resultLabel.text;
        self.resultLabel.text = @"";
    } else if ([button.currentTitle isEqualToString:@"÷"]) {
        self.operation.mathOperation = ABZMathOperationDivision;
        self.operand1 = self.resultLabel.text;
        self.resultLabel.text = @"";
    }

}

-(void)equallyButtonPressed:(UIButton *) button {
    
    if (self.operation.mathOperation == ABZMathOperationAddition) {
        self.operand2 = self.resultLabel.text;
        self.resultLabel.text = [self.operation additionOperandFirst:self.operand1
                                                      withOperandTwo:self.operand2];
        
    } else if (self.operation.mathOperation == ABZMathOperationSubtraction) {
        self.operand2 = self.resultLabel.text;
        self.resultLabel.text = [self.operation subtractionOperandFirst:self.operand1
                                                         fromOperandTwo:self.operand2];
    } else if (self.operation.mathOperation == ABZMathOperationMultiplication) {
        self.operand2 = self.resultLabel.text;
        self.resultLabel.text = [self.operation multiplicationOperandFirst:self.operand1
                                                              byOperandTwo:self.operand2];
    } else if (self.operation.mathOperation == ABZMathOperationDivision) {
        self.operand2 = self.resultLabel.text;
        self.resultLabel.text = [self.operation divisionOperandFirst:self.operand1
                                                        byOperandTwo:self.operand2];
    } 
}

#pragma mark - Actions

- (IBAction)pushButtonAction:(UIButton *)sender {
    NSString *number = sender.currentTitle;
    NSString *currentTitle = self.resultLabel.text;
    if (self.userIsInTheMiddleOfTyping) {
        self.resultLabel.text = [currentTitle stringByAppendingString:number];
    } else {
        self.resultLabel.text = number;
        
    }
    self.userIsInTheMiddleOfTyping = YES;
}

- (IBAction)clearAction:(UIButton *)sender {
    self.resultLabel.text = @"";
}

- (IBAction)fractionaryNumberAction:(UIButton *)sender {
}

- (IBAction)mathOperationAction:(UIButton *)sender {
    
}
    
@end
