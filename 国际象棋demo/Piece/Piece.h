//
//  Piece.h
//  国际象棋demo
//
//  Created by Sj03 on 2018/6/11.
//  Copyright © 2018年 Sj03. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "placeModel.h"
#define NS_ENUM(...) CF_ENUM(__VA_ARGS__)
 typedef NS_ENUM(NSInteger, pieceState){
    pieceState_WP = 1,
    pieceState_WR = 2,
    pieceState_WN = 3,
    pieceState_WB = 4,
    pieceState_WK = 5,
    pieceState_WQ = 6,
    pieceState_BP = 11,
    pieceState_BR = 12,
    pieceState_BN = 13,
    pieceState_BB = 14,
    pieceState_BK = 15,
    pieceState_BQ = 16
    
};

@interface Piece : UIButton

- (instancetype)initWithFrame:(CGRect)frame andstate:(NSInteger )pieceState andinitPoint:(NSInteger )point;

@property (nonatomic, assign) pieceState titles;

@property (nonatomic, strong)NSString *name;

@property (nonatomic, strong)NSMutableArray <placeModel *>*pointArray;

@property (nonatomic, strong)NSMutableArray <placeModel *>*canMoveArray;

@property (nonatomic, strong)NSMutableArray <placeModel *>*canEatArray;

@property (nonatomic, strong)NSMutableArray *directionArray;// 方向

@property (nonatomic, strong)NSMutableArray *eatDirectionArray;

@property (nonatomic, assign)NSInteger num;// 移动的格数

@property (nonatomic, assign)NSInteger eatnum;// 吃的格数


- (void)canMove:(placeModel *)nowplace;
- (void)canEat:(placeModel *)nowplace;
- (void)move:(CGPoint )point;

@end
