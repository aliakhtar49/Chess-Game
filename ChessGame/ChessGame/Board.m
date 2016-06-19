//
//  Board.m
//  ChessGame
//
//  Created by Muzzammil on 6/18/16.
//  Copyright © 2016 Ali Akhtar. All rights reserved.
//

#import "Board.h"
#import "UIModel.h"
#import "DisplayModel.h"


@implementation Board : NSObject 
-(void)drawBoard:(__strong NSString* [8][8])chessBoard view:(UIView*)view{
    int k  = 0 ;
    for(int i=0;i<8;i++){
        for(int j = 0;j<8;j++){
            [self draw:k name:chessBoard[i][j] view:view];
            k++;
        }
    }
}
-(void)draw:(int)index name:(NSString*)name view:(UIView*)view{
    UIModel *uiModel = [UIModel alloc];
    uiModel.xy = index;
    uiModel.subject = name;
    DisplayModel *displayModel = [[DisplayModel alloc]initWithModel:uiModel];
    [displayModel draw:view];
}

@end
