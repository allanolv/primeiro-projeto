//
//  ListaContatosViewController.m
//  ContatoIP67
//
//  Created by ios2971 on 22/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ListaContatosViewController.h"
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
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
    }
    return self;
    
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(editingStyle==UITableViewCellEditingStyleDelete)
    {
        [self.contatos removeObjectAtIndex:indexPath.row];
        NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
        [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    }
    
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Contato *c = [self.contatos objectAtIndex:indexPath.row];
    
    FormularioContatoViewController *form = [[FormularioContatoViewController alloc] initWithObjContatos:c];
    form.contatos = self.contatos;
    
    [self.navigationController pushViewController:form animated:YES];
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

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    Contato *c_out = [self.contatos objectAtIndex:sourceIndexPath.row];
    [contatos removeObjectAtIndex:sourceIndexPath.row];
    [contatos insertObject:c_out atIndex:destinationIndexPath.row];
}

- (void)exibeformulario{
    
//    UIAlertView *al = [[UIAlertView alloc]initWithTitle:@"Atenção" message:@"TESTE" delegate:nil cancelButtonTitle:@"Cancelar" otherButtonTitles:nil, nil];
//    [al show];
    
    FormularioContatoViewController *form = [[FormularioContatoViewController alloc]init];
    
    form.delegate = self;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:form];
    [self presentModalViewController:nav animated:YES];
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

-(void) contatoAdicionado:(Contato *)c{
    
    [self.contatos addObject:c];
}


@end
