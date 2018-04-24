//
//  Dice.h
//  Assignment4(Threelow)
//
//  Created by 谷井朝美 on 2018-04-23.
//  Copyright © 2018 Asami Tanii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dice : NSObject

@property int currentValue;
@property BOOL isHeld;

- (void) randomizeValue;
- (void) alwaysThree;
- (NSString *) convertValueToUnicodeSymbols:(int)value;

@end
