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
    if(index==0)
        return 64;
//    switch (index) {
//        case 0:
//            return 111;
//            break;
//        case 1:
//            return 122;
//            break;
//        case 2:
//            return 133;
//            break;
//        case 3:
//            return 144;
//            break;
//        case 4:
//            return 155;
//            break;
//        case 5:
//            return 166;
//            break;
//        case 6:
//            return 177;
//            break;
//        case 7:
//            return 188;
//            break;
//        case 8:
//            return 211;
//            break;
//        case 9:
//        return 222;
//        break;
//        case 10:
//        return 233;
//        break;
//        case 11:
//        return 244;
//        break;
//        case 12:
//        return 255;
//        break;
//        case 13:
//        return 266;
//        break;
//        case 14:
//        return 277;
//        break;
//        case 15:
//        return 288;
//        break;
//        case 16:
//        return 311;
//        break;
//        case 17:
//        return 322;
//        break;
//        case 18:
//            return 411;
//            break;
//        case 19:
//            return 422;
//            break;
//        case 20:
//            return 433;
//            break;
//        case 21:
//            return 444;
//            break;
//        case 22:
//            return 455;
//            break;
//        case 23:
//            return 466;
//            break;
//        case 24:
//            return 477;
//            break;
//        case 25:
//            return 488;
//            break;
//        case 29:
//            return 511;
//            break;
//        case 30:
//            return 522;
//            break;
//        case 31:
//            return 533;
//            break;
//        case 32:
//            return 544;
//            break;
//        case 33:
//            return 555;
//            break;
//        case 34:
//            return 566;
//            break;
//        case 35:
//            return 577;
//            break;
//        case 36:
//            return 588;
//            break;
//        default:
//            break;
//    }
    return index;
}
+(NSString*)imageName:(NSString*)name{
    BOOL isUppercase = [[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:[name characterAtIndex:0]];
    NSString* co;
    if(isUppercase){
        co = @"w";
    }else co = @"b";
    
    NSString* subject = [NSString stringWithFormat:@"%@%@.png",[name lowercaseString],co];
    return subject;
    
}
@end
