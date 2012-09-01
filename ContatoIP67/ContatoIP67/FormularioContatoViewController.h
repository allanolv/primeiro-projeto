//
//  FormularioContatoViewController.h
//  ContatoIP67
//
//  Created by ios2971 on 21/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contato.h"
@protocol ContatoProtocol;

@interface FormularioContatoViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate>

@property (strong) NSMutableArray *contatos;
@property (strong) Contato *Objcontatos;
@property (strong) NSManagedObjectContext *contexto;

@property (weak, nonatomic) IBOutlet UITextField *nome;
@property (weak, nonatomic) IBOutlet UITextField *telefone;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *endereco;
@property (weak, nonatomic) IBOutlet UITextField *site;
@property (weak, nonatomic) IBOutlet UITextField *twitter;
@property (weak, nonatomic) IBOutlet UITextField *latitude;
@property (weak, nonatomic) IBOutlet UITextField *longitude;
@property (weak, nonatomic) IBOutlet UIButton *foto;
@property (weak, nonatomic) IBOutlet UITextField *campoAtual;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;


@property (weak) id<ContatoProtocol> delegate;
- (id)initWithObjContatos:(Contato *) _contato;
- (IBAction)proximoelemento:(id)sender;
- (IBAction)selecionaFoto:(id)sender;
- (IBAction)buscaCoordenadas:(id)sender;
- (void)esconderformulario;

@end

@protocol ContatoProtocol <NSObject>

- (void) contatoAdicionado:(Contato *)c;

@end

