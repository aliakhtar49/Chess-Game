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
    
    NSString * const startup[8][8] = { @"rook", @"knight", @"bishop", @"queen", @"king", @"bishop", @"knight", @"rook", @"pawn", @"pawn",@"pawn",@"pawn",@"pawn",@"pawn",@"pawn", @"pawn", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0",@"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"-pawn", @"-pawn", @"-pawn", @"-pawn", @"-pawn", @"-pawn", @"-pawn", @"-pawn", @"-rook", @"-knight", @"-bishop", @"-queen", @"-king", @"-bishop", @"-knight", @"-rook"};
    
  
   
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
