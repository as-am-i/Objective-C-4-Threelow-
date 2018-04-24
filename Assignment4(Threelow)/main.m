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
                // allow the user to input dice indexes to hold them
                user_input= [InputCollector inputForPrompt:@"How many dices to hold: "];
                int cnt = [user_input intValue];
                [controller holdDice:cnt];
                
                
                NSString *symbols_as_string = @"";
                for (Dice *tempDice in [controller heldDices]) {
                    int tempValue = [tempDice randomizeValue];
                    NSString *tempDiceSymbol = [tempDice convertValueToUnicodeSymbols:tempValue];
                    
                    // print dices using bracketing [] to indicate which dice have been "held"
                    NSString *stringToAppend;
                    if ([tempDice isEqualTo:[controller heldDices].lastObject]) {
                        stringToAppend = tempDiceSymbol;
                    } else {
                        stringToAppend = [NSString stringWithFormat:@"%@, ", tempDiceSymbol];
                    }
                    symbols_as_string = [symbols_as_string stringByAppendingString:stringToAppend];
                }
                NSString *result = [NSString stringWithFormat:@"[%@]", symbols_as_string];
                [InputCollector printToPrompt:result];
            } else {
                flag = 1;
            }
        }

        
        
    }
    return 0;
}
