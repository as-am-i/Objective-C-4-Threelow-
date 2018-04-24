//
//  main.m
//  Assignment4(Threelow)
//
//  Created by 谷井朝美 on 2018-04-23.
//  Copyright © 2018 Asami Tanii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "InputCollector.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // GameController instance
        GameController *controller = [GameController new];
        
        // Make five instances of the Dice class
        Dice *dice1 = [Dice new];
        Dice *dice2 = [Dice new];
        Dice *dice3 = [Dice new];
        Dice *dice4 = [Dice new];
        Dice *dice5 = [Dice new];
        controller.allDices = [[NSArray alloc] initWithObjects:dice1, dice2, dice3, dice4, dice5, nil];

        // When a user inputs the word roll, randomize the values and print them
        NSString *user_input = @"";
        int flag = 0;
        while (flag == 0) {
            user_input = [InputCollector inputForPrompt:@"Enter comand: "];
            if ([user_input isEqualToString:@"roll"]) {
                // roll and print them
                NSString *symbols_as_string = @"";
                NSString *stringToAppend = @"";
                int index = 0;
                for (Dice *tempDice in [controller allDices]) {
                    if ([tempDice isHeld] == NO) {
                        [tempDice randomizeValue];
                        NSString *tempDiceSymbol = [tempDice convertValueToUnicodeSymbols:[tempDice currentValue]];
                        
                        if ([tempDice isEqualTo:[controller allDices].lastObject]) {
                            stringToAppend = [NSString stringWithFormat:@"%d: %@", index, tempDiceSymbol];
                        } else {
                            stringToAppend = [NSString stringWithFormat:@"%d: %@, ", index, tempDiceSymbol];
                        }
                        index++;
                    } else {
                        // print dices using bracketing [] to indicate which dice have been "held"
                        NSString *tempDiceSymbol = [tempDice convertValueToUnicodeSymbols:[tempDice currentValue]];
                        if ([tempDice isEqualTo:[controller allDices].lastObject]) {
                            stringToAppend = [NSString stringWithFormat:@"%d: [%@]",  index, tempDiceSymbol];
                        } else {
                            stringToAppend = [NSString stringWithFormat:@"%d: [%@], ", index, tempDiceSymbol];
                        }
                        index++;
                    }
                    symbols_as_string = [symbols_as_string stringByAppendingString:stringToAppend];
                }
                NSString *result = [NSString stringWithFormat:@"[%@]", symbols_as_string];
                [InputCollector printToPrompt:result];
                
                // allow the user to input dice indexes to hold them
                user_input= [InputCollector inputForPrompt:@"Enter the index of dices to hold: "];
                int indexOfDice = [user_input intValue];
                if (indexOfDice > 4 || indexOfDice < 0) {
                    [InputCollector printToPrompt:@"Invalid number"];
                } else {
                    [controller holdDie:indexOfDice];
                }
            } else if ([user_input isEqualToString:@"reset"]) {
                [controller resetDice];
            } else {
                flag = 1;
            }
        }

        
        
    }
    return 0;
}
