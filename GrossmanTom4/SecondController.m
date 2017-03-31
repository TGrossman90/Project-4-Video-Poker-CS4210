//
//  SecondController.m
//  GrossmanTom4
//
//  Created by Tom Grossman on 8/3/16.
//  Copyright © 2016 Tom Grossman. All rights reserved.
//

#import "SecondController.h"
#import "Card.h"
#import "Rules.h"

@interface UIViewController ()
@end
@implementation SecondController

- (Hand *) createHand: (NSMutableArray *) deck {
    Card *card1 = [deck objectAtIndex: (arc4random_uniform(52))];
    
    Card *card2 = [deck objectAtIndex: (arc4random_uniform(52))];
    while(card2 == card1)
        card2 = [deck objectAtIndex: (arc4random_uniform(52))];

    Card *card3 = [deck objectAtIndex: (arc4random_uniform(52))];
    while((card3 == card2) || (card3 == card1))
        card3 = [deck objectAtIndex: (arc4random_uniform(52))];

    Card *card4 = [deck objectAtIndex: (arc4random_uniform(52))];
    while((card4 == card3) || (card4 == card2) || (card4 == card1))
        card4 = [deck objectAtIndex: (arc4random_uniform(52))];
    
    Card *card5 = [deck objectAtIndex: (arc4random_uniform(52))];
    while((card5 == card4) || (card5 == card3) || (card5 == card2) || (card5 == card1))
        card5 = [deck objectAtIndex: (arc4random_uniform(52))];
    
    Hand *newHand = [[Hand alloc] initWithCard1: card1 andWithCard2: card2 andWithCard3:card3 andWithCard4: card4 andWithCard5: card5];
    
    return newHand;
}

