//
//  boardView.m
//  国际象棋demo
//
//  Created by Sj03 on 2018/6/11.
//  Copyright © 2018年 Sj03. All rights reserved.
//

#import "boardView.h"


@interface boardView ()

@property (strong, nonatomic) IBOutlet UIView *view;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *firstViewArray;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *secendViewArray;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *three;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *four;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *five;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *six;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *seven;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *eight;

@property (nonatomic, strong)Piece *selePiece;



@end

@implementation boardView

- (void)pieceDidSelect:(Piece *)piece {
    
    BOOL isNeedAddCanPiece = NO; // 计算子可以走的格子
    
    if (self.selePiece) {
        if (self.isW) {
            if (piece.titles < 10) {
                self.selePiece = piece;
                isNeedAddCanPiece = YES;
            } else {
                // 是否能吃判断
                UIView *view = piece.superview;
                placeModel *place = [placeModel formattingPoint:view.tag];
                [self.selePiece.canEatArray enumerateObjectsUsingBlock:^(placeModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if ((place.number == obj.number) && ([place.english isEqualToString:obj.english])) {
                        [self pieceEat:obj andPiece:piece];
                    }
                }];
            }
        } else
            // 黑方走
        {
            if (piece.titles > 10) {
                self.selePiece = piece;
                isNeedAddCanPiece = YES;
            } else {
                // 是否能吃判断
                UIView *view = piece.superview;
                placeModel *place = [placeModel formattingPoint:view.tag];
                [self.selePiece.canEatArray enumerateObjectsUsingBlock:^(placeModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if ((place.number == obj.number) && ([place.english isEqualToString:obj.english])) {
                        [self pieceEat:obj andPiece:piece];
                    }
                }];
            }
        }
    }
    // 如果没有选中的棋子
    else
    {
        if (self.isW) {
            // 白方走
            if (piece.titles < 10) {
                self.selePiece = piece;
                isNeedAddCanPiece = YES;
            } else {
                isNeedAddCanPiece = NO;
            }
        }
        // 黑方走
        else {
            if (piece.titles < 10) {
                isNeedAddCanPiece = NO;
            } else {
                isNeedAddCanPiece = YES;
                self.selePiece = piece;
            }
        }
    }
    
    if (isNeedAddCanPiece) {
        [self selePieceCanMove];
        [self selePieceCanEat];
    }
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    [self addSubview:self.view];
    self.isW = YES;
    if (self) {
        [_firstViewArray enumerateObjectsUsingBlock:^(UIView *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSUInteger tag = [[NSString stringWithFormat:@"1%lu",(unsigned long)idx] integerValue];
            [obj setTag:tag];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap:)];
            [obj addGestureRecognizer:tap];
        }];
        [_secendViewArray enumerateObjectsUsingBlock:^(UIView *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSUInteger tag = [[NSString stringWithFormat:@"2%lu",(unsigned long)idx] integerValue];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap:)];
            [obj addGestureRecognizer:tap];
            [obj setTag:tag];
        }];
        [_three enumerateObjectsUsingBlock:^(UIView *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSUInteger tag = [[NSString stringWithFormat:@"3%lu",(unsigned long)idx] integerValue];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap:)];
            [obj addGestureRecognizer:tap];
            [obj setTag:tag];
        }];
        [_four enumerateObjectsUsingBlock:^(UIView *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSUInteger tag = [[NSString stringWithFormat:@"4%lu",(unsigned long)idx] integerValue];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap:)];
            [obj addGestureRecognizer:tap];
            [obj setTag:tag];
        }];
        [_five enumerateObjectsUsingBlock:^(UIView *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSUInteger tag = [[NSString stringWithFormat:@"5%lu",(unsigned long)idx] integerValue];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap:)];
            [obj addGestureRecognizer:tap];
            [obj setTag:tag];
        }];
        [_six enumerateObjectsUsingBlock:^(UIView *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSUInteger tag = [[NSString stringWithFormat:@"6%lu",(unsigned long)idx] integerValue];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap:)];
            [obj addGestureRecognizer:tap];
            [obj setTag:tag];
        }];
        [_seven enumerateObjectsUsingBlock:^(UIView *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSUInteger tag = [[NSString stringWithFormat:@"7%lu",(unsigned long)idx] integerValue];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap:)];
            [obj addGestureRecognizer:tap];
            [obj setTag:tag];
        }];
        [_eight enumerateObjectsUsingBlock:^(UIView *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSUInteger tag = [[NSString stringWithFormat:@"8%lu",(unsigned long)idx] integerValue];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap:)];
            [obj addGestureRecognizer:tap];
            [obj setTag:tag];
        }];
        
        [self creatPice];
    }
    return self;
}

