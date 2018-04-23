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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Make five instances of the Dice class
        Dice *dice1 = [Dice new];
        Dice *dice2 = [Dice new];
        Dice *dice3 = [Dice new];
        Dice *dice4 = [Dice new];
        Dice *dice5 = [Dice new];
        
        // randomize their values and print them
        int dice1Value = [dice1 randomizeValue];
        int dice2Value = [dice2 randomizeValue];
        int dice3Value = [dice3 randomizeValue];
        int dice4Value = [dice4 randomizeValue];
        int dice5Value = [dice5 randomizeValue];
        
        [InputCollector printToPrompt: [dice1 convertValueToUnicodeSymbols:dice1Value]];
        [InputCollector printToPrompt: [dice2 convertValueToUnicodeSymbols:dice2Value]];
        [InputCollector printToPrompt: [dice3 convertValueToUnicodeSymbols:dice3Value]];
        [InputCollector printToPrompt: [dice4 convertValueToUnicodeSymbols:dice4Value]];
        [InputCollector printToPrompt: [dice5 convertValueToUnicodeSymbols:dice5Value]];
        
        
        
        
    }
    return 0;
}
