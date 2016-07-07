//
//  ViewController.m
//  ChessGame
//
//  Created by Ali Akhtar on 6/12/16.
//  Copyright © 2016 Ali Akhtar. All rights reserved.
//

#import "ViewController.h"
#import "ChessBoardCustomView.h"

#if __has_feature(objc_arc)
#define MDLog(format, ...) CFShow((__bridge CFStringRef)[NSString stringWithFormat:format, ## __VA_ARGS__]);
#else
#define MDLog(format, ...) CFShow([NSString stringWithFormat:format, ## __VA_ARGS__]);
#endif

@interface ViewController (){
   
    int globalDepth;
  __strong  NSString* chessBoard1[8][8];
    int kingPositionC, kingPositionL;
    int temp_input;
    int moves_Array[16];
    int scores_array[9];
    int moves_arry_count;
    int scores_arry_count;
    

}

@end

@implementation ViewController
-(void)flipBoard:(__strong NSString* [8][8])chessBoard{
    NSString* temp;
    for (int i=0;i<32;i++) {
        int r=i/8, c=i%8;
        
        
        BOOL isUppercase = [[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:[chessBoard[r][c] characterAtIndex:0]];
        if (isUppercase) {
            temp = [chessBoard[r][c] lowercaseString];
            
        } else {
            temp=[chessBoard[r][c] uppercaseString];
        }
        isUppercase = [[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:[chessBoard[7-r][7-c] characterAtIndex:0]];
        if (isUppercase) {
            chessBoard[r][c] = [chessBoard[7-r][7-c] lowercaseString];
            
        } else {
            chessBoard[r][c] = [chessBoard[7-r][7-c] uppercaseString];
           
        }
        chessBoard[7-r][7-c]=temp;
    }
    int kingTemp=kingPositionC;
    kingPositionC=63-kingPositionL;
    kingPositionL=63-kingTemp;
   
}

-(NSString*)alphaBeta:(int)depth withFirst:(int)beta withSecond:(int)alpha withThird:(NSString*)move withFour:(int)player withFive:(__strong NSString* [8][8])chessBoard{
    //return in the form of 1234b##########
    //String list=posibleMoves();
    NSString* list=[self posibleMoves:chessBoard];
    if (depth==0 || list.length ==0) {
        return [NSString stringWithFormat:@"%@%d",move,([self rating]*(player*2-1))];//*(player*2-1))
        
    }
   
//    int temp = moves_Array[moves_arry_count];
//    moves_arry_count++;
   
   
    
    
    
//    for (int i=0;i<temp;i++) {
//        list = [NSString stringWithFormat:@"%@1111b",list];
//      //  list+="1111b";
//    }
    //sort later
    player=1-player;//either 1 or 0
    for (int i=0;i<list.length;i+=5) {
        
        [self makeMove:[list substringWithRange:NSMakeRange(i, 5)] with:chessBoard];
        [self flipBoard:chessBoard];
        NSString* returnString =[self alphaBeta:depth-1 withFirst:beta withSecond:alpha withThird:[list substringWithRange:NSMakeRange(i, 5)] withFour:player withFive:chessBoard];
        int value = [[returnString substringWithRange:NSMakeRange(5, 1)] intValue];
      
        [self flipBoard:chessBoard];
        [self undoMove:[list substringWithRange:NSMakeRange(i, 5)]with:chessBoard];
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
    return 0;
    int a = scores_array[scores_arry_count];
    scores_arry_count++;
    return a;
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        NSString *name = [alertView textFieldAtIndex:0].text;
        temp_input = [name intValue];
        MDLog(@"%d",[name intValue]);
        // Insert whatever needs to be done with "name"
    }
}
- (void)viewDidLoad {
   
    
  
    
   
    [super viewDidLoad];
    
     
    
//    moves_arry_count = 0;
//    scores_arry_count = 0;
//    int  moves_Array1[16] = {3,2,2,2,10,1,1,2,2,1,12,1,1,11,1,1};
//    int scores_array1[9] = {5,6,7,4,3,6,6,7,5};
//    for(int i =0;i<16;i++){
//        moves_Array[i] = moves_Array1[i];
//        if(i<=8){
//            scores_array[i] = scores_array1[i];
//        }
//        
//    }
//    globalDepth = 4;
//    MDLog(@"%@",[self alphaBeta:globalDepth withFirst:1000000 withSecond:-1000000 withThird:@" " withFour:0]);
    
   
//    globalDepth = 4;
//    kingPositionC = 0;
//    kingPositionL = 0;
//    
//  
//    
//    
//    NSString* chessBoard[8][8] ={
//       // 0    1    2    3    4    5   6    7
//        @"r",@"k",@"b",@"q",@"a",@"b",@"k",@"r",  // 0
//        
//        @"p",@"p",@"p",@"p",@"p",@"p",@"p",@"p",  // 1
//        
//        @" ",@" ",@" ",@" ",@" ",@" ",@" ",@" ",  // 2
//        
//        @" ",@" ",@" ",@" ",@" ",@" ",@" ",@" ",  // 3
//        
//        @" ",@" ",@" ",@" ",@" ",@" ",@" ",@" ",  // 4
//        
//        @" ",@" ",@" ",@" ",@" ",@" ",@" ",@" ",  // 5
//        
//        @"P",@"P",@"P",@"P",@"P",@"P",@"P",@"P",  // 6
//        
//        @"R",@"K",@"B",@"Q",@"A",@"B",@"K",@"R"}; // 7
//    
//        while (!([chessBoard[kingPositionC/8][kingPositionC%8] isEqualToString:@"A"]))
//        
//    {
//        kingPositionC++;
//    }
//    
//    while (!([chessBoard[kingPositionL/8][kingPositionL%8] isEqualToString:@"a"]))
//        
//    {
//        kingPositionL++;
//    }
//   //[self makeMove:[self alphaBeta:globalDepth withFirst:1000000 withSecond:-1000000 withThird:@" " withFour:0 with:chessBoard]
//    [self makeMove:[self alphaBeta:globalDepth withFirst:1000000 withSecond:-1000000 withThird:@" " withFour:0 withFive:chessBoard] with:chessBoard];
//    
//    for(int i = 0;i<8;i++){
//        for(int j=0;j<8;j++){
//            printf("\"%s\"\t",[chessBoard[i][j] UTF8String]);
//        }
//        printf("\n");
//    }
//   
  
    
    

   

  
}


-(NSString*) posibleMoves:(__strong NSString* [8][8])chessBoard{
    NSString* list=@"";
    for (int i=0; i<64; i++) {
        if([chessBoard[i/8][i%8] isEqualToString:@"A"]){
            list = [NSString stringWithFormat:@"%@%@",list,[self posibleA:i with:chessBoard]];
        }
       else if([chessBoard[i/8][i%8] isEqualToString:@"Q"]){
            list = [NSString stringWithFormat:@"%@%@",list,[self posibleQ:i with:chessBoard]];
        }
        
        else if([chessBoard[i/8][i%8] isEqualToString:@"B"]){
            list = [NSString stringWithFormat:@"%@%@",list,[self posibleB:i with:chessBoard]];
        }
        else if([chessBoard[i/8][i%8] isEqualToString:@"R"]){
                        list = [NSString stringWithFormat:@"%@%@",list,[self posibleR:i with:chessBoard]];
                    }
        else if([chessBoard[i/8][i%8] isEqualToString:@"K"]){
            list = [NSString stringWithFormat:@"%@%@",list,[self posibleK:i with:chessBoard]];
        }
        else if([chessBoard[i/8][i%8] isEqualToString:@"P"]){
            list = [NSString stringWithFormat:@"%@%@",list,[self posibleP:i with:chessBoard]];
        }
        
        
    }
    
    return list;//x1,y1,x2,y2,captured piece
}

-(NSString*)posibleK:(int)i with:(__strong NSString* [8][8])chessBoard{
    NSString* list=@"";
    NSString*oldPiece;
    int r=i/8, c=i%8;
    for (int j=-1; j<=1; j+=2) {
        for (int k=-1; k<=1; k+=2) {
           
            
                    if(((r+j) >=0) && ((r+j) <=7) && ((c+k*2)>=0) && ((c+k*2)<=7)){
                    BOOL isLowercase = [[NSCharacterSet lowercaseLetterCharacterSet] characterIsMember:[chessBoard[r+j][c+k*2] characterAtIndex:0]];
                    if (isLowercase || ([chessBoard[r+j][c+k*2] isEqualToString:@" "])) {
                        
                            oldPiece=chessBoard[r+j][c+k*2];
                            chessBoard[r][c]=@" ";
                            chessBoard[r+j][c+k*2]=@"K";
                        if ([self kingSafe:chessBoard]) {
                                list = [NSString stringWithFormat:@"%@%d%d%d%d%@",list,r,c,(r+j),(c+k*2),oldPiece];
                                // MDLog(@"%@",list);
                            }
                            
                            chessBoard[r][c]=@"K";
                            chessBoard[r+j][c+k*2]=oldPiece;
                        
                    }
        }
            if( ((r+j*2) >=0) && ((r+j*2) <=7) && ((c+k)>=0) && ((c+k)<=7) ){
                   BOOL isLowercase = [[NSCharacterSet lowercaseLetterCharacterSet] characterIsMember:[chessBoard[r+j*2][c+k] characterAtIndex:0]];
                    if (isLowercase || ([chessBoard[r+j*2][c+k] isEqualToString:@" "])) {
                        
                        oldPiece=chessBoard[r+j*2][c+k];
                        chessBoard[r][c]=@" ";
                        chessBoard[r+j*2][c+k]=@"K";
                        if ([self kingSafe:chessBoard]) {
                            list = [NSString stringWithFormat:@"%@%d%d%d%d%@",list,r,c,(r+j*2),(c+k),oldPiece];
                            // MDLog(@"%@",list);
                        }
                        
                        chessBoard[r][c]=@"K";
                        chessBoard[r+j*2][c+k]=oldPiece;
                        
                    }
        }
        
                    
                
            }
            
        }
    
    //need to add casting later
    return list;
}

-(NSString*)posibleP:(int)i with:(__strong NSString* [8][8])chessBoard{
    NSString* list=@"";
    NSString*oldPiece;
    int r=i/8, c=i%8;
    for (int j=-1; j<=1; j+=2) {
       //capture
        if(  ((r-1) >=0) && ((r-1) <=7) && ((c+j)>=0) && ((c+j)<=7) ){
        BOOL isLowercase = [[NSCharacterSet lowercaseLetterCharacterSet] characterIsMember:[chessBoard[r-1][c+j] characterAtIndex:0]];
        if ((isLowercase) && i>=16) {
            
                oldPiece=chessBoard[r-1][c+j];
                chessBoard[r][c]=@" ";
                chessBoard[r-1][c+j]=@"P";
                if ([self kingSafe:chessBoard]) {
                    list = [NSString stringWithFormat:@"%@%d%d%d%d%@",list,r,c,(r-1),(c+j),oldPiece];
                    
                }
                chessBoard[r][c]=@"P";
                chessBoard[r-1][c+j]=oldPiece;
            }
    
        
        //promotion && capture
        if ((isLowercase) && i<16) {
           // if (Character.isLowerCase(chessBoard[r-1][c+j].charAt(0)) && i<16) {
                NSString*temp[4]={@"Q",@"R",@"B",@"K"};
                for (int k=0; k<4; k++) {
                    oldPiece=chessBoard[r-1][c+j];
                    chessBoard[r][c]=@" ";
                    chessBoard[r-1][c+j]=temp[k];
                    if ([self kingSafe:chessBoard]) {
                        //column1,column2,captured-piece,new-piece,P
                        list = [NSString stringWithFormat:@"%@%d%d%@%@%@",list,c,(c+j),oldPiece,temp[k],@"P"];
                      
                    }
                    chessBoard[r][c]=@"P";
                    chessBoard[r-1][c+j]=oldPiece;
                }
            }
        }
       
    }
    //move one up
     if(  ((r-1) >=0) && ((r-1) <=7) && ((c)>=0) && ((c)<=7) ){
    if (([chessBoard[r-1][c] isEqualToString:@" "]) && i>=16) {
            oldPiece=chessBoard[r-1][c];
            chessBoard[r][c]=@" ";
            chessBoard[r-1][c]=@"P";
            if ([self kingSafe:chessBoard]) {
                list = [NSString stringWithFormat:@"%@%d%d%d%d%@",list,r,c,(r-1),(c),oldPiece];
                            }
            chessBoard[r][c]=@"P";
            chessBoard[r-1][c]=oldPiece;
        }
   
    //promotion && no capture
    if (([chessBoard[r-1][c] isEqualToString:@" "]) && i<16) {
    
            NSString*temp[4]={@"Q",@"R",@"B",@"K"};
            for (int k=0; k<4; k++) {
                oldPiece=chessBoard[r-1][c];
                chessBoard[r][c]=@" ";
                chessBoard[r-1][c]=temp[k];
                if ([self kingSafe:chessBoard]) {
                    //column1,column2,captured-piece,new-piece,P
                     list = [NSString stringWithFormat:@"%@%d%d%@%@%@",list,c,(c),oldPiece,temp[k],@"P"];
                  
                }
                chessBoard[r][c]=@"P";
                chessBoard[r-1][c]=oldPiece;
            }
        }
     }
    
    //move two up
      if(  ((r-1) >=0) && ((r-1) <=7) && ((r-2)>=0) && ((r-2)<=7) ){
    if (([chessBoard[r-1][c] isEqualToString:@" "]) && ([chessBoard[r-2][c] isEqualToString:@" "]) && i>=48) {
            oldPiece=chessBoard[r-2][c];
            chessBoard[r][c]=@" ";
            chessBoard[r-2][c]=@"P";
            if ([self kingSafe:chessBoard]) {
                 list = [NSString stringWithFormat:@"%@%d%d%d%d%@",list,r,c,(r-2),(c),oldPiece];
            }
            chessBoard[r][c]=@"P";
            chessBoard[r-2][c]=oldPiece;
        }
      }
    
    return list;
}
//Rock
-(NSString*)posibleR:(int)i with:(__strong NSString* [8][8])chessBoard{
    NSString* list=@"";
    NSString*oldPiece;
    int r=i/8, c=i%8;
    int temp=1;
    for (int j=-1; j<=1; j++) {
        for (int k=-1; k<=1; k++) {
            if(j==0 || k==0){
                if(((r+temp*j) >=0) && ((r+(temp*j)) <=7) && ((c+(temp*k))>=0) && ((c+(temp*k))<=7)){
                    
                    
                    while(([chessBoard[r+(temp*j)][c+(temp*k)] isEqualToString:@" "]))
                        
                    {
                        int a = r+ (temp*j);
                        int b = c+(temp*k);
                        if( ((a>=0) && (a<=7)) &&( (b >= 0) && (b <= 7)) ){
                            
                            if( j==0 && k==1 && temp == 4){
                               
                            }
                            
                            
                            oldPiece=chessBoard[r+temp*j][c+temp*k];
                            chessBoard[r][c]=@" ";
                            chessBoard[r+temp*j][c+temp*k]=@"Q";
                            if ([self kingSafe:chessBoard]) {
                                list = [NSString stringWithFormat:@"%@%d%d%d%d%@",list,r,c,(r+temp*j),(c+temp*k),oldPiece];
                                // MDLog(@"%@",list);
                            }
                            
                            chessBoard[r][c]=@"Q";
                            chessBoard[r+temp*j][c+temp*k]=oldPiece;
                            temp++;
                            if(!(((r+temp*j) >=0) && ((r+(temp*j)) <=7) && ((c+(temp*k))>=0) && ((c+(temp*k))<=7))){
                                break;
                            }
                        }
                        else{
                            break;
                        }
                    }
                    if(((r+temp*j) >=0)&&((r+(temp*j)) <=7)&&((c+(temp*k))>=0)&&((c+(temp*k))<=7)){
                    BOOL isLowercase = [[NSCharacterSet lowercaseLetterCharacterSet] characterIsMember:[chessBoard[r+(temp*j)][c+(temp*k)] characterAtIndex:0]];
                    if (isLowercase) {
                        
                            oldPiece=chessBoard[r+temp*j][c+temp*k];
                            chessBoard[r][c]=@" ";
                            chessBoard[r+temp*j][c+temp*k]=@"Q";
                            if ([self kingSafe:chessBoard]) {
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
    }
    return list;
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
                            
                        }
                        
                        
                        oldPiece=chessBoard[r+temp*j][c+temp*k];
                        chessBoard[r][c]=@" ";
                        chessBoard[r+temp*j][c+temp*k]=@"Q";
                        if([self kingSafe:chessBoard]){
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
                        if ([self kingSafe:chessBoard]) {
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
                   
                    if( j==0 && k==1 && temp == 3){
                       
                    }
                    
                    
                    oldPiece=chessBoard[r+temp*j][c+temp*k];
                    chessBoard[r][c]=@" ";
                    chessBoard[r+temp*j][c+temp*k]=@"Q";
                    if ([self kingSafe:chessBoard]) {
                        list = [NSString stringWithFormat:@"%@%d%d%d%d%@",list,r,c,(r+temp*j),(c+temp*k),oldPiece];
                       // MDLog(@"%@",list);
                    }
                   
                    chessBoard[r][c]=@"Q";
                    chessBoard[r+temp*j][c+temp*k]=oldPiece;
                    temp++;
                          if(!(((r+temp*j) >=0) && ((r+(temp*j)) <=7) && ((c+(temp*k))>=0) && ((c+(temp*k))<=7))){
                             break;
                         }
                }
                    else{
                        break;
                    }
                }
                 if(((r+temp*j) >=0)&&((r+(temp*j)) <=7)&&((c+(temp*k))>=0)&&((c+(temp*k))<=7)){
                
                     BOOL isLowercase = [[NSCharacterSet lowercaseLetterCharacterSet] characterIsMember:[chessBoard[r+(temp*j)][c+(temp*k)] characterAtIndex:0]];
                if (isLowercase) {
                   
                    oldPiece=chessBoard[r+temp*j][c+temp*k];
                    chessBoard[r][c]=@" ";
                    chessBoard[r+temp*j][c+temp*k]=@"Q";
                    if ([self kingSafe:chessBoard]) {
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
            
                                     if(((r-1+j/3) >=0) && ((r-1+j/3) <=7) && ((c-1+j%3)>=0) && ((c-1+j%3)<=7)){
                                   BOOL isLowercase = [[NSCharacterSet lowercaseLetterCharacterSet] characterIsMember:[chessBoard[r-1+j/3][c-1+j%3] characterAtIndex:0]];
                                    if (isLowercase || ([chessBoard[r-1+j/3][c-1+j%3] isEqualToString:@" "])) {
                                        oldPiece=chessBoard[r-1+j/3][c-1+j%3];
                                        chessBoard[r][c]=@" ";
                                        chessBoard[r-1+j/3][c-1+j%3]=@"A";
                                        int kingTemp=kingPositionC;
                                        kingPositionC=i+(j/3)*8+j%3-9;
                                        if ([self kingSafe:chessBoard]) {
                                            list = [NSString stringWithFormat:@"%@%d%d%d%d%@",list,r,c,(r-1+j/3),(c-1+j%3),oldPiece];
                                        }
                                        chessBoard[r][c]=@"A";
                                        chessBoard[r-1+j/3][c-1+j%3]=oldPiece;
                                        kingPositionC=kingTemp;
                                    }
                                     }
            
    
        
                            }
                        }
    }
                        //need to add casting later
                        return list;
}
-(BOOL)kingSafe:(__strong NSString* [8][8])chessBoard{
    //bishop/queen
    int temp=1;
    int r  = kingPositionC/8;
    int c =kingPositionC%8;
    for (int i=-1; i<=1; i+=2) {
        for (int j=-1; j<=1; j+=2) {
            
            if( ((r+temp*i) >=0) && ((r+temp*i) <=7) && ((c+temp*j)>=0) && ((c+temp*j)<=7) ){
            @try {
                
                while(([chessBoard[r+temp*i][c+temp*j] isEqualToString:@" "])){
                    temp++;
                    if(!( ((r+temp*i) >=0)  && ((r+temp*i) <=7) &&((c+temp*j)>=0) &&((c+temp*j)<=7) )){
                        break;
                    }
                
                }
                if(((r+temp*i) >=0) && ((r+temp*i) <=7) && ((c+temp*j)>=0) && ((c+temp*j)<=7)){
                if(([chessBoard[r+temp*i][c+temp*j] isEqualToString:@"b"]) || ([chessBoard[r+temp*i][c+temp*j] isEqualToString:@"q"]) )
                {
                    return false;
                }
                }
            } @catch (NSException* e) {}
            temp=1;
        }
        }
    }
    //rook/queen
    for (int i=-1; i<=1; i+=2) {
        
            if(((r) >=0) && ((r) <=7) && ((c+temp*i)>=0) && ((c+temp*i)<=7)){
            while(([chessBoard[r][c+temp*i] isEqualToString:@" "])){
                temp++;
                if(!(((r) >=0) && ((r) <=7) && ((c+temp*i)>=0) && ((c+temp*i)<=7))){
                    break;
                }
            }
                if(((r) >=0) && ((r) <=7) && ((c+temp*i)>=0) && ((c+temp*i)<=7)){
            if(([chessBoard[r][c+temp*i] isEqualToString:@"r"]) || ([chessBoard[r][c+temp*i] isEqualToString:@"q"]) )
            {
                return false;
            }
                }
        }
        temp=1;
    
        @try {
            if((((r+temp*i) >=0) && ((r+temp*i) <=7) && ((c)>=0) && ((c)<=7))){
            
            while(([chessBoard[r+temp*i][c] isEqualToString:@" "])){
                temp++;
                if(!(((r+temp*i) >=0) && ((r+temp*i) <=7) && ((c)>=0) && ((c)<=7))){
                    break;
                }
            }if((((r+temp*i) >=0) && ((r+temp*i) <=7) && ((c)>=0) && ((c)<=7))){
            if(([chessBoard[r+temp*i][c] isEqualToString:@"r"]) || ([chessBoard[r+temp*i][c] isEqualToString:@"q"]) )
            {
                return false;
            }
            }
        }

        } @catch (NSException* e) {}
        temp=1;
    }
    
    
    //knight
    for (int i=-1; i<=1; i+=2) {
        for (int j=-1; j<=1; j+=2) {
          
            if((((r+i) >=0) && ((r+i) <=7) && ((c+j*2)>=0) && ((c+j*2)<=7) && (r+i*2>=0) && (r+i*2<=7) && (c+j>=0) && (c+j<=7) )){
            if( ([chessBoard[r+i][c+j*2] isEqualToString:@"k"]) || ([chessBoard[r+i*2][c+j] isEqualToString:@"k"])){
                return false;
                
            }
            }
           
        }
    }
    
    
    //pawn
    if (kingPositionC>=16) {
        if((((r-1) >=0) && ((r-1) <=7) && ((c-1)>=0) && ((c-1)<=7) && (c+1>=0) && (c+1<=7))){
            if( ([chessBoard[r-1][c-1] isEqualToString:@"p"]) || ([chessBoard[r-1][c+1] isEqualToString:@"p"])){
                return false;
                
            }
        }
        
       
        //king
        for (int i=-1; i<=1; i++) {
            for (int j=-1; j<=1; j++) {
                if (i!=0 || j!=0) {
                    if((((r+i) >=0) && ((r+i) <=7) && ((c+j)>=0) && ((c+j)<=7))){
                    if( ([chessBoard[r+i][c+j] isEqualToString:@"a"])){
                        return false;
                    }
                        
                    }
                }
            }
        }
    }
    return  YES;
}
- (void) f:(__strong NSString* [8][8])a{
    for(int i=0;i<8;i++){
        for(int j= 0;j<8;j++){
            NSLog(@"%@",a[i][j]);
        }
    }
}

-(void)makeMove:(NSString *) move with:(__strong NSString* [8][8])chessBoard{
    
   
    
    if([move characterAtIndex:4] !='P'){
        chessBoard[[[move substringWithRange:NSMakeRange(2, 1)] integerValue]][[[move substringWithRange:NSMakeRange(3, 1)] integerValue]] = chessBoard[[[move substringWithRange:NSMakeRange(0, 1)] integerValue]][[[move substringWithRange:NSMakeRange(1, 1)] integerValue]];
        chessBoard[[[move substringWithRange:NSMakeRange(0, 1)] integerValue]][[[move substringWithRange:NSMakeRange(1, 1)] integerValue]] = @" ";
        
        if([chessBoard[[[move substringWithRange:NSMakeRange(2, 1)] integerValue]][[[move substringWithRange:NSMakeRange(3, 1)] integerValue]] isEqualToString:@"A"]){
             kingPositionC=8*[[move substringWithRange:NSMakeRange(2, 1)]intValue]+[[move substringWithRange:NSMakeRange(3, 1)]intValue];
            
        }

    }
    else{
        chessBoard[1][[[move substringWithRange:NSMakeRange(0, 1)] integerValue]]=@" ";
        chessBoard[0][[[move substringWithRange:NSMakeRange(1, 1)] integerValue]]=[move substringWithRange:NSMakeRange(3, 1)];
    }
  
}
-(void)undoMove:(NSString *) move with:(__strong NSString* [8][8])chessBoard{
    
    
    
    if([move characterAtIndex:4] !='P'){
       
        chessBoard[[[move substringWithRange:NSMakeRange(0, 1)] integerValue]][[[move substringWithRange:NSMakeRange(1, 1)] integerValue]] = chessBoard[[[move substringWithRange:NSMakeRange(2, 1)] integerValue]][[[move substringWithRange:NSMakeRange(3, 1)] integerValue]];
         chessBoard[[[move substringWithRange:NSMakeRange(2, 1)] integerValue]][[[move substringWithRange:NSMakeRange(3, 1)] integerValue]] = [move substringWithRange:NSMakeRange(4, 1)];
        
        if([chessBoard[[[move substringWithRange:NSMakeRange(0, 1)] integerValue]][[[move substringWithRange:NSMakeRange(1, 1)] integerValue]] isEqualToString:@"A"]){
            kingPositionC=8*[[move substringWithRange:NSMakeRange(0, 1)]intValue]+[[move substringWithRange:NSMakeRange(1, 1)]intValue];
            
        }
    }
    else{
        chessBoard[1][[[move substringWithRange:NSMakeRange(0, 1)] integerValue]]=@"P";
        chessBoard[0][[[move substringWithRange:NSMakeRange(1, 1)] integerValue]]=[move substringWithRange:NSMakeRange(4, 1)];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
