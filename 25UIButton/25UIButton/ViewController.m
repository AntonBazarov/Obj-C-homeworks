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




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userIsInTheMiddleOfTyping = NO;
    self.operation = [ABZMathOperations new];
    self.operation.mathOperation = ABZMathOperationNone;
    for (UIButton *button in self.numbersCollection) {
        
        [button addTarget:self action:@selector(increaseFontSize:) forControlEvents:UIControlEventTouchDown];
        [button addTarget:self action:@selector(decreaseFontSize:) forControlEvents:UIControlEventTouchUpInside];
    }
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

#pragma mark - Actions

- (IBAction)pushButtonAction:(UIButton *)sender {
    NSString *number = sender.currentTitle;
    NSString *currentTitle = self.resultLabel.text;
    if (self.userIsInTheMiddleOfTyping) {
        if (currentTitle.length == 1 && [currentTitle isEqualToString:@"0"]) {
            self.resultLabel.text = number;
        } else {
            self.resultLabel.text = [currentTitle stringByAppendingString:number];
        }
    } else {
        self.resultLabel.text = number;
        
    }
    self.userIsInTheMiddleOfTyping = YES;
}

- (IBAction)clearAction:(UIButton *)sender {
    self.operation.operand1 = @"";
    self.operation.operand2 = @"";
    self.resultLabel.text = @"";
}

- (IBAction)fractionaryNumberAction:(UIButton *)sender {
    NSString *number = sender.currentTitle;
    NSString *currentTitle = self.resultLabel.text;
    if(![currentTitle isEqualToString:@""] && [self symbolIsFoundInString:self.resultLabel.text symbol:@"."] == NO) {
        self.resultLabel.text = [currentTitle stringByAppendingString:number];
    }
}

- (IBAction)mathOperationAction:(UIButton *)sender {
    if ([sender.currentTitle isEqualToString:@"+"]) {
        self.operation.mathOperation = ABZMathOperationAddition;
        self.operation.operand1 = self.resultLabel.text;
        self.resultLabel.text = @"";
    } else if ([sender.currentTitle isEqualToString:@"−"]) {
        self.operation.mathOperation = ABZMathOperationSubtraction;
        self.operation.operand1 = self.resultLabel.text;
        self.resultLabel.text = @"";
    } else if ([sender.currentTitle isEqualToString:@"×"]) {
        self.operation.mathOperation = ABZMathOperationMultiplication;
        self.operation.operand1 = self.resultLabel.text;
        self.resultLabel.text = @"";
    } else if ([sender.currentTitle isEqualToString:@"÷"]) {
        self.operation.mathOperation = ABZMathOperationDivision;
        self.operation.operand1 = self.resultLabel.text;
        self.resultLabel.text = @"";
    } else if ([sender.currentTitle isEqualToString:@"="]) {
            self.operation.operand2 = self.resultLabel.text;
        if (self.operation.mathOperation != ABZMathOperationNone && ![self.operation.operand2 isEqualToString:@""]) {
           [self setInLabelResulOperation];
            self.operation.mathOperation = ABZMathOperationNone;
        } else if (self.operation.mathOperation != ABZMathOperationNone && [self.operation.operand2 isEqualToString:@""]) {
            self.operation.operand2 = self.operation.operand1;
            [self setInLabelResulOperation];
            self.operation.mathOperation = ABZMathOperationNone;
        }
         self.resultLabel.text = self.operation.operand1;
    }
   
}


-(BOOL)symbolIsFoundInString:(NSString *) string symbol:(NSString *) symbol{
    NSRange range = [string rangeOfString:symbol];
    if (range.location != NSNotFound) {
        return YES;
    }
    return NO;
}
-(void)setInLabelResulOperation {
    self.resultLabel.text = [self.operation
                             performOperationOperandFirst:self.operation.operand1
                             withOperandSecond:self.operation.operand2
                             operation:self.operation.mathOperation];
}
@end

