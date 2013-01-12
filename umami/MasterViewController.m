//
//  MasterViewController.m
//  umami
//
//  Created by Emanuel Campos on 02.01.13.
//  Copyright (c) 2013 bitter. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"
#import "TableViewController.h"
#import <CommonCrypto/CommonDigest.h>



#define CC_MD5_DIGEST_LENGTH 16


@interface MasterViewController () {

}
@end

@implementation MasterViewController
@synthesize serviceList = _serviceList;
@synthesize searchBar = _searchBar;
@synthesize facebooResponse = _facebooResponse;
@synthesize twitterResponse = _twitterResponse;
@synthesize daylifeResponse = _daylifeResponse;
@synthesize daylifeArticles = _daylifeArticles;
@synthesize segueDict;


-(void)fetchData
{
    
    NSLog(@"fetchQutes");
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //input parameters
        NSString *query = @"obama";
        NSString *endTime = @"2012-12-07";
        NSString *startTime =@"2012-10-28";
        
        //Daylife parameters
        NSString *daylife  = @"http://freeapi.daylife.com/jsonrest/publicapi/4.10/search_getRelatedArticles?";
        
        NSString *limit =@"10";
        NSString *accessKey = @"4d68ec63b744eec43fffad2fa9af98d1";
        NSString *signature = @"02919f7064f10403310460de2737b7ab";
        
        //Twitter parameters
        NSString *twitter = @"http://search.twitter.com/search.json?q=";
        
        NSString *facebook = @"https://graph.facebook.com/search?q=";
        
        
        /*    NICE TO HAVE PARAMETERS not necessary for request to work
         NSString *offset = @"&offset=";
         NSString *sort = @"relevance";
         NSString *sourceFilter =@"&source_filter_id=";
         NSString *includeImage =@"&include_image="; //add to url
         NSString *includeScores = @"&include_scores="; // add to url
         NSString *slidingExcerpt = @"&sliding_excerpt=1"; // add to url
         NSString *hasImage = @"&has_image="; // add to url
         NSString *headlineDiversity = @"&headline_diversity="; //add to url
         NSString *blockNSFW = @"&block_nsfw=";
         NSString *whiteList =@"&source_whitelist=";
         NSString *blackList =@"&source_blacklist=";
         
         
         !!!TODO calculate Signature by hashing access key, shared secret and query!!!!
         
         NSString *sharedSecret = @"fd6167e10d2a54abe0206789adbaac09";
         NSString *fancySignature = [NSString stringWithFormat:@"%@%@%@",accessKey, sharedSecret, query];
         NSInteger *hashedSignature = MD5HASH(fancySignature);
         %@%@%@%@%@%@%@%@%@%@%@%@
         NSLog(@"%@", fancySignature);
         NSLog(@"%@", hashedSignature);*/
        
        //Daylife request perparation
        NSString *daylifeURLString = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@%@%@", daylife,@"query=", query,@"&start_time=", startTime, @"&end_time=", endTime, @"&limit=",limit, @"&accesskey=", accessKey, @"&signature=", signature];
        NSURL *daylifeURL =[NSURL URLWithString:daylifeURLString];
        NSData *daylifeData = [NSData dataWithContentsOfURL:daylifeURL];
        
        //Twitter request preparation
        NSString *twitterURLString = [NSString stringWithFormat:@"%@%@%@%@", twitter, query, @"%20until:", endTime];
        NSURL *twitterURL = [NSURL URLWithString:twitterURLString];
        NSData *twitterData = [NSData dataWithContentsOfURL:twitterURL];
        
        NSString *facebookURLString = [NSString stringWithFormat:@"%@%@%@", facebook, query, @"&type=post"];
        NSURL *facebookURL = [NSURL URLWithString:facebookURLString];
        NSData *facebookData = [NSData dataWithContentsOfURL:facebookURL];
        
        //NSerror is required for web requests
        NSError *error;
        
        _twitterResponse = [NSJSONSerialization JSONObjectWithData:twitterData
                                                          options:kNilOptions
                                                            error:&error];
        _daylifeResponse = [NSJSONSerialization JSONObjectWithData:daylifeData
                                                          options:kNilOptions
                                                            error:&error];
        _facebooResponse = [NSJSONSerialization JSONObjectWithData:facebookData
                                                           options:kNilOptions
                                                             error:&error];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            //Moving daylife data to sparate container in order to reduce duplicate code
            _daylifeArticles =  [[[_daylifeResponse objectForKey:@"response"]objectForKey:@"payload"] objectForKey:@"article"];
            
            
            [self.tableView reloadData];
            
        });
    });
    
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	  _serviceList = [[NSArray alloc] initWithObjects:@"Facebook", @"Twitter", @"News", nil];
 //    self.fetchData;
 //   [self setTitle:@"Search"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _serviceList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [_serviceList objectAtIndex:indexPath.row];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     TableViewController *destination = [[TableViewController alloc] initWithNibName:@"TableViewController" bundle:nil];
  //  if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        int nr;
        
        if ([[_serviceList objectAtIndex:indexPath.row] isEqual:@"Facebook"])
        {
            destination.serviceIdentifier = 0;
            [destination setTitle:[_serviceList objectAtIndex:indexPath.row]];
            destination.tableViewDict = _facebooResponse;
        }
        if ([[_serviceList objectAtIndex:indexPath.row] isEqual:@"Twitter"])
        {
            destination.serviceIdentifier = 1;
            [destination setTitle:[_serviceList objectAtIndex:indexPath.row]];
            destination.tableViewDict = _twitterResponse;
        }
        if ([[_serviceList objectAtIndex:indexPath.row] isEqual:@"News"])
        {
            destination.serviceIdentifier = 2;
        [destination setTitle:[_serviceList objectAtIndex:indexPath.row]];
            destination.tableViewDict = _daylifeResponse;
        }
        nr = destination.serviceIdentifier;
        NSLog(@"%d",nr);
    }
    [self.navigationController pushViewController:destination animated:YES];
}
@end
