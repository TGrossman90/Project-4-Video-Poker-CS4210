//
//  Hand.m
//  GrossmanTom4
//
//  Created by Tom Grossman on 8/3/16.
//  Copyright © 2016 Tom Grossman. All rights reserved.
//

#import "Hand.h"

@implementation Hand

- (void) setCardOne: (Card *) card {
    card1 = card;
}

- (void) setCardTwo: (Card *) card {
    card2 = card;
}

- (void) setCardThree: (Card *) card {
    card3 = card;
}

- (void) setCardFour: (Card *) card {
    card4 = card;
}

- (void) setCardFive: (Card *) card {
    card5 = card;
}

- (Card *) getCardOne {
    return card1;
}

- (Card *) getCardTwo {
    return card2;
}

- (Card *) getCardThree {
    return card3;
}

- (Card *) getCardFour {
    return card4;
}

- (Card *) getCardFive {
    return card5;
}


- (Hand *) initWithCard1: (Card *) one andWithCard2: (Card *) two andWithCard3: (Card *) three andWithCard4: (Card *) four andWithCard5: (Card *) five {
    self = [super init];
    if(self) {
        card1 = [[Card alloc] init];
        card2 = [[Card alloc] init];
        card3 = [[Card alloc] init];
        card4 = [[Card alloc] init];
        card5 = [[Card alloc] init];
        
        card1 = one;
        card2 = two;
        card3 = three;
        card4 = four;
        card5 = five;
        
        theHand = [NSMutableArray arrayWithObjects: card1, card2, card3, card4, card5, nil];
    }
    
    twoOfAKind = false;
    twoPair = false;
    threeOfAKind = false;
    fourOfAKind = false;
    flush = false;
    straight = false;
    straightFlush = false;
    royalFlush = false;
    
    return self;
}

- (NSString *) cardOneSuit {
    return [card1 getSuit];
}

- (NSString *) cardTwoSuit {
    return [card2 getSuit];
}

- (NSString *) cardThreeSuit {
    return [card3 getSuit];
}
- (NSString *) cardFourSuit {
    return [card4 getSuit];
}
- (NSString *) cardFiveSuit {
    return [card5 getSuit];
}
- (NSMutableArray *) getTheHand {
    return theHand;
}


- (Hand *) sortHand: (Hand *) hand {
    int i;
    bool swapped = TRUE;
    Card *temp;
    while (swapped){
        for (i = 0; i < 5; i++)
        {
            swapped = FALSE;
            if(([[hand getCardOne] getCardNum]) > ([[hand getCardTwo] getCardNum])) {
                temp = [hand getCardOne];
                [hand setCardOne: [hand getCardTwo]];
                [hand setCardTwo: temp];
                swapped = YES;
            }
            if(([[hand getCardTwo] getCardNum]) > ([[hand getCardThree] getCardNum])) {
                temp = [hand getCardTwo];
                [hand setCardTwo: [hand getCardThree]];
                [hand setCardThree: temp];
                swapped = YES;
            }
            if(([[hand getCardThree] getCardNum]) > ([[hand getCardFour] getCardNum])) {
                temp = [hand getCardThree];
                [hand setCardThree: [hand getCardFour]];
                [hand setCardFour: temp];
                swapped = YES;
            }
            if(([[hand getCardFour] getCardNum]) > ([[hand getCardFive] getCardNum])) {
                temp = [hand getCardFour];
                [hand setCardFour: [hand getCardFive]];
                [hand setCardFive: temp];
                swapped = YES;
            }
        }
    }
    return hand;
}

- (void) setTwoOfAKind: (BOOL) value {
    twoOfAKind = value;
}

- (void) setThreeOfAKind: (BOOL) value {
    threeOfAKind = value;
}

- (void) setTwoPair: (BOOL) value {
    twoPair = value;
}

- (void) setFourOfAKind: (BOOL) value {
    fourOfAKind = value;
}

- (void) setFullHouse: (BOOL) value {
    fullHouse = value;
}

- (void) setFlush: (BOOL) value {
    flush = value;
}

- (void) setStraight: (BOOL) value {
    straight = value;
}

- (void) setStraightFlush: (BOOL) value {
    straightFlush = value;
}

- (void) setRoyalFlush: (BOOL) value {
    royalFlush = value;
}
- (void) setHighCard: (int) value {
    highCard = value;
}

- (BOOL) getTwoOfAKind {
    return twoOfAKind;
}
- (BOOL) getThreeOfAKind {
    return threeOfAKind;
}
- (BOOL) getTwoPair {
    return twoPair;
}
- (BOOL) getFourOfAKind {
    return fourOfAKind;
}
- (BOOL) getFullHouse {
    return fullHouse;
}
- (BOOL) getFlush {
    return flush;
}
- (BOOL) getStraight {
    return straight;
}
- (BOOL) getStraightFlush {
    return straightFlush;
}
- (BOOL) getRoyalFlush {
    return royalFlush;
}
- (int) getHighCard {
    return highCard;
}

@end
