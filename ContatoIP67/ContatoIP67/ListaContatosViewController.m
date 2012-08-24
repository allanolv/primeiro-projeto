//
//  ListaContatosViewController.m
//  ContatoIP67
//
//  Created by ios2971 on 22/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "FormularioContatoViewController.h"
#import "Contato.h"

@implementation ListaContatosViewController

@synthesize contatos;


- (id)initWithContatos:(NSMutableArray *)contato{
    self = [self init];
    if(self){
        self.contatos = contato;
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title=@"Lista de Contatos";
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem  alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(exibeformulario)];
    }
    return self;
    
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.contatos.count;
}


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    Contato *contato = [self.contatos objectAtIndex:indexPath.row];
    cell.textLabel.text = contato.nome;
    return cell;
}

- (void)exibeformulario{
    
//    UIAlertView *al = [[UIAlertView alloc]initWithTitle:@"Atenção" message:@"TESTE" delegate:nil cancelButtonTitle:@"Cancelar" otherButtonTitles:nil, nil];
//    [al show];
    
    FormularioContatoViewController *form = [[FormularioContatoViewController alloc]initWithContatos:self.contatos];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:form];
    [self presentModalViewController:nav animated:YES];
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

@end
