//
//  SecondController.h
//  GrossmanTom4
//
//  Created by Tom Grossman on 8/3/16.
//  Copyright © 2016 Tom Grossman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hand.h"

@interface SecondController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *cardOne;
@property (weak, nonatomic) IBOutlet UIImageView *cardTwo;
@property (weak, nonatomic) IBOutlet UIImageView *cardThree;
@property (weak, nonatomic) IBOutlet UIImageView *cardFour;
@property (weak, nonatomic) IBOutlet UIImageView *cardFive;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel;
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property BOOL flag;
@property int pointsToPlay;
@property NSString *name;
@property Hand *yourHand;
@property BOOL cardOneSelected;
@property BOOL cardTwoSelected;
@property BOOL cardThreeSelected;
@property BOOL cardFourSelected;
@property BOOL cardFiveSelected;
@property NSMutableArray *cardDeck;
- (IBAction)drawButtonPressed:(id)sender;
- (IBAction)cardOnePressed:(id)sender;
- (IBAction)cardTwoPressed:(id)sender;
- (IBAction)cardThreePressed:(id)sender;
- (IBAction)cardFourPressed:(id)sender;
- (IBAction)cardFivePressed:(id)sender;


@end