- (void)creatPice {
    [self.firstViewArray enumerateObjectsUsingBlock:^(UIView *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx < 5) {
            Piece *pice = [[Piece alloc] initWithFrame:CGRectMake(0, 0, obj.frame.size.width, obj.frame.size.width) andstate:idx+2 andinitPoint:obj.tag];
            pice.center = CGPointMake(obj.bounds.size.width/2, obj.bounds.size.width/2);
            [pice addTarget:self action:@selector(pieceDidSelect:) forControlEvents:UIControlEventTouchDown];
            [obj addSubview:pice];
        }
        if (idx >4) {
            Piece *pice = [[Piece alloc] initWithFrame:CGRectMake(0, 0, obj.frame.size.width, obj.frame.size.width) andstate:(9-idx) andinitPoint:obj.tag];
            pice.center = CGPointMake(obj.bounds.size.width/2, obj.bounds.size.width/2);
            [pice addTarget:self action:@selector(pieceDidSelect:) forControlEvents:UIControlEventTouchDown];
            [obj addSubview:pice];
        }
    }];
    
    [self.secendViewArray enumerateObjectsUsingBlock:^(UIView *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Piece *pice = [[Piece alloc] initWithFrame:CGRectMake(0, 0, obj.frame.size.width, obj.frame.size.width) andstate:1 andinitPoint:obj.tag];
        pice.center = CGPointMake(obj.bounds.size.width/2, obj.bounds.size.width/2);
        [pice addTarget:self action:@selector(pieceDidSelect:) forControlEvents:UIControlEventTouchDown];
        [obj addSubview:pice];
    }];
    
    [self.eight enumerateObjectsUsingBlock:^(UIView *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx < 5) {
            Piece *pice = [[Piece alloc] initWithFrame:CGRectMake(0, 0, obj.frame.size.width, obj.frame.size.width) andstate:(idx+2)+10 andinitPoint:obj.tag];
            pice.center = CGPointMake(obj.bounds.size.width/2, obj.bounds.size.width/2);
            [pice addTarget:self action:@selector(pieceDidSelect:) forControlEvents:UIControlEventTouchDown];
            [obj addSubview:pice];
        }
        if (idx >4) {
            Piece *pice = [[Piece alloc] initWithFrame:CGRectMake(0, 0, obj.frame.size.width, obj.frame.size.width) andstate:9-idx+10 andinitPoint:obj.tag];
            pice.center = CGPointMake(obj.bounds.size.width/2, obj.bounds.size.width/2);
            [pice addTarget:self action:@selector(pieceDidSelect:) forControlEvents:UIControlEventTouchDown];
            [obj addSubview:pice];
        }
    }];
    
    [self.seven enumerateObjectsUsingBlock:^(UIView *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Piece *pice = [[Piece alloc] initWithFrame:CGRectMake(0, 0, obj.frame.size.width, obj.frame.size.width) andstate:11 andinitPoint:obj.tag];
        pice.center = CGPointMake(obj.bounds.size.width/2, obj.bounds.size.width/2);
        [pice addTarget:self action:@selector(pieceDidSelect:) forControlEvents:UIControlEventTouchDown];
        [obj addSubview:pice];
    }];
}


