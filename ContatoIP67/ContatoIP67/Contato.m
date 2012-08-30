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
@synthesize twitter;
@synthesize foto;
@synthesize latitude;
@synthesize longitude;

- (NSString *)description{
    return [NSString stringWithFormat:@"Nome: %@ \r Telefone: %@ \r E-mail: %@ \r Endereco: %@ \r Site: %@ \r %@",nome, telefone, email,endereco,site,twitter];
}
-(void) encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:nome forKey:@"nome"];
    [aCoder encodeObject:telefone forKey:@"telefone"];
    [aCoder encodeObject:email forKey:@"email"];
    [aCoder encodeObject:endereco forKey:@"endereco"];
    [aCoder encodeObject:site forKey:@"site"];
    [aCoder encodeObject:twitter forKey:@"twitter"];
    [aCoder encodeObject:foto forKey:@"foto"];
    [aCoder encodeObject:latitude forKey:@"latitude"];
    [aCoder encodeObject:longitude forKey:@"longitude"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        [self setNome:[aDecoder decodeObjectForKey:@"nome"]];
        [self setTelefone:[aDecoder decodeObjectForKey:@"telefone"]];
        [self setEmail:[aDecoder decodeObjectForKey:@"email"]];
        [self setEndereco:[aDecoder decodeObjectForKey:@"endereco"]];
        [self setSite:[aDecoder decodeObjectForKey:@"site"]];
        [self setTwitter:[aDecoder decodeObjectForKey:@"twitter"]];
        [self setFoto:[aDecoder decodeObjectForKey:@"foto"]];
        [self setLatitude:[aDecoder decodeObjectForKey:@"latitude"]];
        [self setLongitude:[aDecoder decodeObjectForKey:@"longitude"]];
    }
    return self;
}

@end
