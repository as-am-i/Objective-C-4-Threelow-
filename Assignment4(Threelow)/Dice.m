//
//  Dice.m
//  Assignment4(Threelow)
//
//  Created by 谷井朝美 on 2018-04-23.
//  Copyright © 2018 Asami Tanii. All rights reserved.
//

#import "Dice.h"

@implementation Dice

- (int) randomizeValue{
    return [[NSNumber numberWithInt:arc4random_uniform(6) + 1] intValue];
}

- (NSString *) convertValueToUnicodeSymbols:(int)value{
    NSString *symbol = @"🐸";
    switch (value) {
        case 1:
            symbol = @"⚀";
            break;
        case 2:
            symbol =  @"⚁";
            break;
        case 3:
            symbol =  @"⚂";
            break;
        case 4:
            symbol =  @"⚃";
            break;
        case 5:
            symbol =  @"⚄";
            break;
        case 6:
            symbol =  @"⚅";
            break;
        default:
            break;
    }
    return symbol;
}
@end