- (void)viewTap:(UITapGestureRecognizer *)tap {
    [self didchoseView:tap.view];
}


- (void)didchoseView: (UIView *)view {
    placeModel *model = [placeModel formattingPoint:view.tag];
    if (self.selePiece) {
        [self.selePiece.canMoveArray enumerateObjectsUsingBlock:^(placeModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ((obj.english == model.english) && (obj.number == model.number) ) {
                [self pieceMove:model];
            }
        }];
    }
    NSLog(@"%@%ld",model.english,model.number);
}

#pragma -mark 操作
- (void)pieceMove:(placeModel *)model {
    UIView *view = [self viewWithTag:[placeModel formattingtag:model]];
    UIView *initview = [self viewWithTag:[placeModel formattingtag:self.selePiece.pointArray.lastObject]];
    CGPoint point = [view convertPoint:CGPointMake(0, 0) toView:self.view];
    CGPoint initpoint = [initview convertPoint:CGPointMake(0, 0) toView:self.view];
    
    CGRect font = self.selePiece.frame;
    font.origin.x = initpoint.x;
    font.origin.y = initpoint.y;
    self.selePiece.frame = font;
    [self.view addSubview:self.selePiece];
    
    [UIView animateWithDuration:1 animations:^{
        CGRect font = self.selePiece.frame;
        font.origin.x = point.x;
        font.origin.y = point.y;
        self.selePiece.frame = font;
    } completion:^(BOOL finished) {
        CGRect font = self.selePiece.frame;
        font.origin.x = 0;
        font.origin.y = 0;
        self.selePiece.frame = font;
        [view addSubview:self.selePiece];
        [self.selePiece.pointArray addObject:model];
        self.isW = !self.isW;
        self.selePiece = nil;
    }];
}

- (void)pieceEat:(placeModel *)model andPiece:(Piece *)pieced {
    UIView *view = [self viewWithTag:[placeModel formattingtag:model]];
    UIView *initview = [self viewWithTag:[placeModel formattingtag:self.selePiece.pointArray.lastObject]];
    CGPoint point = [view convertPoint:CGPointMake(0, 0) toView:self.view];
    CGPoint initpoint = [initview convertPoint:CGPointMake(0, 0) toView:self.view];
    
    CGRect font = self.selePiece.frame;
    font.origin.x = initpoint.x;
    font.origin.y = initpoint.y;
    self.selePiece.frame = font;
    [self.view addSubview:self.selePiece];
    
    [UIView animateWithDuration:1 animations:^{
        CGRect font = self.selePiece.frame;
        font.origin.x = point.x;
        font.origin.y = point.y;
        self.selePiece.frame = font;
    } completion:^(BOOL finished) {
        CGRect font = self.selePiece.frame;
        font.origin.x = 0;
        font.origin.y = 0;
        self.selePiece.frame = font;
        [view addSubview:self.selePiece];
        [self.selePiece.pointArray addObject:model];
        [pieced removeFromSuperview];
        self.selePiece = nil;
        if (pieced.titles == pieceState_WK && !self.isW) {
            self.userInteractionEnabled = NO;
            if (self.block_finish) {
                self.block_finish(NO);
            }
        } else if (pieced.titles == pieceState_BK && self.isW) {
            self.userInteractionEnabled = NO;
            if (self.block_finish) {
                self.block_finish(YES);
            }
        } else {
            self.isW = !self.isW;
        }
    }];
    

}



//- (void)selePiece:(Piece *)piece {
//    self.selePiece = piece;
//}

