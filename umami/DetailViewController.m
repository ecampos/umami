//
//  DetailViewController.m
//  umami
//
//  Created by Emanuel Campos on 02.01.13.
//  Copyright (c) 2013 bitter. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController
@synthesize heroImage = _heroImage;
@synthesize heroName = _heroName;
@synthesize content = _content;



#pragma mark - Managing the detail item
/*
- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}
*/
- (void)configureView
{

    }
    // Update the user interface for the detail item.

   /* if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
    */


- (void)viewDidLoad
{
    NSString *TODO = @"TODO";
    _heroImage.image = [UIImage imageNamed:TODO];
    _heroName.text = TODO;
    _content.text = TODO;
    [super viewDidLoad];
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
