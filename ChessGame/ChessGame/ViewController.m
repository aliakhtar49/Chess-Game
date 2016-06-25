//
//  ViewController.m
//  ChessGame
//
//  Created by Ali Akhtar on 6/12/16.
//  Copyright © 2016 Ali Akhtar. All rights reserved.
//

#import "ViewController.h"

#if __has_feature(objc_arc)
#define MDLog(format, ...) CFShow((__bridge CFStringRef)[NSString stringWithFormat:format, ## __VA_ARGS__]);
#else
#define MDLog(format, ...) CFShow([NSString stringWithFormat:format, ## __VA_ARGS__]);
#endif

@interface ViewController (){
   
    int globalDepth;
  __strong  NSString* chessBoard1[8][8];
    int kingPositionC, kingPositionL;
    

}

@end

@implementation ViewController

-(NSString*)alphaBeta:(int)depth withFirst:(int)beta withSecond:(int)alpha withThird:(NSString*)move withFour:(int)player{
    //return in the form of 1234b##########
    //String list=posibleMoves();
    NSString* list=@"1";
    if (depth==0 || list.length ==0) {
        return [NSString stringWithFormat:@"%@%d",move,(([self rating])*(player*2-1))];
        
    }
    list=@"";
    int temp = 0;
    printf("Enter the first number: \n");
    scanf("%i",&temp);
   printf("\n");
    
    //int temp=sc.nextInt();
    for (int i=0;i<temp;i++) {
        list = [NSString stringWithFormat:@"%@1111b",list];
      //  list+="1111b";
    }
    //sort later
    player=1-player;//either 1 or 0
    for (int i=0;i<list.length;i+=5) {
        
       // [self makeMove:[list substringWithRange:NSMakeRange(i, i+5)]];
        NSString* returnString =[self alphaBeta:depth-1 withFirst:beta withSecond:alpha withThird:[list substringWithRange:NSMakeRange(i, i+5)] withFour:player];
        int value = [[returnString substringWithRange:NSMakeRange(5, 1)] intValue];
      
        
       // [self undoMove:[list substringWithRange:NSMakeRange(i, i+5)]];
        if (player==0) {
            if (value<=beta) {beta=value; if (depth==globalDepth) {move=[returnString substringWithRange:NSMakeRange(0, 5)];}}
        } else {
            if (value>alpha) {alpha=value; if (depth==globalDepth) {move=[returnString substringWithRange:NSMakeRange(0, 5)];}}
        }
        if (alpha>=beta) {
            if (player==0) {
                 return [NSString stringWithFormat:@"%@%d",move,beta];
               
            } else {
                 return [NSString stringWithFormat:@"%@%d",move,alpha];
                
            }
        }
    }
    if (player==0) {return [NSString stringWithFormat:@"%@%d",move,beta];} else {return [NSString stringWithFormat:@"%@%d",move,alpha];}
}


-(int)rating{
    MDLog(@"What is the score: ");
    int temp;
    scanf("%d", &temp);
    return temp;
}
- (void)viewDidLoad {
    
   
    
  
   
    [super viewDidLoad];
    globalDepth = 4;
    
    
    
    
    NSString* chessBoard[8][8] ={
       // 0    1    2    3    4    5   6    7
        @"r",@"k",@"b",@"q",@"a",@"b",@"k",@"r",  // 0
        
        @"p",@"p",@"p",@"p",@"p",@"p",@"p",@"p",  // 1
        
        @" ",@" ",@" ",@" ",@" ",@" ",@" ",@" ",  // 2
        
        @" ",@" ",@" ",@"B",@" ",@" ",@" ",@" ",  // 3
        
        @"P",@"K",@" ",@" ",@" ",@" ",@" ",@" ",  // 4
        
        @"A",@"P",@" ",@" ",@" ",@" ",@" ",@" ",  // 5
        
        @"P",@"P",@"P",@"P",@"P",@"P",@"P",@"P",  // 6
        
        @"R",@"K",@"B",@"A",@"Q",@" ",@"K",@"R"}; // 7
    
   MDLog(@"%@",[self posibleMoves:chessBoard]);
   

  
}

