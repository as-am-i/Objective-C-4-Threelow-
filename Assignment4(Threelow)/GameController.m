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
        _heldDices = [NSMutableArray array];
    }
    return self;
}

- (BOOL) holdDie:(NSString *)userInput{
    int indexOfDice = [userInput intValue] - 1;
    BOOL isSelected = NO;
    
    if (indexOfDice < 5 && indexOfDice >= 0) {
        Dice *dice = [[self allDices] objectAtIndex:indexOfDice];
        dice.isHeld = ![dice isHeld];
        
        if ([dice isHeld] == YES) {
            [[self heldDices] addObject:dice];
            isSelected = YES;
        } else {
            [[self heldDices] removeObject:dice];
        }
    } 
    return isSelected;
}

- (void) resetDice{
    self.rolls = 0;
    for (Dice *dice in [self allDices]) {
        dice.isHeld = NO;
    }
    [[self heldDices] removeAllObjects];
}

- (NSString *) calculateScores{
    int sum = 0;
    for (Dice *dice in [self heldDices]) {
        if ([dice currentValue] != 3) {
            sum += [dice currentValue]; // Threes are worth 0 points
        }
    }
    return [NSString stringWithFormat:@"Current scores: %d\nRolls: %d", sum, [self rolls]];
}

- (NSString *) printAllDices{
    self.rolls++;
    
    NSString *symbols_as_string = @"";
    NSString *stringToAppend = @"";
    int index = 1;
    for (Dice *tempDice in [self allDices]) {
        if ([tempDice isHeld] == NO) {
            [tempDice randomizeValue];
            NSString *tempDiceSymbol = [tempDice convertValueToUnicodeSymbols:[tempDice currentValue]];
            
            if ([tempDice isEqualTo:[self allDices].lastObject]) {
                stringToAppend = [NSString stringWithFormat:@"%d: %@", index, tempDiceSymbol];
            } else {
                stringToAppend = [NSString stringWithFormat:@"%d: %@, ", index, tempDiceSymbol];
            }
            index++;
        } else {
            // print dices using bracketing [] to indicate which dice have been "held"
            NSString *tempDiceSymbol = [tempDice convertValueToUnicodeSymbols:[tempDice currentValue]];
            if ([tempDice isEqualTo:[self allDices].lastObject]) {
                stringToAppend = [NSString stringWithFormat:@"%d: [%@]",  index, tempDiceSymbol];
            } else {
                stringToAppend = [NSString stringWithFormat:@"%d: [%@], ", index, tempDiceSymbol];
            }
            index++;
        }
        symbols_as_string = [symbols_as_string stringByAppendingString:stringToAppend];
    }
    NSString *result = [NSString stringWithFormat:@"Dices: [%@]", symbols_as_string];
    return result;
}

@end
