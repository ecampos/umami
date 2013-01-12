//
//  MasterViewController.h
//  umami
//
//  Created by Emanuel Campos on 02.01.13.
//  Copyright (c) 2013 bitter. All rights reserved.
//

#import <UIKit/UIKit.h>

int serviceInt;
@interface MasterViewController : UITableViewController

@property (strong, nonatomic) NSArray * serviceList;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, weak) NSDictionary *segueDict;
@property (nonatomic, strong) NSDictionary *daylifeArticles;
@property (nonatomic, strong) NSDictionary *daylifeResponse;
@property (nonatomic, strong) NSDictionary *twitterResponse;
@property (nonatomic, strong) NSDictionary *facebooResponse;

@end
