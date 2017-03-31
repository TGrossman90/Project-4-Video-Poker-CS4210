//
//  Card.h
//  GrossmanTom4
//
//  Created by Tom Grossman on 8/3/16.
//  Copyright © 2016 Tom Grossman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Card : UIViewController {
    NSString *value;
    NSString *suit;
    int cardNum;
    NSString *cardImage;
}
    
- (void) setValue: (NSString *) val;
- (void) setSuit: (NSString *) val;
- (void) setCardNum: (int) val;
- (void) setCardImage: (NSString *) val;
- (NSString *) getValue;
- (NSString *) getSuit;
- (int) getCardNum;
- (NSString *) getCardImage;

@end
