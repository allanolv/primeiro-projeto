//
//  ContatosNoMapaViewController.m
//  ContatoIP67
//
//  Created by ios2971 on 28/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ContatosNoMapaViewController.h"
#import <MapKit/MapKit.h>
#import "Contato.h"

@interface ContatosNoMapaViewController ()

@end

@implementation ContatosNoMapaViewController
@synthesize  mapa, contatos;
- (id)init
{
    self = [super init];
    if (self) {
        UIImage *imageTabItem = [UIImage imageNamed:@"mapa-contatos.png"];
        UITabBarItem *tabItem = [[UITabBarItem alloc]initWithTitle:@"Mapa" image:imageTabItem tag:0];
        self.tabBarItem = tabItem;
        self.navigationItem.title=@"Localização";
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
    MKUserTrackingBarButtonItem *botaoLocalizacao = [[MKUserTrackingBarButtonItem alloc]initWithMapView:self.mapa];
    self.navigationItem.leftBarButtonItem = botaoLocalizacao;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewWillAppear:(BOOL)animated{
    [self.mapa addAnnotations:contatos];
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.mapa removeAnnotations:contatos];
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    if([annotation isKindOfClass:[MKUserLocation class]]){
        return  nil;
    }
    
    static NSString *identifier = @"Pino";
    
    MKPinAnnotationView *pino = (MKPinAnnotationView *)[mapa dequeueReusableAnnotationViewWithIdentifier:identifier];
    if(!pino){
        pino = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
    }else {
        pino.annotation = annotation;
    }
    Contato *contato = (Contato *)annotation;
    pino.pinColor = MKPinAnnotationColorRed;
    pino.canShowCallout = YES;
    
    if(contato.foto){
        UIImageView *imagemContato = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 32, 32)];
        imagemContato.image = contato.foto;
        pino.leftCalloutAccessoryView = imagemContato;
    }
    return pino;
}
@end
