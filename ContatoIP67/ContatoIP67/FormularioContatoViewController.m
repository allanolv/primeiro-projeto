//
//  FormularioContatoViewController.m
//  ContatoIP67
//
//  Created by ios2971 on 21/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FormularioContatoViewController.h"
#import "Contato.h"

@interface FormularioContatoViewController ()

@end

@implementation FormularioContatoViewController

@synthesize contatos;
@synthesize nome;
@synthesize telefone;
@synthesize email;
@synthesize endereco;
@synthesize site;

- (id)initWithContatos:(NSMutableArray *) contato{
    self = [self init];
    if(self){
        self.contatos = contato;
    }
    return self;
}
- (id)init{
    self = [super init];
    if(self){
        self.contatos = [[NSMutableArray alloc]init];
        self.navigationItem.title=@"Cadastro";
        UIBarButtonItem *cancelar = [[UIBarButtonItem alloc]initWithTitle:@"Cancelar"
                                                                    style:UIBarButtonItemStylePlain
                                                                    target:self
                                                                   action:@selector(esconderformulario)];
        self.navigationItem.leftBarButtonItem = cancelar;
        UIBarButtonItem *adicionar = [[UIBarButtonItem alloc]initWithTitle:@"Adicionar"
                                                                    style:UIBarButtonItemStylePlain
                                                                   target:self
                                                                   action:@selector(criarContato)];
        self.navigationItem.rightBarButtonItem = adicionar;
        
        self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"Voltar" style:UIBarButtonItemStylePlain target:self action:@selector(esconderformulario)];
    }
    return self;
}





- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setNome:nil];
    [self setTelefone:nil];
    [self setEmail:nil];
    [self setEndereco:nil];
    [self setSite:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (Contato *)pegardadosformulario{
    
//    NSMutableDictionary *dadosdocontato = [[NSMutableDictionary alloc] init];
    Contato *c = [[Contato alloc] init];
    [c setNome:[nome text]];
    [c setTelefone:[telefone text]];
    [c setEmail:[email text]];
    [c setEndereco:[endereco text]];
    [c setSite:[site text]];
    
//    [dadosdocontato setValue:nome forKey:@"Nome"];
//    [dadosdocontato setValue:telefone forKey:@"Telefone"];
//    [dadosdocontato setValue:email forKey:@"Email"];
//    [dadosdocontato setValue:endereco forKey:@"Endereço"];
//    [dadosdocontato setValue:site forKey:@"Site"];
    
    return c;
}

- (IBAction)proximoelemento:(id)sender{
    if (nome==sender) {
        [telefone becomeFirstResponder];
    }else if (telefone==sender) {
        [email becomeFirstResponder];
    }else if (email==sender) {
        [endereco becomeFirstResponder];
    }else if (endereco==sender) {
        [site becomeFirstResponder];
    }else if (site==sender) {
        [site resignFirstResponder];
    }
}

- (void) esconderformulario{
    [self dismissModalViewControllerAnimated:YES];
}

- (void) criarContato{

    Contato *c = [self pegardadosformulario];
    [self.contatos addObject:c];
    NSLog(@"contatos:%d", self.contatos.count);
    [self dismissModalViewControllerAnimated:YES];
    [[self view] endEditing:YES];


}
@end






































