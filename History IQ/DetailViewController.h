//
//  DetailViewController.h
//  Rip
//
//  Created by Lance Walker on 5/25/15.
//  Copyright (c) 2015 Lance Walker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

