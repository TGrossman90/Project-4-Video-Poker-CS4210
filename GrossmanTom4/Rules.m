//
//  Rules.m
//  GrossmanTom4
//
//  Created by Tom Grossman on 8/3/16.
//  Copyright © 2016 Tom Grossman. All rights reserved.
//

#import "Rules.h"
#import "Card.h"
#import "Hand.h"
#import "FourthController.h"

@implementation Rules

- (void) highCard: (Hand *) hand {
    [hand sortHand: hand];
    NSMutableArray *theHand = [hand getTheHand];

    int highCard = [[theHand objectAtIndex: 4] getCardNum];
    [hand setHighCard: highCard];
}

- (void) twoOfAKind: (Hand *) hand {
    if([[hand getCardOne] getCardNum] == [[hand getCardTwo] getCardNum]) {
        [hand setTwoOfAKind: YES];
        [hand setHighCard: [[hand getCardOne] getCardNum]];
    }
    
    if([[hand getCardTwo] getCardNum] == [[hand getCardThree] getCardNum]) {
        [hand setTwoOfAKind: YES];
        [hand setHighCard: [[hand getCardTwo] getCardNum]];
    }
    
    if([[hand getCardThree] getCardNum] == [[hand getCardFour] getCardNum]) {
        [hand setTwoOfAKind: YES];
        [hand setHighCard: [[hand getCardThree] getCardNum]];
    }
    
    if([[hand getCardFour] getCardNum] == [[hand getCardFive] getCardNum]) {
        [hand setTwoOfAKind: YES];
        [hand setHighCard: [[hand getCardFour] getCardNum]];
    }
}

- (void) threeOfAKind: (Hand *) hand {
    if([hand getTwoOfAKind]) {
        if((([[hand getCardOne] getCardNum] == [[hand getCardTwo] getCardNum]) && ([[hand getCardTwo] getCardNum] == [[hand getCardThree] getCardNum])) || (([[hand getCardTwo] getCardNum] == [[hand getCardThree] getCardNum]) && ([[hand getCardThree] getCardNum] == [[hand getCardFour] getCardNum])) || (([[hand getCardThree] getCardNum] == [[hand getCardFour] getCardNum]) && ([[hand getCardFour] getCardNum] == [[hand getCardFive] getCardNum]))) {
            [hand setThreeOfAKind: YES];
        } else {
            [hand setThreeOfAKind: NO];
        }
    }
}

- (void) twoPair: (Hand *) hand {
    int highCard;
    BOOL flag = NO;
    
    if([[hand getCardOne] getCardNum] == [[hand getCardTwo] getCardNum]) {
        highCard = [[hand getCardOne] getCardNum];
        flag = YES;
    }
    
    if([[hand getCardTwo] getCardNum] == [[hand getCardThree] getCardNum]) {
        if(!flag) {
            highCard = [[hand getCardTwo] getCardNum];
            flag = YES;
        } else {
            [hand setTwoPair: YES];
            return;
        }
    }
    
    if([[hand getCardThree] getCardNum] == [[hand getCardFour] getCardNum]) {
        if(!flag) {
            highCard = [[hand getCardTwo] getCardNum];
            flag = YES;
        } else {
            [hand setTwoPair: YES];
            return;
        }
    }
    
    if([[hand getCardFour] getCardNum] == [[hand getCardFive] getCardNum]) {
        if(!flag) {
            highCard = [[hand getCardTwo] getCardNum];
            flag = YES;
        } else {
            [hand setTwoPair: YES];
            return;
        }
    }
}

- (void) fourOfAKind: (Hand *) hand {
    if([[hand getCardOne] getCardNum] == [[hand getCardTwo] getCardNum] == [[hand getCardThree] getCardNum] == [[hand getCardFour] getCardNum]) {
        [hand setFourOfAKind: YES];
        return;
    }
        
    if([[hand getCardTwo] getCardNum] == [[hand getCardThree] getCardNum] == [[hand getCardFour] getCardNum] == [[hand getCardFive] getCardNum]) {
        [hand setFourOfAKind: YES];
        return;
    }
}

- (void) fullHouse: (Hand *) hand {
    if(([[hand getCardOne] getCardNum] == [[hand getCardTwo] getCardNum] == [[hand getCardThree] getCardNum]) && ([[hand getCardFour] getCardNum] == [[hand getCardFive] getCardNum])) {
        [hand setFullHouse: YES];
        return;
    }
    
    if(([[hand getCardOne] getCardNum] == [[hand getCardTwo] getCardNum]) && ([[hand getCardThree] getCardNum] == [[hand getCardFour] getCardNum] == [[hand getCardFive] getCardNum])) {
        [hand setFullHouse: YES];
        return;
    }
}

- (void) flush: (Hand *) hand {
    if(([[hand cardOneSuit] isEqualToString: [hand cardTwoSuit]]) && ([[hand cardTwoSuit] isEqualToString: [hand cardThreeSuit]]) && ([[hand cardThreeSuit] isEqualToString: [hand cardFourSuit]]) && ([[hand cardFourSuit] isEqualToString: [hand cardFiveSuit]])) {
        [hand setFlush: YES];
        [hand setHighCard: [[hand getCardFive] getCardNum]];
    } else
        [hand setFlush: NO];
}

