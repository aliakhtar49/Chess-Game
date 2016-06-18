//
//  Board.h
//  ChessGame
//
//  Created by Ali Akhtar on 6/18/16.
//  Copyright © 2016 Ali Akhtar. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BoardDelegate <NSObject>

-(void)drawImage:(

@end
@interface Board : NSObject
-(void)drawBoard:(__strong NSString* [8][8])chessBoard;
@end
