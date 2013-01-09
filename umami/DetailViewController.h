//
//  DetailViewController.h
//  umami
//
//  Created by Emanuel Campos on 02.01.13.
//  Copyright (c) 2013 bitter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property int itemNumber;
@property (weak, nonatomic) IBOutlet UIImageView *picture;

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
