//
//  SiteDoContatoViewController.m
//  ContatoIP67
//
//  Created by ios2971 on 28/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SiteDoContatoViewController.h"

@interface SiteDoContatoViewController ()

@end

@implementation SiteDoContatoViewController
@synthesize site, contato;


- (id)initWithContato:(Contato *)c{
    self = [super init];
    if (self) {
        contato = c;
    }
    return self;        
}

-(void) viewDidLoad{
    NSURL *url = [NSURL URLWithString:contato.site];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [site loadRequest:req];
}

@end
