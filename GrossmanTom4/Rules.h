//
//  Rules.h
//  GrossmanTom4
//
//  Created by Tom Grossman on 8/3/16.
//  Copyright © 2016 Tom Grossman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Card.h"
#import "Hand.h"

@interface Rules : UIViewController 

- (void) highCard: (Hand *) hand;
- (void) twoOfAKind: (Hand *) hand;
- (void) threeOfAKind: (Hand *) hand;
- (void) twoPair: (Hand *) hand;
- (void) fourOfAKind: (Hand *) hand;
- (void) fullHouse: (Hand *) hand;
- (void) flush: (Hand *) hand;
- (void) straight: (Hand *) hand;
- (void) straightFlush: (Hand *) hand;
- (void) royalFlush: (Hand *) hand;

- (void) checkHand: (Hand *) hand;
- (int) compareHandsOne: (Hand *) one;

@end
