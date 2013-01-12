//
//  TableViewController.h
//  umami
//
//  Created by Emanuel Campos on 10.01.13.
//  Copyright (c) 2013 bitter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController
@property int serviceIdentifier;

@property (strong, nonatomic) NSDictionary *tableViewDict;
-(void) backButtonHit;
@end