- (void)selePieceCanMove {
    UIView *view = self.selePiece.superview;
    placeModel *model = [placeModel formattingPoint:view.tag];
    
    [self.selePiece canMove:model];
    [self.selePiece.canMoveArray removeAllObjects];
    [self.selePiece.directionArray enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj integerValue] == 1) {
            for (int i = 1; i <= self.selePiece.num ; i++) {
                placeModel *model = [placeModel leftPoint:[placeModel formattingPoint:view.tag] andnum:i];
                NSInteger tag = [placeModel formattingtag:model];
                UIView *listview = [self viewWithTag:tag];
                if (listview.subviews.count > 0 || !listview) {
                    break;
                } else {
                    [self.selePiece.canMoveArray addObject:model];
                }
            }
        } else if ([obj integerValue] == 2) {
            for (int i = 1; i <= self.selePiece.num ; i++) {
                placeModel *model = [placeModel leftupPoint:[placeModel formattingPoint:view.tag] andnum:i];
                NSInteger tag = [placeModel formattingtag:model];
                UIView *listview = [self viewWithTag:tag];
                if (listview.subviews.count > 0 || !listview) {
                    break;
                } else {
                    [self.selePiece.canMoveArray addObject:model];
                }
            }
        }  else if ([obj integerValue] == 3) {
            for (int i = 1; i <= self.selePiece.num ; i++) {
                placeModel *model = [placeModel upPoint:[placeModel formattingPoint:view.tag] andnum:i];
                NSInteger tag = [placeModel formattingtag:model];
                UIView *listview = [self viewWithTag:tag];
                if (listview.subviews.count > 0 || !listview) {
                    break;
                } else {
                    [self.selePiece.canMoveArray addObject:model];
                }
            }
        }  else if ([obj integerValue] == 4) {
            for (int i = 1; i <= self.selePiece.num ; i++) {
                placeModel *model = [placeModel rightupPoint:[placeModel formattingPoint:view.tag] andnum:i];
                NSInteger tag = [placeModel formattingtag:model];
                UIView *listview = [self viewWithTag:tag];
                if (listview.subviews.count > 0 || !listview) {
                    break;
                } else {
                    [self.selePiece.canMoveArray addObject:model];
                }
            }
        } else if ([obj integerValue] == 5) {
            for (int i = 1; i <= self.selePiece.num ; i++) {
                placeModel *model = [placeModel rightPoint:[placeModel formattingPoint:view.tag] andnum:i];
                NSInteger tag = [placeModel formattingtag:model];
                UIView *listview = [self viewWithTag:tag];
                if (listview.subviews.count > 0 || !listview) {
                    break;
                } else {
                    [self.selePiece.canMoveArray addObject:model];
                }
            }
        } else if ([obj integerValue] == 6) {
            for (int i = 1; i <= self.selePiece.num ; i++) {
                placeModel *model = [placeModel rightdownPoint:[placeModel formattingPoint:view.tag] andnum:i];
                NSInteger tag = [placeModel formattingtag:model];
                UIView *listview = [self viewWithTag:tag];
                if (listview.subviews.count > 0 || !listview) {
                    break;
                } else {
                    [self.selePiece.canMoveArray addObject:model];
                }
            }
        } else if ([obj integerValue] == 7) {
            for (int i = 1; i <= self.selePiece.num ; i++) {
                placeModel *model = [placeModel downPoint:[placeModel formattingPoint:view.tag] andnum:i];
                NSInteger tag = [placeModel formattingtag:model];
                UIView *listview = [self viewWithTag:tag];
                if (listview.subviews.count > 0 || !listview) {
                    break;
                } else {
                    [self.selePiece.canMoveArray addObject:model];
                }
            }
        } else if ([obj integerValue] == 8) {
            for (int i = 1; i <= self.selePiece.num ; i++) {
                placeModel *model = [placeModel leftdownPoint:[placeModel formattingPoint:view.tag] andnum:i];
                NSInteger tag = [placeModel formattingtag:model];
                UIView *listview = [self viewWithTag:tag];
                if (listview.subviews.count > 0 || !listview) {
                    break;
                } else {
                    [self.selePiece.canMoveArray addObject:model];
                }
            }
        } else if ([obj integerValue] == 9) {
            NSArray *arr = [placeModel NMove:[placeModel formattingPoint:view.tag]];
            [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSInteger tag = [placeModel formattingtag:obj];
                UIView *listview = [self viewWithTag:tag];
                if (listview.subviews.count > 0 || !listview) {
                    
                } else {
                    [self.selePiece.canMoveArray addObject:obj];
                }
            }];
        }
    }];
    
    [self.selePiece.canMoveArray enumerateObjectsUsingBlock:^(placeModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%ld",[placeModel formattingtag:obj]);
//        UIView *view =  [self viewWithTag:[placeModel formattingtag:obj]];
        
    }];
}

