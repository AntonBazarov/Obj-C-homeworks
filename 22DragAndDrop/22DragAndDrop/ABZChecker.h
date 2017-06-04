//
//  ABZChecker.h
//  22DragAndDrop
//
//  Created by Predki on 04.06.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    ABZCheckerColorBlack,
    ABZCheckerColorWhite
}ABZCheckerColor;
@interface ABZChecker : UIView
@property(assign, nonatomic) ABZCheckerColor color;
@property(assign, nonatomic) NSInteger boardCellIndex;

@end
