//
//  ChessBoardCustomView.h
//  ChessGame
//
//  Created by Ali Akhtar on 7/6/16.
//  Copyright © 2016 Ali Akhtar. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChessBoardCustomViewDelegate <NSObject>

-(void)moveHappened:(int)xOldPoition and:(int)yOldPosition  withNewX:(int)xNewPosition withNewY:(int)yNewPosition chessArray:(__strong NSString* [8][8])chessBoard;

@end
@interface ChessBoardCustomView : UIView{
    @public
    NSString* chessBoard1[8][8];
    int a;
}
@property(nonatomic,assign)IBInspectable id <ChessBoardCustomViewDelegate> delegate;

@property(nonatomic) IBInspectable UIColor* whiteBackground;
@property(nonatomic) IBInspectable UIColor* blackBackground;
-(void)drawBoard:(__strong NSString* [8][8])chessBoard;
- (instancetype)initWith:(__strong NSString* [8][8])chessBoard;
@end
