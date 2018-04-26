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
        
        GameController *controller = [GameController setUpGame];
        NSString *user_input = @"";
        int flag = 0;
        BOOL isSelected = NO;
        
        while (flag != 1) {
            while ([controller rolls] < 5 && flag != 1) {
                if ([[controller heldDices] count] == 5) {
                    [InputCollector printToPrompt:[controller finishGame]];
                    user_input = [InputCollector inputForPrompt:@"New game? y/n"];
                    flag = [controller isStartingNewGame:user_input];
                } else {
                    user_input = [InputCollector inputForPrompt:@"Enter comand (roll/reset/exit): "];
                    if ([user_input isEqualToString:@"roll"]) {
                        // roll and print
                        [InputCollector printToPrompt:[controller printAllDices]];
                        [InputCollector printToPrompt:[controller calculateScores]];
                            
                        // let user hold dices
                        isSelected = NO;
                        while (isSelected == NO) {
                            isSelected = [controller holdDie:[InputCollector inputForPrompt:@"Enter the indexes of dices to hold/unhold: "]];
                            
                            if ([[controller heldDices] count] == 5) {
                                [InputCollector printToPrompt:[controller finishGame]];
                                user_input = [InputCollector inputForPrompt:@"New game? y/n"];
                                flag = [controller isStartingNewGame:user_input];
                            }
                        }
                    } else if ([user_input isEqualToString:@"reset"]) {
                        [controller resetDice];
                        [InputCollector printToPrompt:@"Reset and started a new Game!"];
                    } else if ([user_input isEqualToString:@"rolll"] || [user_input isEqualToString:@"roIl"]) {
                        [InputCollector printToPrompt:[controller cheatToWin]];
                        [InputCollector printToPrompt:[controller calculateScores]];
                        isSelected = NO;
                        while (isSelected == NO) {
                            isSelected = [controller holdDie:[InputCollector inputForPrompt:@"Enter the indexes of dices to hold/unhold: "]];
                            
                            if ([[controller heldDices] count] == 5) {
                                [InputCollector printToPrompt:[controller finishGame]];
                                user_input = [InputCollector inputForPrompt:@"New game? y/n"];
                                flag = [controller isStartingNewGame:user_input];
                            }
                        }
                    } else if ([user_input isEqualToString:@"exit"]) {
                        flag = 1;
                    } else if ([user_input isEqualToString:@"frog"]) {
                        [InputCollector printToPrompt:@"🐸: Hi, did you call me?"];
                    } else {
                        [InputCollector printToPrompt:@"Error: command not found"];
                    }
                }
            }
            
            if ([[controller heldDices] count] != 5 && flag != 1) {
                user_input = [InputCollector inputForPrompt:@"You already rolled dices 5 times!\nEnter comand (reset/exit): "];
                BOOL isReset = NO;
                while (flag != 1 && isReset == NO) {
                    if ([user_input isEqualToString:@"reset"]) {
                        [controller resetDice];
                        [InputCollector printToPrompt:@"Reset and started a new Game!"];
                        isReset = YES;
                    } else if ([user_input isEqualToString:@"exit"]) {
                        flag = 1;
                    } else {
                        user_input = [InputCollector inputForPrompt:@"Error: command not found\nEnter comand (reset/exit): "];
                    }
                }
            }
        }
    }
    return 0;
}
