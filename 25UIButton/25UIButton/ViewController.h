//
//  ViewController.h
//  25UIButton
//
//  Created by Predki on 07.06.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *numbersCollection;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *mathOperationsCollection;


- (IBAction)pushButtonAction:(UIButton *)sender;
- (IBAction)clearAction:(UIButton *)sender;
- (IBAction)fractionaryNumberAction:(UIButton *)sender;
- (IBAction)mathOperationAction:(UIButton *)sender;




@end

