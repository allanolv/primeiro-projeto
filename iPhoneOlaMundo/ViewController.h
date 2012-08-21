//
//  ViewController.h
//  iPhoneOlaMundo
//
//  Created by ios2971 on 20/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property(nonatomic,weak) IBOutlet UILabel *campolabel;
@property(nonatomic,weak) IBOutlet UITextField *campotexto;
@property(nonatomic,weak) IBOutlet UITextField *valorum;
@property(nonatomic,weak) IBOutlet UITextField *valordois;
- (IBAction)botaoclicado: (id) sender;
- (IBAction)somabrasil:(id)sender;
@end
