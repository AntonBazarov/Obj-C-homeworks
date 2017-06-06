//
//  ViewController.m
//  24Drawings
//
//  Created by Predki on 06.06.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "ViewController.h"
#import "ABZDrawStarBezier.h"


@interface ViewController ()

@end

@implementation ViewController

//Ученик
//
//Нарисуйте пятиконечную звезду :)
//Добавьте окружности на концах звезды
//Соедините окружности линиями
//Студент.
//
//Закрасте звезду любым цветом цветом оО
//При каждой перерисовке рисуйте пять таких звезд (только мелких) в рандомных точках экрана
//Мастер
//
//После того как вы попрактиковались со звездами нарисуйте что-то свое, проявите творчество :)
//Супермен
//
//Сделайте простую рисовалку - веду пальцем по экрану и рисую :)



    // 6. (8)метод, который будет закрашивать произвольную область любым цветом
    // 8. (7) Нарисовать машинку:)
    // 9. при перерисовке добавлять 5 звезд


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [self.drawing setNeedsDisplay];
    
    
    
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
