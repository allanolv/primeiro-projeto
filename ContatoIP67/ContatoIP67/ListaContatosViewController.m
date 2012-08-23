//
//  ListaContatosViewController.m
//  ContatoIP67
//
//  Created by ios2971 on 22/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "FormularioContatoViewController.h"

@implementation ListaContatosViewController
- (id)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title=@"Lista de Contatos";
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem  alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(exibeformulario)];
    }
    return self;
    
}

- (void)exibeformulario{
    
//    UIAlertView *al = [[UIAlertView alloc]initWithTitle:@"Atenção" message:@"TESTE" delegate:nil cancelButtonTitle:@"Cancelar" otherButtonTitles:nil, nil];
//    [al show];
    
    FormularioContatoViewController *form = [[FormularioContatoViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:form];
    [self presentModalViewController:nav animated:YES];
}

@end
