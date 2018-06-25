//
//  boardView.h
//  国际象棋demo
//
//  Created by Sj03 on 2018/6/11.
//  Copyright © 2018年 Sj03. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Piece.h"

@interface boardView : UIView
@property (nonatomic, copy)void (^block_finish)(BOOL isW);

@property (nonatomic, assign)BOOL isW; // YES 为白方走。NO 为黑方走

@end
