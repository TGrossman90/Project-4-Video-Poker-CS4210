//
//  boolValues.h
//  GrossmanTom4
//
//  Created by Tom Grossman on 8/8/16.
//  Copyright © 2016 Tom Grossman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface boolValues : NSObject {
    
    BOOL royalFlush;
    BOOL straightFlush;
    BOOL fourOfAKind;
    BOOL threeOfAKind;
    BOOL fullHouse;
    BOOL twoPair;
    BOOL flush;
    BOOL straight;
    BOOL pair;
}

+(BOOL) getRoyalFlush;
+(boolValues *) getStraightFlush;
+(boolValues *) getFourOfAKind;
+(boolValues *) getThreeOfAKind;
+(boolValues *) getFullHouse;
+(boolValues *) getTwoPair;
+(boolValues *) getFlush;
+(boolValues *) getStraight;
+(boolValues *) getPair;

+(boolValues *) setRoyalFlush;
+(boolValues *) setStraightFlush;
+(boolValues *) setFourOfAKind;
+(boolValues *) setThreeOfAKind;
+(boolValues *) setFullHouse;
+(boolValues *) setTwoPair;
+(boolValues *) setFlush;
+(boolValues *) setStraight;
+(boolValues *) setPair;

@end
