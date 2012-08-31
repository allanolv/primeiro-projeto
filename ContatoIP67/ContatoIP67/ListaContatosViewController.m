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
        UIImage *imageTabItem = [UIImage imageNamed:@"lista-contatos.png"];
        
        UITabBarItem *tabItem =[[UITabBarItem alloc] initWithTitle:@"Contatos" image:imageTabItem tag:0];
        self.tabBarItem = tabItem;
        self.navigationItem.title=@"Contatos";
        
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
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; 
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


- (void) viewDidLoad{

    [super viewDidLoad];
    
    
    UILongPressGestureRecognizer *gesto = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(exibeMaisAcoes:)];
    
    [self.tableView addGestureRecognizer:gesto];

}

- (void) exibeMaisAcoes:(UIGestureRecognizer *) gesture{
    
    if(gesture.state == UIGestureRecognizerStateBegan){
        CGPoint ponto = [gesture locationInView:self.tableView];
        NSIndexPath *index= [self.tableView indexPathForRowAtPoint:ponto];
        Contato * contato = [contatos objectAtIndex:index.row]; 
        contatoSelecionado = contato;
        
        UIActionSheet *opcoes =[[UIActionSheet alloc] initWithTitle:contato.nome delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:@"Ligar", @"Enviar Email",@"Visualizar site",@"Abrir Mapa",@"Twittar", nil];
        
        [opcoes showInView:self.tabBarController.view];
    }
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

-(void) contatoAdicionado:(Contato *)c{
    
    [self.contatos addObject:c];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{

    switch (buttonIndex) {
        case 0:
            [self ligar];
            break;
        case 1:
            [self enviarEmail];
            break;
        case 2:
            [self abrirSite];
            break;
        case 3:
            [self mostrarMapa];
            break;
        case 4:
            [self twittar];
            break;
        default:
            break;
    }

}

-(void ) abrirAplicativoComURL:(NSString *)url{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

-(void) ligar{
    
    UIDevice *device = [UIDevice currentDevice];
    
    if([device.model isEqualToString:@"iPhone"]){
        NSString *numero = [NSString stringWithFormat:@"tel:%@", contatoSelecionado.telefone];
        [self abrirAplicativoComURL:numero];    
    }else{
        [[[UIAlertView alloc] initWithTitle:@"Impossível fazer ligação" message:@"Seu dispositivo não é um iPhone." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]show];
        
    }
}

-(void)abrirSite{
//    NSString * url = contatoSelecionado.site;
//    [self abrirAplicativoComURL:url];
    SiteDoContatoViewController *site = [[SiteDoContatoViewController alloc]initWithContato:contatoSelecionado];
    //UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:site];
    [self.navigationController pushViewController:site animated:YES];

}

-(void) mostrarMapa{
    NSString * url = [[NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", contatoSelecionado.endereco] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [self abrirAplicativoComURL:url];

}

-(void)enviarEmail{
    if([MFMailComposeViewController canSendMail]){
        MFMailComposeViewController *enviaEmail = [[MFMailComposeViewController alloc]init];
        enviaEmail.mailComposeDelegate = self;
        
        [enviaEmail setToRecipients:[NSArray arrayWithObject:contatoSelecionado.email]];
        [enviaEmail setSubject:@"Caelum"];
        [self presentModalViewController:enviaEmail animated:YES];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ops" message:@"You cannot send an email" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil]; 
        [alert show];
    }
}

-(void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    [self dismissModalViewControllerAnimated:YES];

}  

- (void) twittar{
    TWTweetComposeViewController *twt = [[TWTweetComposeViewController alloc] init];
    [twt setInitialText:contatoSelecionado.twitter];
    [self presentModalViewController:twt animated:YES];
}

@end
