//
//  Rating.h
//  ChessGame
//
//  Created by Ali Akhtar on 7/8/16.
//  Copyright © 2016 Ali Akhtar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Rating : NSObject
-(int)rating:(int)list with:(int)depth withFive:(__strong NSString* [8][8])chessBoard with:(int)kingPosition;
@end
