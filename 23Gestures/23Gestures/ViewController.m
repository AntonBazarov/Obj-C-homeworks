//
//  ViewController.m
//  23Gestures
//
//  Created by Predki on 05.06.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>
@property(weak, nonatomic) UIImageView *imageView;
@property(assign, nonatomic) CGFloat imageViewScale;
@property(assign, nonatomic) CGFloat imageViewRotation;
@property(assign, nonatomic) CGAffineTransform newTransform;





@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createImage];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tapGesture];
    
    UISwipeGestureRecognizer *swipeRightGesture = [[UISwipeGestureRecognizer alloc]
                                                   initWithTarget:self
                                                   action:@selector(handleSwipeRight:)];
    swipeRightGesture.direction = UISwipeGestureRecognizerDirectionRight;
    swipeRightGesture.delegate = self;
    [self.view addGestureRecognizer:swipeRightGesture];
    
    UISwipeGestureRecognizer *swipeLeftGesture = [[UISwipeGestureRecognizer alloc]
                                                  initWithTarget:self
                                                  action:@selector(handleSwipeLeft:)];
    swipeLeftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    swipeLeftGesture.delegate = self;
    [self.view addGestureRecognizer:swipeLeftGesture];
 
    UITapGestureRecognizer *doubleTapDoubleTouchGesture = [[UITapGestureRecognizer alloc]
                                                initWithTarget:self
                                                action:@selector(handleDoubleTapDoubleTouch:)];
    doubleTapDoubleTouchGesture.numberOfTapsRequired = 2;
    doubleTapDoubleTouchGesture.numberOfTouchesRequired = 2;
    doubleTapDoubleTouchGesture.delegate = self;
    [self.view addGestureRecognizer:doubleTapDoubleTouchGesture];
    
    
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc]
                                                   initWithTarget:self
                                                   action:@selector(handlePinch:)];
    [self.view addGestureRecognizer:pinchGesture];
    
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc]
                                              initWithTarget:self
                                              action:@selector(handleRotation:)];
    [self.view addGestureRecognizer:rotationGesture];
    
    // (5) остановливать текущую анимацию
    

    

}
#pragma mark - Gestures

-(void)handleTap:(UITapGestureRecognizer *) tapGesture {
    CGPoint destination = [tapGesture locationInView:self.view];
    [UIView animateWithDuration:1.2f
                          delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.imageView.center = destination;
                     }
                     completion:^(BOOL finished) {
                     }];

}

-(void)handleSwipeRight:(UISwipeGestureRecognizer *) swipeRightGesture {
    
    [self animationWithAngle:(-3.14f)];
}

-(void)handleSwipeLeft:(UISwipeGestureRecognizer *) swipeRightGesture {
    [self animationWithAngle:M_PI];
    
}

-(void)handleDoubleTapDoubleTouch:(UITapGestureRecognizer *) tapGesture {
    [self.imageView.layer removeAllAnimations];
    
}

-(void)handlePinch:(UIPinchGestureRecognizer *) pinchGesture {
    if (pinchGesture.state == UIGestureRecognizerStateBegan) {
        self.imageViewScale = 1.f;
    }
    CGFloat newScale = 1.f + pinchGesture.scale - self.imageViewScale;
    CGAffineTransform currentTransform = self.imageView.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, newScale, newScale);
    
    self.imageView.transform = newTransform;
    self.imageViewScale = pinchGesture.scale;
}

-(void)handleRotation:(UIRotationGestureRecognizer *) rotationGesture {
    if (rotationGesture.state == UIGestureRecognizerStateBegan) {
        self.imageViewRotation = 0;
    }
    CGFloat angle = rotationGesture.rotation - self.imageViewRotation;
    CGAffineTransform currentTransform = self.imageView.transform;
    CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform, angle);
    
    self.imageView.transform = newTransform;
    self.imageViewRotation = rotationGesture.rotation;
    NSLog(@"rotation = %1.3f", rotationGesture.rotation);
}

#pragma mark - Methods for image

-(void)createImage {
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds) - 150 ,CGRectGetMidY(self.view.bounds) - 150, 300, 300)];
    UIImage *picture = [UIImage imageNamed:@"Mercedes"];
    image.image = picture;
    image.contentMode = UIViewContentModeScaleAspectFit;
    image.backgroundColor = [UIColor clearColor];
    [self.view addSubview:image];
    self.imageView = image;
}


-(void)animationWithAngle:(CGFloat) angle {
    CGAffineTransform currentTransform = self.imageView.transform;
    self.newTransform = CGAffineTransformRotate(currentTransform, (angle));
    [UIView animateWithDuration:2.2f
                          delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.imageView.transform = self.newTransform;
                     } completion:^(BOOL finished) {
                         self.imageView.transform = self.newTransform;
                     }];
    
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UISwipeGestureRecognizer class]]);
}
@end
