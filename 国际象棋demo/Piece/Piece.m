//
//  Piece.m
//  国际象棋demo
//
//  Created by Sj03 on 2018/6/11.
//  Copyright © 2018年 Sj03. All rights reserved.
//

#import "Piece.h"
#import "Ppiece.h"
#import "Rpiece.h"
#import "Npiece.h"
#import "Bpiece.h"
#import "Qpiece.h"
#import "Kpiece.h"

@implementation Piece

- (instancetype)initWithFrame:(CGRect)frame andstate:(NSInteger )pieceState andinitPoint:(NSInteger )point {
    
    
    switch (pieceState) {
        case 1:
            self = [[Ppiece alloc] initWithFrame:frame andstate:pieceState andinitPoint:point];
            break;
        case 2:
            self = [[Rpiece alloc] initWithFrame:frame andstate:pieceState andinitPoint:point];
            break;
        case 3:
            self = [[Npiece alloc] initWithFrame:frame andstate:pieceState andinitPoint:point];
            break;
        case 4:
            self = [[Bpiece alloc] initWithFrame:frame andstate:pieceState andinitPoint:point];
            break;
        case 5:
            self = [[Qpiece alloc] initWithFrame:frame andstate:pieceState andinitPoint:point];
            break;
        case 6:
            self = [[Kpiece alloc] initWithFrame:frame andstate:pieceState andinitPoint:point];
            break;
            
        case 11:
            self = [[Ppiece alloc] initWithFrame:frame andstate:pieceState andinitPoint:point];
            break;
        case 12:
            self = [[Rpiece alloc] initWithFrame:frame andstate:pieceState andinitPoint:point];
            break;
        case 13:
            self = [[Npiece alloc] initWithFrame:frame andstate:pieceState andinitPoint:point];
            break;
        case 14:
            self = [[Bpiece alloc] initWithFrame:frame andstate:pieceState andinitPoint:point];
            break;
        case 15:
            self = [[Qpiece alloc] initWithFrame:frame andstate:pieceState andinitPoint:point];
            break;
        case 16:
            self = [[Kpiece alloc] initWithFrame:frame andstate:pieceState andinitPoint:point];
            break;
        default:
            break;
    }
    
    [self addinitPoint:[placeModel formattingPoint:point]];
    self.canMoveArray = [[NSMutableArray alloc] init];
    self.canEatArray = [[NSMutableArray alloc] init];

    return self;
}

- (void)addinitPoint:(placeModel *)model {
    self.pointArray = [[NSMutableArray alloc] init];
    [self.pointArray addObject:model];
}


- (void)canMove:(placeModel *)nowplace {
    
}
- (void)canEat:(placeModel *)nowplace {
    
}

- (void)move:(CGPoint)point {
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
