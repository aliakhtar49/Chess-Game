//
//  DisplayModel.h
//  ChessGame
//
//  Created by Muzzammil on 18/06/2016.
//  Copyright © 2016 Ali Akhtar. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "UIModel.h"


@interface DisplayModel : NSObject
- (id)initWithModel:(UIModel*)model;
-(void)drawBackground:(int)tag view:(UIView*)view imageName:(NSString*)imageName;
-(BOOL)draw:(UIView*)view;
-(void)setButtonsColor:(UIView*)view;
-(void)drawBackgroundColor:(int)tag view:(UIView*)view color:(UIColor*)color;
@end
