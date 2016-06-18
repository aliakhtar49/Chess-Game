//
//  Board.h
//  ChessGame
//
//  Created by Muzzammil on 6/18/16.
//  Copyright © 2016 Ali Akhtar. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol BoardDelegate <NSObject>

-(void)drawImage;

@end

@interface Board : NSObject
-(void)drawBoard:(__strong NSString* [8][8])chessBoard view:(UIView*)view;

@property(assign) id <BoardDelegate> delegate;

@end
