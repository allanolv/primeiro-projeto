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

@interface FormularioContatoViewController : UIViewController

@property (strong) NSMutableArray *contatos;
@property (strong) Contato *Objcontatos;

@property (weak, nonatomic) IBOutlet UITextField *nome;
@property (weak, nonatomic) IBOutlet UITextField *telefone;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *endereco;
@property (weak, nonatomic) IBOutlet UITextField *site;
@property (weak) id<ContatoProtocol> delegate;
- (id)initWithObjContatos:(Contato *) _contato;
- (IBAction)proximoelemento:(id)sender;
- (void)esconderformulario;

@end

@protocol ContatoProtocol <NSObject>

- (void) contatoAdicionado:(Contato *)c;

@end