-(NSString*) posibleMoves:(__strong NSString* [8][8])chessBoard{
    NSString* list=@"";
    for (int i=0; i<64; i++) {
//        if([chessBoard[i/8][i%8] isEqualToString:@"A"]){
//            list = [NSString stringWithFormat:@"%@%@",list,[self posibleA:i with:chessBoard]];
//        }
//        if([chessBoard[i/8][i%8] isEqualToString:@"Q"]){
//            list = [NSString stringWithFormat:@"%@%@",list,[self posibleQ:i with:chessBoard]];
//        }
        
        if([chessBoard[i/8][i%8] isEqualToString:@"B"]){
            list = [NSString stringWithFormat:@"%@%@",list,[self posibleB:i with:chessBoard]];
        }
    }
    
    return list;//x1,y1,x2,y2,captured piece
}
//Bishop
-(NSString*)posibleB:(int)i with:(__strong NSString* [8][8])chessBoard{
    NSString* list=@"";
    NSString*oldPiece;
    int r=i/8, c=i%8;
    int temp=1;
    for (int j=-1; j<=1; j+=2) {
        for (int k=-1; k<=1; k+=2) {
            //            if((((r+temp*j) >=0) &&((r+temp*j) <=7)) && (((c+temp*k)>=0)&&((c+temp*k)<=7) )){
            if(((r+temp*j) >=0) && ((r+(temp*j)) <=7) && ((c+(temp*k))>=0) && ((c+(temp*k))<=7)){
                
                
                while(([chessBoard[r+(temp*j)][c+(temp*k)] isEqualToString:@" "]))
                    
                {
                    int a = r+ (temp*j);
                    int b = c+(temp*k);
                    if( ((a>=0) && (a<=7)) &&( (b >= 0) && (b <= 7)) ){
                        
                        if( j==0 && k==1 && temp == 4){
                            NSLog(@"ddjd");
                        }
                        
                        
                        oldPiece=chessBoard[r+temp*j][c+temp*k];
                        chessBoard[r][c]=@" ";
                        chessBoard[r+temp*j][c+temp*k]=@"Q";
                        if ([self kingSafe]) {
                            list = [NSString stringWithFormat:@"%@%d%d%d%d%@",list,r,c,(r+temp*j),(c+temp*k),oldPiece];
                            // MDLog(@"%@",list);
                        }
                        
                        chessBoard[r][c]=@"Q";
                        chessBoard[r+temp*j][c+temp*k]=oldPiece;
                        temp++;
                    }
                    else{
                        break;
                    }
                }
                
                BOOL isLowercase = [[NSCharacterSet lowercaseLetterCharacterSet] characterIsMember:[chessBoard[r+(temp*j)][c+(temp*k)] characterAtIndex:0]];
                if (isLowercase) {
                    if(((r+temp*j) >=0)&&((r+(temp*j)) <=7)&&((c+(temp*k))>=0)&&((c+(temp*k))<=7)){
                        oldPiece=chessBoard[r+temp*j][c+temp*k];
                        chessBoard[r][c]=@" ";
                        chessBoard[r+temp*j][c+temp*k]=@"Q";
                        if ([self kingSafe]) {
                            list = [NSString stringWithFormat:@"%@%d%d%d%d%@",list,r,c,(r+temp*j),(c+temp*k),oldPiece];
                            // MDLog(@"%@",list);
                        }
                        
                        chessBoard[r][c]=@"Q";
                        chessBoard[r+temp*j][c+temp*k]=oldPiece;
                    }
                }
                
                temp=1;
            }
        }
    }
    return list;
}

