//
//  ViewController.h
//  26Controls
//
//  Created by Predki on 15.06.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *testImageView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *yearIssueControl;
@property (weak, nonatomic) IBOutlet UISwitch *scaleSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *rotationSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *translationSwitch;
@property (weak, nonatomic) IBOutlet UISlider *duration;

- (IBAction)actionChangedScale:(UISwitch *)sender;
- (IBAction)actionChangedRotation:(UISwitch *)sender;
- (IBAction)actionChangedTranslation:(UISwitch *)sender;
- (IBAction)actionChangedDuration:(UISlider *)sender;
- (IBAction)actionSwitchSegmented:(UISegmentedControl *)sender;


@end

