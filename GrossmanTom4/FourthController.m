//
//  FourthController.m
//  GrossmanTom4
//
//  Created by Tom Grossman on 8/8/16.
//  Copyright © 2016 Tom Grossman. All rights reserved.
//

#import "FourthController.h"

@implementation FourthController

- (void)viewDidLoad {
    [super viewDidLoad];
    _royalFlush = YES;
    _straightFlush = YES;
    _flush = YES;
    _fullHouse = YES;
    _straight = YES;
    _twoPair = YES;
    _onePair = YES;
    _threeOfAKind = YES;
    _fourOfAKind = YES;
}

- (IBAction)royalFlush:(id)sender {
    if([sender isOn])
        _royalFlush = YES;
    else
        _royalFlush = NO;
}

- (IBAction)straightFlush:(id)sender {
    if([sender isOn])
        _straightFlush = YES;
    else
        _straightFlush = NO;
}

- (IBAction)fourOfAKind:(id)sender {
    if([sender isOn])
        _fourOfAKind = YES;
    else
        _fourOfAKind = NO;
}

- (IBAction)fullHouse:(id)sender {
    if([sender isOn])
        _fullHouse = YES;
    else
        _fullHouse = NO;
}

- (IBAction)flush:(id)sender {
    if([sender isOn])
        _flush = YES;
    else
        _flush = NO;
}

- (IBAction)straight:(id)sender {
    if([sender isOn])
        _straight = YES;
    else
        _straight = NO;
}

- (IBAction)threeOfAKind:(id)sender {
    if([sender isOn])
        _threeOfAKind = YES;
    else
        _threeOfAKind = NO;
}

- (IBAction)twoPair:(id)sender {
    if([sender isOn])
        _twoPair = YES;
    else
        _twoPair = NO;
}

- (IBAction)onePair:(id)sender {
    if([sender isOn])
        _onePair = YES;
    else
        _onePair = NO;
}

@end
