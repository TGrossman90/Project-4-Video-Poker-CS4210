//
//  Hand.h
//  GrossmanTom4
//
//  Created by Tom Grossman on 8/3/16.
//  Copyright © 2016 Tom Grossman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Card.h"

@interface Hand : UIViewController {
    Card *card1;
    Card *card2;
    Card *card3;
    Card *card4;
    Card *card5;
    
    NSMutableArray *theHand;
    
    BOOL twoOfAKind;
    BOOL threeOfAKind;
    BOOL twoPair;
    BOOL fourOfAKind;
    BOOL fullHouse;
    BOOL flush;
    BOOL straight;
    BOOL straightFlush;
    BOOL royalFlush;
    
    int highCard;
    NSString *bestPlay;
}

- (void) setCardOne: (Card *) card;
- (void) setCardTwo: (Card *) card;
- (void) setCardThree: (Card *) card;
- (void) setCardFour: (Card *) card;
- (void) setCardFive: (Card *) card;

- (Card *) getCardOne;
- (Card *) getCardTwo;
- (Card *) getCardThree;
- (Card *) getCardFour;
- (Card *) getCardFive;



- (Hand *) initWithCard1: (Card *) one andWithCard2: (Card *) two andWithCard3: (Card *) three andWithCard4: (Card *) four andWithCard5: (Card *) five;

- (NSString *) cardOneSuit;
- (NSString *) cardTwoSuit;
- (NSString *) cardThreeSuit;
- (NSString *) cardFourSuit;
- (NSString *) cardFiveSuit;

- (NSMutableArray *) getTheHand;

- (Hand *) sortHand: (Hand *) hand;

- (void) setHighCard: (int) value;
- (void) setTwoOfAKind: (BOOL) value;
- (void) setThreeOfAKind: (BOOL) value;
- (void) setTwoPair: (BOOL) value;
- (void) setFourOfAKind: (BOOL) value;
- (void) setFullHouse: (BOOL) value;
- (void) setFlush: (BOOL) value;
- (void) setStraight: (BOOL) value;
- (void) setStraightFlush: (BOOL) value;
- (void) setRoyalFlush: (BOOL) value;

- (BOOL) getTwoOfAKind;
- (BOOL) getThreeOfAKind;
- (BOOL) getTwoPair;
- (BOOL) getFourOfAKind;
- (BOOL) getFullHouse;
- (BOOL) getFlush;
- (BOOL) getStraight;
- (BOOL) getStraightFlush;
- (BOOL) getRoyalFlush;

- (int) getHighCard;

@end
