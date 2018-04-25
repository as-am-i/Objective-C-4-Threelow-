//
//  Dice.m
//  Assignment4(Threelow)
//
//  Created by 谷井朝美 on 2018-04-23.
//  Copyright © 2018 Asami Tanii. All rights reserved.
//

#import "Dice.h"

@implementation Dice

- (void) randomizeValue{
    self.currentValue = [[NSNumber numberWithInt:arc4random_uniform(6) + 1] intValue];
}

- (void) alwaysThree{
    self.currentValue = 3;
}

- (NSString *) convertValueToUnicodeSymbols:(int)value{
    NSString *symbol = @"🐸";
    switch (value) {
        case 1:
            symbol = @"1️⃣";
            break;
        case 2:
            symbol =  @"2️⃣";
            break;
        case 3:
            symbol =  @"3️⃣";
            break;
        case 4:
            symbol =  @"4️⃣";
            break;
        case 5:
            symbol =  @"5️⃣";
            break;
        case 6:
            symbol =  @"6️⃣";
            break;
        default:
            break;
    }
    return symbol;
}
@end
