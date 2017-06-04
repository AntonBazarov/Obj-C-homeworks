//
//  ABZCell.h
//  22DragAndDrop
//
//  Created by Predki on 04.06.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABZCell : UIView

@property(assign, nonatomic) NSInteger index;
@property(strong,nonatomic) UIView *view;


-(BOOL)isPointInside:(CGPoint) point;
@end
