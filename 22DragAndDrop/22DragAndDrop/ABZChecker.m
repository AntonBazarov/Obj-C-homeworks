//
//  ABZChecker.m
//  22DragAndDrop
//
//  Created by Predki on 04.06.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "ABZChecker.h"

@implementation ABZChecker

-(void) setColor:(ABZCheckerColor)color {
    if (color == ABZCheckerColorBlack) {
        self.backgroundColor = [UIColor blackColor];
    } else {
        self.backgroundColor = [UIColor whiteColor];
    }
    _color = color;
}

-(instancetype)initWithFrame:(CGRect)frame {
    ABZChecker *checkerNew = [super initWithFrame:frame];
    checkerNew.frame = CGRectMake(frame.origin.x + 2, frame.origin.y + 2, frame.size.width - 4, frame.size.height - 4);
    checkerNew.layer.cornerRadius = self.frame.size.width / 2;
    return checkerNew;
}
//1. Создать класс для компонента (ABZChecker) наследник от UIView
//2. Добавить ему свойства color - черный или белый
//3. Создать массив шашек
//4. Расставить шашки по доске как они и должны быть готовы к игре
@end
