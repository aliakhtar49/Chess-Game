//
//  ViewController.h
//  ChessGame
//
//  Created by Ali Akhtar on 6/12/16.
//  Copyright © 2016 Ali Akhtar. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ChessBoardCustomView.h"
@interface ViewController : UIViewController<ChessBoardCustomViewDelegate>{
    
    
}

@property (weak, nonatomic) IBOutlet ChessBoardCustomView *myBoardView;
-(void)flipBoard:(__strong NSString* [8][8])chessBoard;
-(NSString*)posibleA:(int)i with:(__strong NSString* [8][8])chessBoard;
-(BOOL)kingSafe:(__strong NSString* [8][8])chessBoard;
@end

