//
//  UltimosTweetsViewController.m
//  RequestJson
//
//  Created by ios2971 on 30/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UltimosTweetsViewController.h"
#import "DCtweet.h"

@interface UltimosTweetsViewController ()

@end

@implementation UltimosTweetsViewController

@synthesize ultimosTweets;

-(void) viewDidLoad{
    NSURL *URL = [NSURL URLWithString:@"https://api.twitter.com/1/statuses/user_timeline.json?screen_name=allan_olv&count=100"]; 
    NSData *data = [NSData dataWithContentsOfURL:URL];
    NSMutableArray *tweets = [NSJSONSerialization JSONObjectWithData:data 
                                    options:NSJSONReadingMutableContainers 
                                    error:nil];
    
    self.ultimosTweets = [[NSMutableDictionary alloc]init];
    
    for (NSMutableDictionary *tweetDict in tweets) {
        DCtweet *tweet = [[DCtweet alloc]init];
        tweet.text = [tweetDict objectForKey:@"text"];
        int indice = [tweets indexOfObject:tweetDict];
        
        if(indice % 2 ==0){
            [self addObject:tweet forKey:@"Par"];
        }else {
            [self addObject:tweet forKey:@"Impar"];
        }
    }
    NSLog(@"%@",[tweets objectAtIndex:0]);
}
-(void) addObject:(DCtweet *) tweet forKey:(NSString *)chave {
    NSMutableArray *tweetsPares = [self.ultimosTweets objectForKey:chave];
    if(!tweetsPares){
        tweetsPares = [[NSMutableArray alloc]init];
        [self.ultimosTweets setObject:tweetsPares forKey:chave];
    }
    [tweetsPares addObject:tweet];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {

    return [[self.ultimosTweets allKeys]count];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *parOuImpar = [[self.ultimosTweets allKeys]objectAtIndex:section];
    NSMutableArray *tweets = [self.ultimosTweets objectForKey:parOuImpar];
    return [tweets count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *parOuImpar = [[self.ultimosTweets allKeys]objectAtIndex:indexPath.section];
    NSMutableArray *tweets = [self.ultimosTweets objectForKey:parOuImpar];
    DCtweet *tweet = [tweets objectAtIndex:indexPath.row];
    UITableViewCell *celula = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!celula){
        celula = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];}
    celula.textLabel.text = tweet.text;
    
    return  celula;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [[self.ultimosTweets allKeys]objectAtIndex:section];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

NSString *parOuImpar = [[self.ultimosTweets allKeys]objectAtIndex:indexPath.section];
NSMutableArray *tweets = [self.ultimosTweets objectForKey:parOuImpar];
DCtweet *tweet = [tweets objectAtIndex:indexPath.row];
    

    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Tweet" message:tweet.text delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:nil];
    [alert show];
}
@end
