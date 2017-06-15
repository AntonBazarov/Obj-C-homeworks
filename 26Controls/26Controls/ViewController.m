//
//  ViewController.m
//  26Controls
//
//  Created by Predki on 15.06.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

typedef enum{
    YearOfIssue1902,
    YearOfIssue1909,
    YearOfIssue1916
}YearOfIssue;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setPictureInView];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setPictureInView {
    UIImage *logo1 = [UIImage imageNamed:@"mercedesLogo1"];
    UIImage *logo2 = [UIImage imageNamed:@"mercedesLogo2"];
    UIImage *logo3 = [UIImage imageNamed:@"mercedesLogo3"];
    
    self.testImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.testImageView.backgroundColor = [UIColor clearColor];
    
    if (self.yearIssueControl.selectedSegmentIndex == YearOfIssue1902) {
        self.testImageView.image = logo1;
    } else if (self.yearIssueControl.selectedSegmentIndex == YearOfIssue1909) {
        self.testImageView.image = logo2;
    } else {
        self.testImageView.image = logo3;
    }
}

#pragma mark - Actions

- (IBAction)actionChangedScale:(UISwitch *)sender {
    if (self.scaleSwitch.enabled == sender.isOn) {
        CABasicAnimation *scaleChangeAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleChangeAnimation.duration = 1.2f;
        scaleChangeAnimation.repeatCount = HUGE_VALF;
        scaleChangeAnimation.autoreverses = YES;
        scaleChangeAnimation.fromValue = [NSNumber numberWithFloat:1.0f];
        scaleChangeAnimation.toValue = [NSNumber numberWithFloat:1.7f];
        [self.testImageView.layer addAnimation:scaleChangeAnimation forKey:@"scaleChangeAnimation"];
    } else {
        [self.testImageView.layer removeAnimationForKey:@"scaleChangeAnimation"];
    }
}
- (IBAction)actionChangedRotation:(UISwitch *)sender {
    if (self.rotationSwitch.enabled == sender.isOn) {
        CABasicAnimation *rotationChangeAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        rotationChangeAnimation.duration = 1.2f;
        rotationChangeAnimation.repeatCount = HUGE_VALF;
        rotationChangeAnimation.autoreverses = YES;
        rotationChangeAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
        rotationChangeAnimation.toValue = [NSNumber numberWithFloat:6.28f];
        [self.testImageView.layer addAnimation:rotationChangeAnimation forKey:@"rotationChangeAnimation"];
    } else {
        [self.testImageView.layer removeAnimationForKey:@"rotationChangeAnimation"];
    }
    
}
- (IBAction)actionChangedTranslation:(UISwitch *)sender {
    if (self.rotationSwitch.enabled == sender.isOn) {
        CABasicAnimation *translationChangeAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation"];
        translationChangeAnimation.duration = 1.2f;
        translationChangeAnimation.repeatCount = HUGE_VALF;
        translationChangeAnimation.autoreverses = YES;
        translationChangeAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
        translationChangeAnimation.toValue = [NSNumber numberWithFloat:100.0f];
        [self.testImageView.layer addAnimation:translationChangeAnimation forKey:@"translationChangeAnimation"];
    } else {
        [self.testImageView.layer removeAnimationForKey:@"translationChangeAnimation"];
    }
}

- (IBAction)actionChangedDuration:(UISlider *)sender {
    CGFloat value = sender.value;
    self.testImageView.layer.timeOffset = [self.testImageView.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    self.testImageView.layer.beginTime = CACurrentMediaTime();
    self.testImageView.layer.speed = value;

}

- (IBAction)actionSwitchSegmented:(UISegmentedControl *)sender {
    [self setPictureInView];
    
}
@end
