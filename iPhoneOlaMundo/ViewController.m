//
//  ViewController.m
//  iPhoneOlaMundo
//
//  Created by ios2971 on 20/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize campolabel, campotexto, valorum, valordois;
- (IBAction)botaoclicado: (id) sender {
    [campolabel setText:[campotexto text]];
    NSLog(@"digitado pelo usuário: %@", [campotexto text]);
}

- (IBAction)somabrasil:(id)sender{
    NSString *txt1 = [valorum text];
    int val1 = [txt1 intValue];
    int val2 = [[valordois text] intValue];
    int soma = val1 + val2;
    [campolabel setText:[NSString stringWithFormat:@"%i",soma]];
}
@end
