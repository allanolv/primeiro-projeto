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
@synthesize Objcontatos;
@synthesize nome;
@synthesize telefone;
@synthesize email;
@synthesize endereco;
@synthesize site;
@synthesize twitter;
@synthesize delegate;
@synthesize foto;

- (id)initWithObjContatos:(Contato *) _contato{
    self = [super init];
    if(self){
        self.Objcontatos = _contato;
        
        UIBarButtonItem *confirmar =[[UIBarButtonItem alloc]initWithTitle:@"Confirmar" style:UIBarButtonItemStylePlain target:self action:@selector(atualizarContato)];
        self.navigationItem.rightBarButtonItem = confirmar;
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
    if(self.Objcontatos){
        nome.text = Objcontatos.nome;
        telefone.text=Objcontatos.telefone;
        email.text = Objcontatos.email;
        endereco.text = Objcontatos.endereco;
        site.text = Objcontatos.site;
        twitter.text = Objcontatos.twitter;
    }
}

- (void)viewDidUnload
{
    [self setNome:nil];
    [self setTelefone:nil];
    [self setEmail:nil];
    [self setEndereco:nil];
    [self setSite:nil];
    [self setTwitter:nil];
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
    if(!self.Objcontatos)
    {
        Objcontatos = [[Contato alloc] init];
    }
        Objcontatos.nome = nome.text ;
        Objcontatos.telefone=telefone.text;
        Objcontatos.email=email.text;
        Objcontatos.endereco=endereco.text;
        Objcontatos.site=site.text;
        Objcontatos.twitter = twitter.text;

    /*[c setNome:[nome text]];
    [c setTelefone:[telefone text]];
    [c setEmail:[email text]];
    [c setEndereco:[endereco text]];
    [c setSite:[site text]];
    [c setTwitter:[twitter text]];
    */
//    [dadosdocontato setValue:nome forKey:@"Nome"];
//    [dadosdocontato setValue:telefone forKey:@"Telefone"];
//    [dadosdocontato setValue:email forKey:@"Email"];
//    [dadosdocontato setValue:endereco forKey:@"Endereço"];
//    [dadosdocontato setValue:site forKey:@"Site"];
    
    return Objcontatos;
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
        [twitter becomeFirstResponder];
    }else if (twitter==sender) {
        [site resignFirstResponder];

    }
}

- (void) esconderformulario{
    [self dismissModalViewControllerAnimated:YES];
}

- (void) criarContato{

    Contato *c = [self pegardadosformulario];
//    [self.contatos addObject:c];
    [delegate contatoAdicionado:c ];
    NSLog(@"contatos:%d", self.contatos.count);
    [self dismissModalViewControllerAnimated:YES];
    [[self view] endEditing:YES];


}

- (void) atualizarContato{

    [self pegardadosformulario];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)selecionaFoto:(id)sender{
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        
    }else {
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.allowsEditing = YES;
        picker.delegate = self;
        [self presentModalViewController:picker animated:YES];
    }

}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *imagemSelecionada = [info valueForKey:UIImagePickerControllerEditedImage];
    [foto setImage:imagemSelecionada forState:UIControlStateNormal];
    [picker dismissModalViewControllerAnimated:YES];
}

@end






































