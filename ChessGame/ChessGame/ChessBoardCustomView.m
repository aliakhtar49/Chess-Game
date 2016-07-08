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
@interface ChessBoardCustomView(){
     int mouseX, mouseY, newMouseX, newMouseY;
}

@end
@implementation ChessBoardCustomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (instancetype)initWith:(__strong NSString* [8][8])chessBoard
{
    self = [super init];
    if (self) {
        a = 7;
        for(int i =0;i<8;i++){
            for(int j = 0;j<8;j++){
                self->chessBoard1[i][j] = chessBoard[i][j];
            }
        }
    }
    return self;
}
-(void)drawBoard:(__strong NSString* [8][8])chessBoard{
    
}
- (void)drawRect:(CGRect)rect {
//        NSString* chessBoard[8][8] ={
//           // 0    1    2    3    4    5   6    7
//            @"r",@"k",@"b",@"q",@"a",@"b",@"k",@"r",  // 0
//    
//            @"p",@"p",@"p",@"p",@"p",@"p",@"p",@"p",  // 1
//    
//            @" ",@" ",@" ",@" ",@" ",@" ",@" ",@" ",  // 2
//    
//            @" ",@" ",@" ",@" ",@" ",@" ",@" ",@" ",  // 3
//    
//            @" ",@" ",@" ",@" ",@" ",@" ",@" ",@" ",  // 4
//    
//            @" ",@" ",@" ",@" ",@" ",@" ",@" ",@" ",  // 5
//    
//            @"P",@"P",@"P",@"P",@"P",@"P",@"P",@"P",  // 6
//    
//            @"R",@"K",@"B",@"Q",@"A",@"B",@"K",@"R"}; // 7
    int squareSize=40;
    for (int i=0;i<64;i+=2) {
            UIBezierPath* rectanglePath1 = [UIBezierPath bezierPathWithRect: CGRectMake(((i + ((i/8)%2)) % 8)*squareSize, (i/8)*squareSize, squareSize, squareSize)];
        [self.whiteBackground setFill];
        [rectanglePath1 fill];
        UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake((((i+!((i/8)%2)) % 8)*squareSize), (i/8)*squareSize, squareSize, squareSize)];
        [self.backgroundColor setFill];
        [rectanglePath fill];
        
        
    }

       for (int i=0;i<64;i++) {
        if(!([chessBoard1[i/8][i%8] isEqualToString:@" "])){
          //  [self drawImage:i withImageNamed:[BoxModel imageName:self->chessBoard1[i/8][i%8]] withSquaresize:squareSize];
            //// General Declarations
            CGContextRef context = UIGraphicsGetCurrentContext();
            UIImage* rook_white = [UIImage imageNamed:[BoxModel imageName:chessBoard1[i/8][i%8]]];
            
            //// Rectangle Drawing
            UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake((i % 8)*squareSize,  (i/8)*squareSize, squareSize,squareSize)];
            CGContextSaveGState(context);
            [rectanglePath addClip];
            CGContextScaleCTM(context, 1.0, -1.0);
            CGContextDrawTiledImage(context, CGRectMake(0, 0, squareSize, squareSize), rook_white.CGImage);
            CGContextRestoreGState(context);
           
        }
       
    }
}
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    CGPoint position = [touch locationInView: self];
    int squareSize = self.frame.size.width / 8;
    
    mouseX = (position.y / squareSize);
    mouseY = (position.x / squareSize);
    NSLog(@"X position is %d and Y position is %d",mouseX,mouseY);
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    CGPoint position = [touch locationInView: self];
    int squareSize = self.frame.size.width / 8;
   
    newMouseX = (position.y / squareSize);
     newMouseY = (position.x / squareSize);
    NSLog(@"X position is %d and Y position is %d",newMouseX,newMouseY);
    [self.delegate moveHappened:mouseX and:mouseY withNewX:newMouseX withNewY:newMouseY chessArray:self->chessBoard1];
                        
}


-(void)drawImage:(int)i withImageNamed:(NSString*)imageNamed withSquaresize:(int)squareSize{
    
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
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
