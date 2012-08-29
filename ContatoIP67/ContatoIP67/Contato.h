//
//  Contato.h
//  ContatoIP67
//
//  Created by ios2971 on 21/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contato : NSObject<NSCoding>

@property NSString *nome;
@property NSString *telefone;
@property NSString *email;
@property NSString *endereco;
@property NSString *site;
@property NSString *twitter;
@property UIImage *foto;
@end
