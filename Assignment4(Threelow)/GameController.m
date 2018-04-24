//
//  GameController.m
//  Assignment4(Threelow)
//
//  Created by 谷井朝美 on 2018-04-23.
//  Copyright © 2018 Asami Tanii. All rights reserved.
//

#import "GameController.h"
#import "Dice.h"

@implementation GameController

- (instancetype) init{
    self = [super init];
    if (self) {
        _allDices = [NSArray new];
    }
    return self;
}

- (void) holdDie:(int)indexOfDice{
    Dice *dice = [[self allDices] objectAtIndex:indexOfDice];
    dice.isHeld = ![dice isHeld];
}

- (void) resetDice{
    for (Dice *dice in [self allDices]) {
        dice.isHeld = NO;
    }
}

@end