- (void)selePieceCanEat {
    UIView *view = self.selePiece.superview;
    placeModel *model = [placeModel formattingPoint:view.tag];
    [self.selePiece.canEatArray removeAllObjects];
    [self.selePiece canEat:model];
    
    [self.selePiece.eatDirectionArray enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj integerValue] == 1) {
            for (int i = 1; i <= self.selePiece.eatnum ; i++) {
                placeModel *model = [placeModel leftPoint:[placeModel formattingPoint:view.tag] andnum:i];
                NSInteger tag = [placeModel formattingtag:model];
                UIView *listview = [self viewWithTag:tag];
                if (!listview) {
                    break;
                }
                if (listview.subviews.count > 0) {
                    Piece *piece = listview.subviews.firstObject;
                    if ((piece.titles > 10 && self.selePiece.titles > 10) || (piece.titles < 10 && self.selePiece.titles < 10)) {
                        break;
                    } else {
                        [self.selePiece.canEatArray addObject:model];
                        break;
                    }
                }
            }
        } else if ([obj integerValue] == 2) {
            for (int i = 1; i <= self.selePiece.eatnum ; i++) {
                placeModel *model = [placeModel leftupPoint:[placeModel formattingPoint:view.tag] andnum:i];
                NSInteger tag = [placeModel formattingtag:model];
                UIView *listview = [self viewWithTag:tag];
                if (!listview) {
                    break;
                }
                if (listview.subviews.count > 0) {
                    Piece *piece = listview.subviews.firstObject;
                    if ((piece.titles > 10 && self.selePiece.titles > 10) || (piece.titles < 10 && self.selePiece.titles < 10)) {
                        break;
                    } else {
                        [self.selePiece.canEatArray addObject:model];
                        break;
                    }
                }
            }
        }  else if ([obj integerValue] == 3) {
            for (int i = 1; i <= self.selePiece.eatnum ; i++) {
                placeModel *model = [placeModel upPoint:[placeModel formattingPoint:view.tag] andnum:i];
                NSInteger tag = [placeModel formattingtag:model];
                UIView *listview = [self viewWithTag:tag];
                if (!listview) {
                    break;
                }
                if (listview.subviews.count > 0) {
                    Piece *piece = listview.subviews.firstObject;
                    if ((piece.titles > 10 && self.selePiece.titles > 10) || (piece.titles < 10 && self.selePiece.titles < 10)) {
                        break;
                    } else {
                        [self.selePiece.canEatArray addObject:model];
                        break;
                    }
                }
            }
        }  else if ([obj integerValue] == 4) {
            for (int i = 1; i <= self.selePiece.eatnum ; i++) {
                placeModel *model = [placeModel rightupPoint:[placeModel formattingPoint:view.tag] andnum:i];
                NSInteger tag = [placeModel formattingtag:model];
                UIView *listview = [self viewWithTag:tag];
                if (!listview) {
                    break;
                }
                if (listview.subviews.count > 0) {
                    Piece *piece = listview.subviews.firstObject;
                    if ((piece.titles > 10 && self.selePiece.titles > 10) || (piece.titles < 10 && self.selePiece.titles < 10)) {
                        break;
                    } else {
                        [self.selePiece.canEatArray addObject:model];
                        break;
                    }
                }
            }
        } else if ([obj integerValue] == 5) {
            for (int i = 1; i <= self.selePiece.eatnum ; i++) {
                placeModel *model = [placeModel rightPoint:[placeModel formattingPoint:view.tag] andnum:i];
                NSInteger tag = [placeModel formattingtag:model];
                UIView *listview = [self viewWithTag:tag];
                if (!listview) {
                    break;
                }
                if (listview.subviews.count > 0) {
                    Piece *piece = listview.subviews.firstObject;
                    if ((piece.titles > 10 && self.selePiece.titles > 10) || (piece.titles < 10 && self.selePiece.titles < 10)) {
                        break;
                    } else {
                        [self.selePiece.canEatArray addObject:model];
                        break;
                    }
                }
            }
        } else if ([obj integerValue] == 6) {
            for (int i = 1; i <= self.selePiece.eatnum ; i++) {
                placeModel *model = [placeModel rightdownPoint:[placeModel formattingPoint:view.tag] andnum:i];
                NSInteger tag = [placeModel formattingtag:model];
                UIView *listview = [self viewWithTag:tag];
                if (!listview) {
                    break;
                }
                if (listview.subviews.count > 0) {
                    Piece *piece = listview.subviews.firstObject;
                    if ((piece.titles > 10 && self.selePiece.titles > 10) || (piece.titles < 10 && self.selePiece.titles < 10)) {
                        break;
                    } else {
                        [self.selePiece.canEatArray addObject:model];
                        break;
                    }
                }
            }
        } else if ([obj integerValue] == 7) {
            for (int i = 1; i <= self.selePiece.eatnum ; i++) {
                placeModel *model = [placeModel downPoint:[placeModel formattingPoint:view.tag] andnum:i];
                NSInteger tag = [placeModel formattingtag:model];
                UIView *listview = [self viewWithTag:tag];
                if (!listview) {
                    break;
                }
                if (listview.subviews.count > 0) {
                    Piece *piece = listview.subviews.firstObject;
                    if ((piece.titles > 10 && self.selePiece.titles > 10) || (piece.titles < 10 && self.selePiece.titles < 10)) {
                        break;
                    } else {
                        [self.selePiece.canEatArray addObject:model];
                        break;
                    }
                }
            }
        } else if ([obj integerValue] == 8) {
            for (int i = 1; i <= self.selePiece.eatnum ; i++) {
                placeModel *model = [placeModel leftdownPoint:[placeModel formattingPoint:view.tag] andnum:i];
                NSInteger tag = [placeModel formattingtag:model];
                UIView *listview = [self viewWithTag:tag];
                if (!listview) {
                    break;
                }
                if (listview.subviews.count > 0) {
                    Piece *piece = listview.subviews.firstObject;
                    if ((piece.titles > 10 && self.selePiece.titles > 10) || (piece.titles < 10 && self.selePiece.titles < 10)) {
                        break;
                    } else {
                        [self.selePiece.canEatArray addObject:model];
                        break;
                    }
                }
            }
        } else if ([obj integerValue] == 9) {
            NSArray *arr = [placeModel NMove:[placeModel formattingPoint:view.tag]];
            [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSInteger tag = [placeModel formattingtag:obj];
                UIView *listview = [self viewWithTag:tag];
                if (listview.subviews.count > 0) {
                    Piece *piece = listview.subviews.firstObject;
                    if ((piece.titles > 10 && self.selePiece.titles > 10) || (piece.titles < 10 && self.selePiece.titles < 10)) {
                    } else {
                        [self.selePiece.canEatArray addObject:obj];
                    }
                }
            }];
        }
    }];
    
    [self.selePiece.canEatArray enumerateObjectsUsingBlock:^(placeModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%ld",[placeModel formattingtag:obj]);
//        UIView *view =  [self viewWithTag:[placeModel formattingtag:obj]];
//        view.backgroundColor = [UIColor redColor];
        
    }];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */


@end
