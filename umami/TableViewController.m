//
//  TableViewController.m
//  umami
//
//  Created by Emanuel Campos on 10.01.13.
//  Copyright (c) 2013 bitter. All rights reserved.
//

#import "TableViewController.h"
#import "DetailViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController


- (id)initWithStyle:(UITableViewStyle)style
{ NSLog(@"proably problematic");
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)backButtonHit
{
    // removeItemAtPath: newFilepath stuff here
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)viewDidLoad
{
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStylePlain
                                                                         target:self
                                                                         action:@selector(backButtonHit)];
    [self selectData];
    [super viewDidLoad];
}

- (void)selectData
{

    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"count of Cells");
    return 1;
}

//Number of cells
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"filling cells");
    static NSString *CellIdentifier = @"qouteCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    NSString *twitterText = [NSString stringWithFormat:@"%@", [[[_tableViewDict objectForKey:@"results"] valueForKey:@"text"] objectAtIndex:indexPath.row]];
    NSString *twitterName = [NSString stringWithFormat:@"%@", [[[_tableViewDict  objectForKey:@"results"]valueForKey:@"from_user_name"] objectAtIndex:indexPath.row]];
    
    
/*    NSString *text = [NSString stringWithFormat:@"%@", [[daylifeArticles valueForKey:@"headline"] objectAtIndex:indexPath.row]];
    NSString *name =  [NSString stringWithFormat:@"%@", [[[daylifeArticles valueForKey:@"source"] valueForKey:@"name"] objectAtIndex:indexPath.row]];*/
    cell.textLabel.text = [NSString stringWithFormat:@"%@", twitterName];
    cell.detailTextLabel.text = twitterText;
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *contentDetail = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];

    [self.navigationController pushViewController:contentDetail animated:YES];
    
}

@end
