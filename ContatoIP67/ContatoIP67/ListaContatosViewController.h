//
//  ListaContatosViewController.h
//  ContatoIP67
//
//  Created by ios2971 on 22/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"
#import "FormularioContatoViewController.h"
@interface ListaContatosViewController : UITableViewController<ContatoProtocol>
@property(strong) NSMutableArray *contatos;

- (id)initWithContatos:(NSMutableArray *)contato;
- (void)exibeformulario;

@end