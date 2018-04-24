//
//  GameController.m
//  Assignment4(Threelow)
//
//  Created by 谷井朝美 on 2018-04-23.
//  Copyright © 2018 Asami Tanii. All rights reserved.
//

#import "GameController.h"

@implementation GameController

- (instancetype) init{
    self = [super init];
    if (self) {
        _allDices = [NSArray new];
        _heldDices = [NSMutableArray array];
    }
    return self;
}

- (void) holdDice:(int)numberOfDices{
    for (int num = 0; num < numberOfDices; num++) {
        [[self heldDices] addObject:[[self allDices] objectAtIndex:num]];
    }
}

@end
