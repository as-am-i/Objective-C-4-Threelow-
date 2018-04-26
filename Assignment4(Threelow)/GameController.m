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

+ (instancetype) setUpGame{
    // GameController instance
    GameController *controller = [GameController new];
    
    controller.rounds++;
    
    // Make five instances of the Dice class
    Dice *dice1 = [Dice new];
    Dice *dice2 = [Dice new];
    Dice *dice3 = [Dice new];
    Dice *dice4 = [Dice new];
    Dice *dice5 = [Dice new];
    controller.allDices = [[NSArray alloc] initWithObjects:dice1, dice2, dice3, dice4, dice5, nil];
    
    return controller;
}

- (NSString *) finishGame{
    NSString *result = [NSString stringWithFormat:@"ALL DICES ARE HELD!\nYour final scores:\n%@\n%@", [self printAllDices], [self calculateScores]] ;
    return result;
}

- (int) isStartingNewGame:(NSString *)user_input{
    int flag;
    if ([user_input isEqualToString:@"y"] || [user_input isEqualToString:@"yes"]) {
        // new game starts
        [self resetDice];
        flag = 0;
    } else {
        flag = 1;
    }
    return flag;
}

- (BOOL) holdDie:(NSString *)userInput{
    BOOL isSelected = NO;
    int indexOfDice = -1;
    for (NSUInteger i = 0; i < userInput.length; i++) {
        NSString *charOfUserInput = [userInput substringWithRange:NSMakeRange(i, 1)];
        indexOfDice = [charOfUserInput intValue] - 1;
    
        // if userInput contains any valid indexes of dices
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
    }
    return isSelected;
}

- (void) resetDice{
    self.rolls = 0;
    for (Dice *dice in [self allDices]) {
        dice.isHeld = NO;
    }
    [[self heldDices] removeAllObjects];
    self.rounds++;
}

- (NSString *) calculateScores{
    int sum = 0;
    for (Dice *dice in [self heldDices]) {
        if ([dice currentValue] != 3) {
            sum += [dice currentValue]; // Threes are worth 0 points
        }
    }
    return [NSString stringWithFormat:@"Round: %d\nCurrent scores: %d\nRolls: %d", [self rounds], sum, [self rolls]];
}

- (NSString *) printAllDices{
    if ([[self heldDices] count] != 5) {
        self.rolls++;
    }
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

- (NSString *) cheatToWin{
    self.rolls++;
    NSString *symbols_as_string = @"";
    NSString *stringToAppend = @"";
    int index = 1;
    for (Dice *tempDice in [self allDices]) {
        [tempDice alwaysThree];
        NSString *tempDiceSymbol = [tempDice convertValueToUnicodeSymbols:[tempDice currentValue]];
        if ([tempDice isHeld] == NO) {
            if ([tempDice isEqualTo:[self allDices].lastObject]) {
                stringToAppend = [NSString stringWithFormat:@"%d: %@", index, tempDiceSymbol];
            } else {
                stringToAppend = [NSString stringWithFormat:@"%d: %@, ", index, tempDiceSymbol];
            }
        } else {
            if ([tempDice isEqualTo:[self allDices].lastObject]) {
                stringToAppend = [NSString stringWithFormat:@"%d: [%@]",  index, tempDiceSymbol];
            } else {
                stringToAppend = [NSString stringWithFormat:@"%d: [%@], ", index, tempDiceSymbol];
            }
        }
        index++;
        symbols_as_string = [symbols_as_string stringByAppendingString:stringToAppend];
    }
    NSString *result = [NSString stringWithFormat:@"Dices: [%@]", symbols_as_string];
    return result;
}

@end
