//
//  ABZCell.h
//  22DragAndDrop
//
//  Created by Predki on 04.06.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ABZCellColorBlack,
    ABZCellColorWhite
}ABZCellColor;

@interface ABZCell : UIView

@property(assign, nonatomic) NSInteger index;
@property(strong,nonatomic) UIView *view;
@property(assign, nonatomic) ABZCellColor color;



-(BOOL)isPointInside:(CGPoint) point;
@end
