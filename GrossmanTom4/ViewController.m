//
//  ViewController.m
//  GrossmanTom4
//
//  Created by Tom Grossman on 8/3/16.
//  Copyright © 2016 Tom Grossman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"buttonSegue"]){
        SecondController *controller = (SecondController *)segue.destinationViewController;
        NSString *text = _pointsToPlay.text;
        int num = [text integerValue];
        
        controller.pointsToPlay = num;
        controller.name = _nameField.text;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
