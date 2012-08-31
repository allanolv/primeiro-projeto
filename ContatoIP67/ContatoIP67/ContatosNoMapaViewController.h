//
//  ContatosNoMapaViewController.h
//  ContatoIP67
//
//  Created by ios2971 on 28/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MKMapView.h>

@interface ContatosNoMapaViewController : UIViewController<MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapa;
@property (weak,nonatomic) NSMutableArray *contatos;

@end
