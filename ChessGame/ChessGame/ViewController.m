//
//  ViewController.m
//  ChessGame
//
//  Created by Ali Akhtar on 6/12/16.
//  Copyright © 2016 Ali Akhtar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    int board[8][8];

}

@end

@implementation ViewController

- (void)viewDidLoad {
    
    
    
    
   // NSString* chessBoard[8][8] = { @"r", @"k", @"b", @"q", @"k", @"b", @"k", @"r", @"p", @"p",@"p",@"p",@"p",@"p",@"p", @"p", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0",@"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"R", @"K", @"B", @"Q", @"K", @"B", @"K", @"R", @"-rook", @"-knight", @"-bishop", @"-queen", @"-king", @"-bishop", @"-knight", @"-rook"};
    
    
    ;
  
   
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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
