//
//  BoxModel.m
//  ChessGame
//
//  Created by Muzzammil on 18/06/2016.
//  Copyright © 2016 Ali Akhtar. All rights reserved.
//

#import "BoxModel.h"

@implementation BoxModel

+(int)tagOfCell:(int)index{
    switch (index) {
        case 0:
            return 111;
            break;
        case 1:
            return 122;
            break;
        case 2:
            return 133;
            break;
        case 3:
            return 144;
            break;
        case 4:
            return 155;
            break;
        case 5:
            return 166;
            break;
        case 6:
            return 177;
            break;
        case 7:
            return 188;
            break;
        case 8:
            return 211;
            break;
        default:
            break;
    }
    return -1;
}
+(NSString*)imageName:(NSString*)name{
    
    if([name isEqualToString:@"rook"])
        return @"rook_black.png";
    else if([name isEqualToString:@"knight"])
        return @"knight_black.png";
    else if([name isEqualToString:@"bishop"])
        return @"bishop_black.png";
    else if([name isEqualToString:@"queen"])
        return @"queen_black.png";
    else if([name isEqualToString:@"king"])
        return @"king_black.png";
    else if([name isEqualToString:@"bishop"])
        return @"bishop_black.png";
    else if([name isEqualToString:@"knight"])
        return @"knight_black.png";
    else if([name isEqualToString:@"rook"])
        return @"rook_black.png";
    else if ([name isEqualToString:@"pawn"]){
        return @"pawn_black";
    }
    return @"";
}
@end
