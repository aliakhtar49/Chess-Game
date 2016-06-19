//
//  GameViewController.m
//  ChessGame
//
//  Created by Muzzammil on 18/06/2016.
//  Copyright © 2016 Ali Akhtar. All rights reserved.
//

#import "GameViewController.h"
#import "DisplayModel.h"
#import "UIModel.h"
#import "Board.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString* chessBoard[8][8] ={
        @"r",@"k",@"b",@"q",@"a",@"b",@"k",@"r",
        @"p",@"p",@"p",@"p",@"p",@"p",@"p",@"p",
        @" ",@" ",@" ",@" ",@" ",@" ",@" ",@" ",
        @" ",@" ",@" ",@" ",@" ",@" ",@" ",@" ",
        @"r",@"k",@" ",@" ",@" ",@" ",@" ",@" ",
        @"A",@"p",@" ",@" ",@" ",@" ",@" ",@" ",
        @"P",@"P",@"P",@"P",@"P",@"P",@"P",@"P",
        @"R",@"K",@"B",@"Q",@"A",@"B",@"K",@"R"};
    Board * board = [[Board alloc]init];
    [board drawBoard:chessBoard view:self.view];
    
    
//    [self draw:0 name:@"r"];
//    [self draw:1 name:@"k"];
//    [self draw:2 name:@"b"];
//    [self draw:3 name:@"q"];
//    [self draw:4 name:@"k"];
//    [self draw:5 name:@"b"];
//    [self draw:6 name:@"k"];
//    [self draw:7 name:@"r"];
//    [self draw:8 name:@"p"];
//    [self draw:9 name:@"p"];
//    [self draw:10 name:@"p"];
//    [self draw:11 name:@"p"];
//    [self draw:12 name:@"p"];
//    [self draw:13 name:@"p"];
//    [self draw:14 name:@"p"];
//    [self draw:14 name:@"p"];
//    [self draw:14 name:@"p"];
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
