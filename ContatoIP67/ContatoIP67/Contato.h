//
//  Contato.h
//  ContatoIP67
//
//  Created by ios2971 on 21/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Contato : NSObject<NSCoding, MKAnnotation>

@property NSString *nome;
@property NSString *telefone;
@property NSString *email;
@property NSString *endereco;
@property NSString *site;
@property NSString *twitter;
@property NSNumber *latitude;
@property NSNumber *longitude;
@property UIImage *foto;


@end
