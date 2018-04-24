//
//  GameController.h
//  Assignment4(Threelow)
//
//  Created by 谷井朝美 on 2018-04-23.
//  Copyright © 2018 Asami Tanii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameController : NSObject

@property NSArray *allDices;
@property NSMutableArray *heldDices;

@property int rolls;

- (instancetype) init;
- (BOOL) holdDie:(NSString *)userInput;
- (void) resetDice;
- (NSString *) calculateScores;
- (NSString *) printAllDices;
- (NSString *) cheatToWin;

@end
