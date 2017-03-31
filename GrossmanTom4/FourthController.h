//
//  FourthController.h
//  GrossmanTom4
//
//  Created by Tom Grossman on 8/8/16.
//  Copyright © 2016 Tom Grossman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FourthController : UIViewController
@property BOOL royalFlush;
@property BOOL straightFlush;
@property BOOL fourOfAKind;
@property BOOL fullHouse;
@property BOOL flush;
@property BOOL straight;
@property BOOL threeOfAKind;
@property BOOL twoPair;
@property BOOL onePair;

- (IBAction)royalFlush:(id)sender;
- (IBAction)straightFlush:(id)sender;
- (IBAction)fourOfAKind:(id)sender;
- (IBAction)fullHouse:(id)sender;
- (IBAction)flush:(id)sender;
- (IBAction)straight:(id)sender;
- (IBAction)threeOfAKind:(id)sender;
- (IBAction)twoPair:(id)sender;
- (IBAction)onePair:(id)sender;

@end
