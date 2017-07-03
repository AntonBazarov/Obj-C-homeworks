//
//  ViewController.m
//  UIViewGeometry_Superman
//
//  Created by Predki on 31.05.17.
//  Copyright © 2017 BazarJrDeveloper. All rights reserved.
//

#import "ViewController.h"
#import "ChessBoard.h"

@interface ViewController ()
@property(strong, nonatomic) ChessBoard* board;
@property(strong, nonatomic) NSDictionary* dictionaryWithCheckers;
@property(strong, nonatomic) NSArray* arrayWithCheckers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableDictionary* checkers = [NSMutableDictionary dictionary];
    NSMutableArray* array = [NSMutableArray array];
    
    
    self.board = [ChessBoard new];
    [self.board createCellForBoard: [self centerView]];
    [self.view addSubview:self.board];
    for (int i = 0; i < 12; i++){
        // Create Dark Checkers
        NSInteger row = (int)i/4;
        NSInteger index = (row % 2) == 0 ? (i*2) : (i*2) + 1;
        UIView* checkerDark = [[UIView alloc] initWithFrame:[self.board checker:index]];
        checkerDark.backgroundColor = [UIColor purpleColor];
        [self.board addSubview:checkerDark];
        [array addObject:checkerDark];
        [checkers setObject:checkerDark forKey:@(index)];
        // Create Light Checkers
        int origin = 5*8 + 1;
        NSInteger indexLight = row % 2 == 0 ? (origin + i*2) : (origin + (i*2-1));
        UIView* checkerLight = [[UIView alloc] initWithFrame:[self.board checker:indexLight]];
        checkerLight.backgroundColor = [UIColor lightGrayColor];
        [self.board addSubview:checkerLight];
        [array addObject:checkerLight];
        [checkers setObject:checkerLight forKey:@(indexLight)];

    }
    self.dictionaryWithCheckers = checkers;
    self.arrayWithCheckers = array;

    NSLog(@"dictionaryWithCheckers count = %ld", [self.dictionaryWithCheckers count]);
    NSLog(@"arrayWithCheckers count = %ld", [self.arrayWithCheckers count]);
    
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    self.board.frame = [self centerView];
    [self.board layoutCells];
    [UIView animateWithDuration:0.8f animations:^{
        for (int i = 0; i < [self.arrayWithCheckers count]; i++ ){
            [self shuffle:(UIView*)self.arrayWithCheckers[i]];
            
        }
    }];
    
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

-(void)shuffle:(UIView*) checker {
    NSInteger i = 0;
    while (self.dictionaryWithCheckers[@(i)] != nil) {
        i = arc4random() % 32;
    }
    checker.frame = [self.board checker:i];
    NSMutableDictionary* cells = [self.dictionaryWithCheckers mutableCopy];
    __block id oldKey = nil;
    [cells enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isEqual:checker]){
            oldKey = key;
        }
    }];
    cells[@(i)] = checker;
    cells[oldKey] = nil;

    self.dictionaryWithCheckers = cells;
    
    
}


- (CGRect)centerView {
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    CGFloat min = width < height ? width : height;
    CGFloat x = self.view.center.x - min / 2;
    CGFloat y = self.view.center.y - min / 2;
    return CGRectMake(x, y, min, min);
}




@end
