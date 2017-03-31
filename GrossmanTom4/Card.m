//
//  Card.m
//  GrossmanTom4
//
//  Created by Tom Grossman on 8/3/16.
//  Copyright © 2016 Tom Grossman. All rights reserved.
//

#import "Card.h"

@implementation Card

- (void) setValue: (NSString *) val {
    value = [NSString stringWithString: val];
}

- (void) setSuit: (NSString *) val {
    suit = [NSString stringWithString: val];
}

- (void) setCardNum: (int) val {
    cardNum = val;
}

-(void) setCardImage: (NSString *) val {
    cardImage = [NSString stringWithString: val];
}

- (NSString *) getValue {
    return value;
}

- (NSString *) getSuit {
    return suit;
}

- (int) getCardNum {
    return cardNum;
}

- (NSString *) getCardImage {
    return cardImage;
}

@end
