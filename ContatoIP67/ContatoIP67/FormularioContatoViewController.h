//
//  FormularioContatoViewController.h
//  ContatoIP67
//
//  Created by ios2971 on 21/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FormularioContatoViewController : UIViewController

@property (strong) NSMutableArray *contatos;

@property (weak, nonatomic) IBOutlet UITextField *nome;
@property (weak, nonatomic) IBOutlet UITextField *telefone;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *endereco;
@property (weak, nonatomic) IBOutlet UITextField *site;
- (IBAction)pegardadosformulario:(id)sender;
- (IBAction)proximoelemento:(id)sender;
- (void)esconderformulario;

@end