- (void) straight: (Hand *) hand {
    int num = [[hand getCardOne] getCardNum];
    num++;
    
    if([[hand getCardTwo] getCardNum] == num) {
        num++;
        if([[hand getCardThree] getCardNum] == num) {
            num++;
            if([[hand getCardFour] getCardNum] == num) {
                num++;
                if([[hand getCardFive] getCardNum] == num) {
                    [hand setStraight: YES];
                }
            }
        }
    } else
        [hand setStraight: NO];
}

- (void) straightFlush: (Hand *) hand {
    if([hand getFlush] && [hand getStraight])
        [hand setStraightFlush: YES];
    else
        [hand setStraightFlush: NO];
}

- (void) royalFlush: (Hand *) hand {
    if([hand getStraightFlush] && ([hand getHighCard] == 13))
        [hand setRoyalFlush: YES];
    else
        [hand setRoyalFlush: NO];
}

- (void) checkHand: (Hand *) hand {
    hand = [hand sortHand: hand];
    
    FourthController *fourthController=[[FourthController alloc] init];

   // if(fourthController.twoPair)
        [self twoOfAKind: hand];
    
   // if(fourthController.threeOfAKind)
        [self threeOfAKind: hand];
    
   // if(fourthController.fourOfAKind)
        [self fourOfAKind: hand];
    
   // if(fourthController.twoPair)
        [self twoPair: hand];
    
   // if(fourthController.fullHouse)
        [self fullHouse: hand];
    
   // if(fourthController.flush)
        [self flush: hand];
       
   // if(fourthController.straight)
        [self straight: hand];
       
   // if(fourthController.straightFlush)
        [self straightFlush: hand];
       
   // if(fourthController.royalFlush)
        [self royalFlush: hand];
}

- (int) compareHandsOne: (Hand *) one {
    int highOne = [one getHighCard];
   // int highTwo = [two getHighCard];
    int handOneStatus = 0;
   // int handTwoStatus = 0;
    
    if([one getTwoOfAKind])
        handOneStatus = 2;
    if([one getTwoPair])
        handOneStatus = 3;
    if([one getThreeOfAKind])
        handOneStatus = 4;
    if([one getStraight])
        handOneStatus = 5;
    if([one getFlush])
        handOneStatus = 6;
    if([one getFullHouse])
        handOneStatus = 7;
    if([one getFourOfAKind])
        handOneStatus = 8;
    if([one getStraightFlush])
        handOneStatus = 9;
    if([one getRoyalFlush])
        handOneStatus = 10;

    NSLog(@"Status = %d", handOneStatus);
    
    NSLog(@"%i", [[one getCardOne] getCardNum]);
    NSLog(@"%i", [[one getCardTwo] getCardNum]);
    NSLog(@"%i", [[one getCardThree] getCardNum]);
    NSLog(@"%i", [[one getCardFour] getCardNum]);
    NSLog(@"%i", [[one getCardFive] getCardNum]);







    
/*    if([two getRoyalFlush])
        handTwoStatus = 10;
    else if(![two getRoyalFlush] && [two getStraightFlush])
        handTwoStatus = 9;
    else if(![two getRoyalFlush] && ![two getStraightFlush] && [two getStraight])
        handTwoStatus = 5;
    else if(![two getRoyalFlush] && ![two getStraightFlush] && ![two getStraight] && [two getFlush])
        handTwoStatus = 6;
    else if(![two getRoyalFlush] && ![two getStraightFlush] && ![two getStraight] && ![two getFlush] && [two getFourOfAKind])
        handTwoStatus = 8;
    else if(![two getRoyalFlush] && ![two getStraightFlush] && ![two getStraight] && ![two getFlush] && ![two getFourOfAKind] && [two getTwoPair])
        handTwoStatus = 3;
    else if(![two getRoyalFlush] && ![two getStraightFlush] && ![two getStraight] && ![two getFlush] && ![two getFourOfAKind] && ![two getTwoPair] && [two getThreeOfAKind])
        handTwoStatus = 4;
    else if(![two getRoyalFlush] && ![two getStraightFlush] && ![two getStraight] && ![two getFlush] && ![two getFourOfAKind] && ![two getTwoPair] && ![two getThreeOfAKind] && [two getTwoOfAKind])
        handTwoStatus = 2;
    else if(![two getRoyalFlush] && ![two getStraightFlush] && ![two getStraight] && ![two getFlush] && ![two getFourOfAKind] && ![two getTwoPair] && ![two getThreeOfAKind] && ![two getTwoOfAKind] && [two getFullHouse])
        handTwoStatus = 7;
    
    if(handOneStatus == handTwoStatus) {
        if(highOne == highTwo) {
            return 0;
        } else if(highOne > highTwo) {
            return 1;
        } else {
            return 2;
        }
    } else if(handOneStatus > handTwoStatus) {
        return 1;
    } else {
        return 2;
    }
 */
    
    return handOneStatus;
}


@end
