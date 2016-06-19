//
//  DisplayModel.m
//  ChessGame
//
//  Created by Muzzammil on 18/06/2016.
//  Copyright © 2016 Ali Akhtar. All rights reserved.
//
#import "BoxModel.h"
#import "DisplayModel.h"
@interface DisplayModel (){
    UIModel *uiModel;
}

@end

@implementation DisplayModel

- (id)initWithModel:(UIModel*)model {
    self = [super init];
    if (self) {
        uiModel = model;
    }
    return self;
}
//maroon = [UIColor colorWithRed:0.71 green:0.071 blue:0.043 alpha:1];

-(void)drawBackground:(int)tag view:(UIView*)view imageName:(NSString*)imageName{
        UIButton *btn = (UIButton *)[view viewWithTag:tag];
        btn.enabled = YES;[btn setTitle:@"" forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}
-(void)drawBackgroundColor:(int)tag view:(UIView*)view color:(UIColor*)color{
    UIButton *btn = (UIButton *)[view viewWithTag:tag];
    [btn setBackgroundColor:color];
}
-(BOOL)draw:(UIView*)view{
    int tag = [BoxModel tagOfCell:uiModel.xy];
    NSString* subject = [BoxModel imageName:uiModel.subject];
    [self drawBackground:tag view:view imageName:subject];
    return YES;
}
-(void)setButtonsColor:(UIView*)view{
    UIColor* odd = [UIColor colorWithRed:0.922 green:0.827 blue:0.6 alpha:1];
    UIColor* even = [UIColor colorWithRed:0.651 green:0.459 blue:0.451 alpha:1];
    UIColor *color;
    int k = 2;
    int y = 1;
    int m = 0 ;
    for(int i=0;i<64;i++){
        int tag = [BoxModel tagOfCell:i];
        if(k==2){
            color = even;
        }
        if(k==1){
            color = odd;
        }
        if(m<7){
        k = k + y ;
        y = k - y;
        k = k - y;
        m++;
        } else m=0;
    [self drawBackgroundColor:tag view:view color:color];
    }
}
@end
