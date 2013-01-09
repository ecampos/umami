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
@synthesize picture = _picture;
@synthesize itemNumber = _itemNumber;

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
    _itemNumber = 2;
    switch (_itemNumber) {
        case 0:
            _detailDescriptionLabel.text =@"go fuck yourself";
            break;
        case 1:
            _detailDescriptionLabel.text =@"just kidding";
            break;
        case 2:
            _detailDescriptionLabel.text =@"we're still friends aren't we?";
            break;

            
        default:
            _detailDescriptionLabel.text = @"gaping";
            break;
    }
    // Update the user interface for the detail item.

   /* if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
    */
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
