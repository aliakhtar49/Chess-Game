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

@interface GameViewController ()

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self draw:0 name:@"rook"];
    [self draw:1 name:@"knight"];
    [self draw:2 name:@"bishop"];
    [self draw:3 name:@"queen"];
    [self draw:4 name:@"king"];
    [self draw:5 name:@"bishop"];
    [self draw:6 name:@"knight"];
    [self draw:7 name:@"rook"];

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
-(void)draw:(int)index name:(NSString*)name{
    UIModel *uiModel = [UIModel alloc];
    uiModel.xy = index;
    uiModel.subject = name;
    DisplayModel *displayModel = [[DisplayModel alloc]initWithModel:uiModel];
    [displayModel draw:self.view];
}
@end
