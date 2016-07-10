//
//  Rating.m
//  ChessGame
//
//  Created by Ali Akhtar on 7/8/16.
//  Copyright © 2016 Ali Akhtar. All rights reserved.
//

#import "Rating.h"
#import "ViewController.h"

@implementation Rating
-(int)rating:(int)list with:(int)depth withFive:(__strong NSString* [8][8])chessBoard with:(int)kingPosition{
    int counter=0;
    
    
    static int pawnBoard[8][8]={//attribute to http://chessprogramming.wikispaces.com/Simplified+evaluation+function
        { 0,  0,  0,  0,  0,  0,  0,  0},
        {50, 50, 50, 50, 50, 50, 50, 50},
        {10, 10, 20, 30, 30, 20, 10, 10},
        { 5,  5, 10, 25, 25, 10,  5,  5},
        { 0,  0,  0, 20, 20,  0,  0,  0},
        { 5, -5,-10,  0,  0,-10, -5,  5},
        { 5, 10, 10,-20,-20, 10, 10,  5},
        { 0,  0,  0,  0,  0,  0,  0,  0}};
    static int rookBoard[8][8]={
        { 0,  0,  0,  0,  0,  0,  0,  0},
        { 5, 10, 10, 10, 10, 10, 10,  5},
        {-5,  0,  0,  0,  0,  0,  0, -5},
        {-5,  0,  0,  0,  0,  0,  0, -5},
        {-5,  0,  0,  0,  0,  0,  0, -5},
        {-5,  0,  0,  0,  0,  0,  0, -5},
        {-5,  0,  0,  0,  0,  0,  0, -5},
        { 0,  0,  0,  5,  5,  0,  0,  0}};
    static int knightBoard[8][8]={
        {-50,-40,-30,-30,-30,-30,-40,-50},
        {-40,-20,  0,  0,  0,  0,-20,-40},
        {-30,  0, 10, 15, 15, 10,  0,-30},
        {-30,  5, 15, 20, 20, 15,  5,-30},
        {-30,  0, 15, 20, 20, 15,  0,-30},
        {-30,  5, 10, 15, 15, 10,  5,-30},
        {-40,-20,  0,  5,  5,  0,-20,-40},
        {-50,-40,-30,-30,-30,-30,-40,-50}};
    static int bishopBoard[8][8]={
        {-20,-10,-10,-10,-10,-10,-10,-20},
        {-10,  0,  0,  0,  0,  0,  0,-10},
        {-10,  0,  5, 10, 10,  5,  0,-10},
        {-10,  5,  5, 10, 10,  5,  5,-10},
        {-10,  0, 10, 10, 10, 10,  0,-10},
        {-10, 10, 10, 10, 10, 10, 10,-10},
        {-10,  5,  0,  0,  0,  0,  5,-10},
        {-20,-10,-10,-10,-10,-10,-10,-20}};
    static int queenBoard[8][8]={
        {-20,-10,-10, -5, -5,-10,-10,-20},
        {-10,  0,  0,  0,  0,  0,  0,-10},
        {-10,  0,  5,  5,  5,  5,  0,-10},
        { -5,  0,  5,  5,  5,  5,  0, -5},
        {  0,  0,  5,  5,  5,  5,  0, -5},
        {-10,  5,  5,  5,  5,  5,  0,-10},
        {-10,  0,  5,  0,  0,  0,  0,-10},
        {-20,-10,-10, -5, -5,-10,-10,-20}};
    static int kingMidBoard[8][8]={
        {-30,-40,-40,-50,-50,-40,-40,-30},
        {-30,-40,-40,-50,-50,-40,-40,-30},
        {-30,-40,-40,-50,-50,-40,-40,-30},
        {-30,-40,-40,-50,-50,-40,-40,-30},
        {-20,-30,-30,-40,-40,-30,-30,-20},
        {-10,-20,-20,-20,-20,-20,-20,-10},
        { 20, 20,  0,  0,  0,  0, 20, 20},
        { 20, 30, 10,  0,  0, 10, 30, 20}};
    static int kingEndBoard[8][8]={
        {-50,-40,-30,-20,-20,-30,-40,-50},
        {-30,-20,-10,  0,  0,-10,-20,-30},
        {-30,-10, 20, 30, 30, 20,-10,-30},
        {-30,-10, 30, 40, 40, 30,-10,-30},
        {-30,-10, 30, 40, 40, 30,-10,-30},
        {-30,-10, 20, 30, 30, 20,-10,-30},
        {-30,-30,  0,  0,  0,  0,-30,-30},
        {-50,-30,-30,-30,-30,-30,-30,-50}};
    counter+=[self rateAttack:chessBoard withKingPosition:kingPosition];
    counter+=[self rateMaterial:chessBoard];
    counter+=[self rateMoveablitly:depth with:list and:chessBoard];
    counter+=[self ratePositional:chessBoard with:[self rateMaterial:chessBoard] withpawnArray:pawnBoard withrookBoard:rookBoard withknightBoard:knightBoard withbishopBoard:bishopBoard withqueenBoard:queenBoard withkingMidBoard:kingMidBoard withkingEndBoard:kingEndBoard withKingPoisiton:kingPosition];
    ViewController *viewController = [[ViewController alloc]init];
    [viewController flipBoard:chessBoard];
   
    counter-=[self rateAttack:chessBoard withKingPosition:kingPosition];
    counter-=[self rateMaterial:chessBoard];
    counter-=[self rateMoveablitly:depth with:list and:chessBoard];
    counter-=[self ratePositional:chessBoard with:[self rateMaterial:chessBoard] withpawnArray:pawnBoard withrookBoard:rookBoard withknightBoard:knightBoard withbishopBoard:bishopBoard withqueenBoard:queenBoard withkingMidBoard:kingMidBoard withkingEndBoard:kingEndBoard withKingPoisiton:kingPosition];
    [viewController flipBoard:chessBoard];
    return -(counter+depth*50);
}
-(int) rateAttack:(__strong NSString* [8][8])chessBoard withKingPosition:(int)kingPositionC{
    int counter=0;
    ViewController* viewController = [[ViewController alloc]init];
    int tempPositionC=kingPositionC;
    for (int i=0;i<64;i++) {
        if([chessBoard[i/8][i%8] isEqualToString:@"P"]){
            tempPositionC = i ;
            if(![viewController kingSafe:chessBoard]){
                counter-=64;
            }
        }
        else if([chessBoard[i/8][i%8] isEqualToString:@"R"]){
            kingPositionC = i ;
            if(![viewController kingSafe:chessBoard]){
                counter-=500;
            }
        }
        else if([chessBoard[i/8][i%8] isEqualToString:@"K"]){
            kingPositionC = i ;
            if(![viewController kingSafe:chessBoard]){
                counter-=300;
            }
        }
        else if([chessBoard[i/8][i%8] isEqualToString:@"B"]){
            kingPositionC = i ;
            if(![viewController kingSafe:chessBoard]){
                counter-=300;
            }
        }
        else if([chessBoard[i/8][i%8] isEqualToString:@"Q"]){
            kingPositionC = i ;
            if(![viewController kingSafe:chessBoard]){
                counter-=900;
            }
        }
      
    }
    kingPositionC=tempPositionC;
    if (![viewController kingSafe:chessBoard]) {counter-=200;}
    return counter/2;
}
-(int) rateMaterial:(__strong NSString* [8][8])chessBoard{
    int counter=0, bishopCounter=0;
    for (int i=0;i<64;i++) {
        if([chessBoard[i/8][i%8] isEqualToString:@"P"]){
            counter+=100;
        }
        else if([chessBoard[i/8][i%8] isEqualToString:@"R"]){
            counter+=500;
        }
        else if([chessBoard[i/8][i%8] isEqualToString:@"K"]){
            counter+=300;
        }
        else if([chessBoard[i/8][i%8] isEqualToString:@"B"]){
            bishopCounter+=1;
        }
        else if([chessBoard[i/8][i%8] isEqualToString:@"Q"]){
            counter+=900;
        }
        
    }
    if (bishopCounter>=2) {
        counter+=300*bishopCounter;
    } else {
        if (bishopCounter==1) {counter+=250;}
    }
    return counter;
}
-(int) rateMoveablitly:(int)depth with:(int)listLength and:(__strong NSString* [8][8])chessBoard{
    int counter=0;
    ViewController* viewController = [[ViewController alloc]init];
    counter+=listLength;//5 pointer per valid move
    if (listLength==0) {//current side is in checkmate or stalemate
        if (![viewController kingSafe:chessBoard]) {//if checkmate
            counter+=-200000*depth;
        } else {//if stalemate
            counter+=-150000*depth;
        }
    }
    return 0;
}
-(int) ratePositional:(__strong NSString* [8][8])chessBoard with:(int)material withpawnArray:(int[8][8])pawnBoard withrookBoard:(int[8][8])rookBoard withknightBoard:(int[8][8])knightBoard withbishopBoard:(int[8][8])bishopBoard withqueenBoard:(int[8][8])queenBoard withkingMidBoard:(int[8][8])kingMidBoard withkingEndBoard:(int[8][8])kingEndBoard withKingPoisiton:(int)kingPositionC{
    int counter=0;
    ViewController* viewController = [[ViewController alloc]init];
    for (int i=0;i<64;i++) {
        
        if([chessBoard[i/8][i%8] isEqualToString:@"P"]){
            counter+=pawnBoard[i/8][i%8];
        }
        else if([chessBoard[i/8][i%8] isEqualToString:@"R"]){
            counter+=rookBoard[i/8][i%8];
        }
        else if([chessBoard[i/8][i%8] isEqualToString:@"K"]){
            counter+=knightBoard[i/8][i%8];
        }
        else if([chessBoard[i/8][i%8] isEqualToString:@"B"]){
            counter+=bishopBoard[i/8][i%8];
        }
        else if([chessBoard[i/8][i%8] isEqualToString:@"Q"]){
            counter+=queenBoard[i/8][i%8];
        }
        else if([chessBoard[i/8][i%8] isEqualToString:@"A"]){
            if (material>=1750) {
                counter+=kingMidBoard[i/8][i%8];
              
                NSString* list = [viewController posibleA:i with:chessBoard];
                counter+= (list.length * 10);
                } else
            {counter+=kingEndBoard[i/8][i%8];
                 counter+= ([[viewController posibleA:i with:chessBoard] length] * 30);
               
            
            }
        }
        
    }
    return counter;
}
@end
