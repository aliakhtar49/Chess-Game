//
//  ChessBoardCustomView.m
//  ChessGame
//
//  Created by Ali Akhtar on 7/6/16.
//  Copyright © 2016 Ali Akhtar. All rights reserved.
//

#import "ChessBoardCustomView.h"
#import "BoxModel.h"
IB_DESIGNABLE
@implementation ChessBoardCustomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect {
        NSString* chessBoard[8][8] ={
           // 0    1    2    3    4    5   6    7
            @"r",@"k",@"b",@"q",@"a",@"b",@"k",@"r",  // 0
    
            @"p",@"p",@"p",@"p",@"p",@"p",@"p",@"p",  // 1
    
            @" ",@" ",@" ",@" ",@" ",@" ",@" ",@" ",  // 2
    
            @" ",@" ",@" ",@" ",@" ",@" ",@" ",@" ",  // 3
    
            @" ",@" ",@" ",@" ",@" ",@" ",@" ",@" ",  // 4
    
            @" ",@" ",@" ",@" ",@" ",@" ",@" ",@" ",  // 5
    
            @"P",@"P",@"P",@"P",@"P",@"P",@"P",@"P",  // 6
    
            @"R",@"K",@"B",@"Q",@"A",@"B",@"K",@"R"}; // 7
    int squareSize=40;
    for (int i=0;i<64;i+=2) {
        
        
        //// Rectangle Drawing
     //   UIBezierPath* rectanglePath1 = [UIBezierPath bezierPathWithRect: CGRectMake((i%8+(i/8)%2)*squareSize, (i/8)*squareSize, squareSize, squareSize)];
      
       
        UIBezierPath* rectanglePath1 = [UIBezierPath bezierPathWithRect: CGRectMake(((i + ((i/8)%2)) % 8)*squareSize, (i/8)*squareSize, squareSize, squareSize)];
        [self.whiteBackground setFill];
        [rectanglePath1 fill];
        
        //UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(((i+1)%8-((i+1)/8)%2)*squareSize, (i/8)*squareSize, squareSize, squareSize)];
        UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake((((i+!((i/8)%2)) % 8)*squareSize), (i/8)*squareSize, squareSize, squareSize)];
     //  [[UIColor colorWithRed:166/255 green:117/255 blue:80/255 alpha:1] setFill];
        [self.backgroundColor setFill];
        [rectanglePath fill];
        
        
    }

       for (int i=0;i<64;i++) {
        if(!([chessBoard[i/8][i%8] isEqualToString:@" "])){
            [self drawImage:i withImageNamed:[BoxModel imageName:chessBoard[i/8][i%8]] withSquaresize:squareSize];
           
        }
       
    }
}

-(void)drawImage:(int)i withImageNamed:(NSString*)imageNamed withSquaresize:(int)squareSize{
    
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    //// Image Declarations
    UIImage* rook_white = [UIImage imageNamed:imageNamed];
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake((i % 8)*squareSize,  (i/8)*squareSize, squareSize,squareSize)];
    CGContextSaveGState(context);
    [rectanglePath addClip];
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextDrawTiledImage(context, CGRectMake(0, 0, squareSize, squareSize), rook_white.CGImage);
    CGContextRestoreGState(context);

}
@end
