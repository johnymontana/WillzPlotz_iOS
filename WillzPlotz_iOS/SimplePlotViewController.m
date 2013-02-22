//
//  SimplePlotViewController.m
//  WillzPlotz_iOS
//
//  Created by lyonwj on 2/21/13.
//  Copyright (c) 2013 William Lyon. All rights reserved.
//

#import "SimplePlotViewController.h"

@interface SimplePlotViewController ()

@end

@implementation SimplePlotViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _scroller.contentSize = CGSizeMake(kDefaultGraphWidth, kGraphHeight);
    [self.graph_view setUpWithData:@[@0.0, @0.1, @0.2, @0.3, @0.7, @0.9, @0.1, @0.77, @0.123, @0.8, @0.1, @0.2, @0.3, @0.4, @0.5, @0.6]];
     
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
