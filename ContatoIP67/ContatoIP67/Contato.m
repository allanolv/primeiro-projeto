//
//  Contato.m
//  ContatoIP67
//
//  Created by ios2971 on 21/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Contato.h"

@implementation Contato

@synthesize nome;
@synthesize telefone;
@synthesize email;
@synthesize endereco;
@synthesize site;

- (NSString *)description{
    return [NSString stringWithFormat:@"Nome: %@ \r Telefone: %@ \r E-mail: %@ \r Endereço: %@ \r Site: %@",
            nome, telefone, email,endereco,site];
}
@end