- (Card *) getNewCardForHand: (Hand *) hand fromDeck: (NSMutableArray *) deck {
    NSMutableArray *theHand = [hand getTheHand];
    
    Card *card1 = [theHand objectAtIndex: 0];
    Card *card2 = [theHand objectAtIndex: 1];
    Card *card3 = [theHand objectAtIndex: 2];
    Card *card4 = [theHand objectAtIndex: 3];
    Card *card5 = [theHand objectAtIndex: 4];
    
    Card *newCard = [deck objectAtIndex: (arc4random_uniform(52))];
    while((newCard == card1) || (newCard == card2) || (newCard == card3) || (newCard == card4) || (newCard == card5))
        newCard = [deck objectAtIndex: (arc4random_uniform(52))];

    return newCard;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _flag = NO;
    _displayLabel.text = [NSString stringWithFormat: @"Welcome, %@!", _name];

    _cardDeck = [[NSMutableArray alloc] init];
    _pointsLabel.text = [NSString stringWithFormat: @"%d", _pointsToPlay];
    
    for(int c = 0; c < 4; c++) {
        NSString *suit;
        NSString *cardImage;
        if(c == 0)
            suit = @"hearts";
        else if(c == 1)
            suit = @"diamonds";
        else if(c == 2)
            suit = @"clubs";
        else
            suit = @"spades";
        
        for(int x = 2; x < 15; x++) {
            Card *new = [[Card alloc] init];
            [new setSuit: suit];
            
            if(x == 11)
                [new setValue: @"jack"];
            else if(x == 12)
                [new setValue: @"queen"];
            else if(x == 13)
                [new setValue: @"king"];
            else if(x == 14)
                [new setValue: @"ace"];
            else
                [new setValue: [NSString stringWithFormat: @"%i", x]];
            
            cardImage = [NSString stringWithFormat: @"%@_of_%@.png", [new getValue], suit];
            
            [new setCardImage: cardImage];
            [_cardDeck addObject: new];
        }
    }
    
    int x = 1;
    for(Card *card in _cardDeck) {
        [card setCardNum: x];
        x++;
        if(x > 13)
            x = 1;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)drawButtonPressed:(id)sender {
    if(!_flag) {
        _displayLabel.text = [NSString stringWithFormat: @"Good Luck, %@!", _name];
        
        _cardOneSelected = NO;
        [_cardOne setAlpha: 1.0f];
        
        _cardTwoSelected = NO;
        [_cardTwo setAlpha: 1.0f];
        
        _cardThreeSelected = NO;
        [_cardThree setAlpha: 1.0f];
        
        _cardFourSelected = NO;
        [_cardFour setAlpha: 1.0f];
        
        _cardFiveSelected = NO;
        [_cardFive setAlpha: 1.0f];
        
        _yourHand = [self createHand: _cardDeck];
        NSMutableArray *theHand = [_yourHand getTheHand];
        
        [_cardOne setImage: [UIImage imageNamed: [[theHand objectAtIndex: 0] getCardImage]]];
        [_cardTwo setImage: [UIImage imageNamed: [[theHand objectAtIndex: 1] getCardImage]]];
        [_cardThree setImage: [UIImage imageNamed: [[theHand objectAtIndex: 2] getCardImage]]];
        [_cardFour setImage: [UIImage imageNamed: [[theHand objectAtIndex: 3] getCardImage]]];
        [_cardFive setImage: [UIImage imageNamed: [[theHand objectAtIndex: 4] getCardImage]]];
        
        _flag = YES;
        
    } else {
        if(!_cardOneSelected) {
            [_yourHand setCardOne: [self getNewCardForHand: _yourHand fromDeck: _cardDeck]];
            [_cardOne setImage: [UIImage imageNamed: [[_yourHand getCardOne] getCardImage]]];
        }
        if(!_cardTwoSelected) {
            [_yourHand setCardTwo: [self getNewCardForHand: _yourHand fromDeck: _cardDeck]];
            [_cardTwo setImage: [UIImage imageNamed: [[_yourHand getCardTwo] getCardImage]]];
        }
        if(!_cardThreeSelected) {
            [_yourHand setCardThree: [self getNewCardForHand: _yourHand fromDeck: _cardDeck]];
            [_cardThree setImage: [UIImage imageNamed: [[_yourHand getCardThree] getCardImage]]];
        }
        if(!_cardFourSelected) {
            [_yourHand setCardFour: [self getNewCardForHand: _yourHand fromDeck: _cardDeck]];
            [_cardFour setImage: [UIImage imageNamed: [[_yourHand getCardFour] getCardImage]]];
        }
        if(!_cardFiveSelected) {
            [_yourHand setCardFive: [self getNewCardForHand: _yourHand fromDeck: _cardDeck]];
            [_cardFive setImage: [UIImage imageNamed: [[_yourHand getCardFive] getCardImage]]];
        }
        
        _cardOneSelected = NO;
        [_cardOne setAlpha: 1.0f];
        
        _cardTwoSelected = NO;
        [_cardTwo setAlpha: 1.0f];
        
        _cardThreeSelected = NO;
        [_cardThree setAlpha: 1.0f];
        
        _cardFourSelected = NO;
        [_cardFour setAlpha: 1.0f];
        
        _cardFiveSelected = NO;
        [_cardFive setAlpha: 1.0f];
        
        _flag = NO;
        
        _pointsToPlay -= 10;
        _pointsLabel.text = [NSString stringWithFormat: @"%d", _pointsToPlay];
        
        Rules *ruling = [[Rules alloc] init];
        [ruling checkHand: _yourHand];
        int theVerdict = [ruling compareHandsOne: _yourHand];
        
        if(theVerdict == 10) {
            _displayLabel.text = @"You win with a Royal Flush!";
            
            _pointsToPlay += 5000;
                _pointsLabel.text = [NSString stringWithFormat: @"%d", _pointsToPlay];
        } else if(theVerdict == 9) {
            _displayLabel.text = @"You win with a Straight Flush!";
            
            _pointsToPlay += 1000;
            _pointsLabel.text = [NSString stringWithFormat: @"%d", _pointsToPlay];
        } else if(theVerdict == 8) {
            _displayLabel.text = @"You win with 4 of a Kind!";
            
            _pointsToPlay += 500;
            _pointsLabel.text = [NSString stringWithFormat: @"%d", _pointsToPlay];
        } else if(theVerdict == 7) {
            _displayLabel.text = @"You win with 4 of a Full House!";
            
            _pointsToPlay += 250;
            _pointsLabel.text = [NSString stringWithFormat: @"%d", _pointsToPlay];
        } else if(theVerdict == 6) {
            _displayLabel.text = @"You win with Flush!";
            
            _pointsToPlay += 100;
            _pointsLabel.text = [NSString stringWithFormat: @"%d", _pointsToPlay];
        } else if(theVerdict == 5) {
            _displayLabel.text = @"You win with Straight!";
            
            _pointsToPlay += 75;
            _pointsLabel.text = [NSString stringWithFormat: @"%d", _pointsToPlay];
        } else if(theVerdict == 4) {
            _displayLabel.text = @"You win with Three of a Kind!";

            _pointsToPlay += 50;
            _pointsLabel.text = [NSString stringWithFormat: @"%d", _pointsToPlay];
        } else if(theVerdict == 3) {
            _displayLabel.text = @"You win with Two Pair!";
            
            _pointsToPlay += 25;
            _pointsLabel.text = [NSString stringWithFormat: @"%d", _pointsToPlay];
        } else if(theVerdict == 2) {
            if([_yourHand getHighCard] > 9) {
                _displayLabel.text = @"You win with a Pair!";
                
                _pointsToPlay += 10;
                _pointsLabel.text = [NSString stringWithFormat: @"%d", _pointsToPlay];
            } else {
                _displayLabel.text = @"You lost. Better luck next time!";
            }
        } else {
            _displayLabel.text = @"You lost. Better luck next time!";
        }
    }
    if(_pointsToPlay == 0)
        exit(0);
}

- (IBAction)cardOnePressed:(id)sender {
    if(!_cardOneSelected) {
        _cardOneSelected = YES;
        [_cardOne setAlpha: 0.7f];
    }else
        if(_cardOneSelected) {
        _cardOneSelected = NO;
        [_cardOne setAlpha: 1.0f];
    }
}

- (IBAction)cardTwoPressed:(id)sender {
    if(!_cardTwoSelected) {
        _cardTwoSelected = YES;
        [_cardTwo setAlpha: 0.7f];
    }else
        if(_cardTwoSelected) {
            _cardTwoSelected = NO;
            [_cardTwo setAlpha: 1.0f];
        }
}

- (IBAction)cardThreePressed:(id)sender {
    if(!_cardThreeSelected) {
        _cardThreeSelected = YES;
        [_cardThree setAlpha: 0.7f];
    }else
        if(_cardThreeSelected) {
            _cardThreeSelected = NO;
            [_cardThree setAlpha: 1.0f];
        }
}

- (IBAction)cardFourPressed:(id)sender {
    if(!_cardFourSelected) {
        _cardFourSelected = YES;
        [_cardFour setAlpha: 0.7f];
    }else
        if(_cardFourSelected) {
            _cardFourSelected = NO;
            [_cardFour setAlpha: 1.0f];
        }
}

- (IBAction)cardFivePressed:(id)sender {
    if(!_cardFiveSelected) {
        _cardFiveSelected = YES;
        [_cardFive setAlpha: 0.7f];
    }else
        if(_cardFiveSelected) {
            _cardFiveSelected = NO;
            [_cardFive setAlpha: 1.0f];
        }
}
@end