//
//  ListaContatosViewController.h
//  ContatoIP67
//
//  Created by ios2971 on 22/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListaContatosViewController : UITableViewController
@property(strong) NSMutableArray *contatos;
- (id)initWithContatos:(NSMutableArray *)contato;
- (void)exibeformulario;
@end