//
//  MasterViewController.m
//  umami
//
//  Created by Emanuel Campos on 02.01.13.
//  Copyright (c) 2013 bitter. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"
#import <CommonCrypto/CommonDigest.h>

#define CC_MD5_DIGEST_LENGTH 16
/*
- (NSString *)md5:(NSString *)str {
    const char *cStr = [str UTF8String];
    unsigned char result [CC_MD5_DIGEST_LENGTH];
    CC_MD5 (cstr, strlen(cstr), result);
    return [NSString stringWithFormat: @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X"],
    result [0], result [1],result [2], result [3],result [4], result [5],result [6], result [7],result [8], result [9],result [10], result [11], result [12], result [13],result [14], result [[15] ];
    
}
*/
@interface MasterViewController () {

}
@end

@implementation MasterViewController
@synthesize list = _list;


- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	  _list = [[NSArray alloc] initWithObjects:@"Facebook", @"Twitter", @"News", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [_list objectAtIndex:indexPath.row];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        NSLog(@"%@", indexPath);
        
        
    /*    NSDate *object = _list[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];*/
    }
}

@end
