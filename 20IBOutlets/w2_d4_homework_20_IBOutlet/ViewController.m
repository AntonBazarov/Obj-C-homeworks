//
//  ViewController.m
//  w2_d4_homework_20_IBOutlet
//
//  Created by Predki on 01.06.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(strong, nonatomic) NSDictionary* dictionaryWithCheckers;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionary];
    
    for (int i = 0; i < [self.checkers count]; i++){
        [dictionary setObject:self.checkers[i] forKey:@(i)];
        
    }
    self.dictionaryWithCheckers = dictionary;
    
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [UIView animateWithDuration:0.7f animations:^{
        for (int i = 0; i < [self.checkers count]; i++) {
            [self shuffleCheckers:(UIView*)self.checkers[i]];
        }
    }];
    
}

-(void)shuffleCheckers:(UIView*) checker {
    NSInteger i = 0;
    while (self.dictionaryWithCheckers[@(i)] != nil) {
        i = arc4random() % 32;
    }
    checker.frame = [self checker:i];
    NSMutableDictionary *cells = [self.dictionaryWithCheckers mutableCopy];
    __block id oldKey = nil;
    [cells enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isEqual:checker]) {
            oldKey = key;
        }
    }];
    cells[@(i)] = checker;
    cells[oldKey] = nil;
    
    self.dictionaryWithCheckers = cells;
    
    
    
}
- (CGRect) checker:(NSInteger) index {
    UIView* view = (UIView*)self.darkCell[index];
    CGFloat indent = 10;
    CGFloat x = view.frame.origin.x + indent;
    CGFloat y = view.frame.origin.y + indent;
    CGFloat width = view.frame.size.width - (2*indent);
    CGRect frameChecker  = CGRectMake(x, y, width, width);
    return frameChecker;
    
}


- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
