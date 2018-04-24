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

        NSString *user_input = @"";
        int flag = 0;
        
        while (flag == 0) {
            user_input = [InputCollector inputForPrompt:@"Enter comand (roll/reset): "];
            if ([user_input isEqualToString:@"roll"]) {
                // roll and print
                [InputCollector printToPrompt:[controller printAllDices]];
                
                // calculates scores
                [InputCollector printToPrompt:[controller calculateScores]];
                
                // let user hold dices
                BOOL isSelected = NO;
                while (isSelected == NO) {
                    isSelected = [controller holdDie:[InputCollector inputForPrompt:@"Enter the index of dices to hold/unhold: "]];
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
