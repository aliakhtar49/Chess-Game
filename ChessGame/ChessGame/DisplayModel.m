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

-(void)drawBackground:(int)tag view:(UIView*)view imageName:(NSString*)imageName{
 
        UIButton *btn = (UIButton *)[view viewWithTag:tag];
        btn.enabled = YES;[btn setTitle:@"" forState:UIControlStateNormal];
        if(tag==122 || tag==144 || tag==166 || tag==188)
        [btn setBackgroundColor:[UIColor redColor]];
        [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}
-(BOOL)draw:(UIView*)view{
    int tag = [BoxModel tagOfCell:uiModel.xy];
    NSString* subject = [BoxModel imageName:uiModel.subject];
    [self drawBackground:tag view:view imageName:subject];
    return YES;
}

@end