//Queen Possible
-(NSString*)posibleQ:(int)i with:(__strong NSString* [8][8])chessBoard{
    NSString* list=@"";
    NSString*oldPiece;
    int r=i/8, c=i%8;
    int temp=1;
    for (int j=-1; j<=1; j++) {
        for (int k=-1; k<=1; k++) {
//            if((((r+temp*j) >=0) &&((r+temp*j) <=7)) && (((c+temp*k)>=0)&&((c+temp*k)<=7) )){
            if(((r+temp*j) >=0) && ((r+(temp*j)) <=7) && ((c+(temp*k))>=0) && ((c+(temp*k))<=7)){
                
                
                while(([chessBoard[r+(temp*j)][c+(temp*k)] isEqualToString:@" "]))
                    
                {
                    int a = r+ (temp*j);
                    int b = c+(temp*k);
                    if( ((a>=0) && (a<=7)) &&( (b >= 0) && (b <= 7)) ){
                   
                    if( j==0 && k==1 && temp == 4){
                        NSLog(@"ddjd");
                    }
                    
                    
                    oldPiece=chessBoard[r+temp*j][c+temp*k];
                    chessBoard[r][c]=@" ";
                    chessBoard[r+temp*j][c+temp*k]=@"Q";
                    if ([self kingSafe]) {
                        list = [NSString stringWithFormat:@"%@%d%d%d%d%@",list,r,c,(r+temp*j),(c+temp*k),oldPiece];
                       // MDLog(@"%@",list);
                    }
                   
                    chessBoard[r][c]=@"Q";
                    chessBoard[r+temp*j][c+temp*k]=oldPiece;
                    temp++;
                }
                    else{
                        break;
                    }
                }
                
                     BOOL isLowercase = [[NSCharacterSet lowercaseLetterCharacterSet] characterIsMember:[chessBoard[r+(temp*j)][c+(temp*k)] characterAtIndex:0]];
                if (isLowercase) {
                    if(((r+temp*j) >=0)&&((r+(temp*j)) <=7)&&((c+(temp*k))>=0)&&((c+(temp*k))<=7)){
                    oldPiece=chessBoard[r+temp*j][c+temp*k];
                    chessBoard[r][c]=@" ";
                    chessBoard[r+temp*j][c+temp*k]=@"Q";
                    if ([self kingSafe]) {
                        list = [NSString stringWithFormat:@"%@%d%d%d%d%@",list,r,c,(r+temp*j),(c+temp*k),oldPiece];
                        // MDLog(@"%@",list);
                    }
                   
                    chessBoard[r][c]=@"Q";
                    chessBoard[r+temp*j][c+temp*k]=oldPiece;
                }
                }
           
            temp=1;
        }
        }
    }
    return list;
}

//Possible King Operation
-(NSString*)posibleA:(int)i with:(__strong NSString* [8][8])chessBoard{
    NSString* list=@"";
    NSString*oldPiece;
    int r=i/8, c=i%8;
    for (int j=0; j<9; j++) {
    if (j!=4) {
        if((r-1+j/3) >=0 && (c-1+j%3) >=0){
                                @try {
                                   BOOL isLowercase = [[NSCharacterSet lowercaseLetterCharacterSet] characterIsMember:[chessBoard[r-1+j/3][c-1+j%3] characterAtIndex:0]];
                                    if (isLowercase || ([chessBoard[r-1+j/3][c-1+j%3] isEqualToString:@" "])) {
                                        oldPiece=chessBoard[r-1+j/3][c-1+j%3];
                                        chessBoard[r][c]=@" ";
                                        chessBoard[r-1+j/3][c-1+j%3]=@"A";
                                        int kingTemp=kingPositionC;
                                        kingPositionC=i+(j/3)*8+j%3-9;
                                        if ([self kingSafe]) {
                                            list = [NSString stringWithFormat:@"%@%d%d%d%d%@",list,r,c,(r-1+j/3),(c-1+j%3),oldPiece];
                                        }
                                        chessBoard[r][c]=@"A";
                                        chessBoard[r-1+j/3][c-1+j%3]=oldPiece;
                                        kingPositionC=kingTemp;
                                    }
                                } @catch (NSException *e) {
                                    NSLog(@"%@Exception",e);
                                }
        @finally {
                    }
        
    
        
                            }
                        }
    }
                        //need to add casting later
                        return list;
}
-(BOOL)kingSafe{
    return  YES;
}
- (void) f:(__strong NSString* [8][8])a{
    for(int i=0;i<8;i++){
        for(int j= 0;j<8;j++){
            NSLog(@"%@",a[i][j]);
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
