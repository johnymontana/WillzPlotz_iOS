//
//  SymbolInputViewController.m
//  WillzPlotz_iOS
//
//  Created by lyonwj on 2/19/13.
//  Copyright (c) 2013 William Lyon. All rights reserved.
//

#import "SymbolInputViewController.h"
#import "QuotezDownload.h"

@interface SymbolInputViewController ()

@end

@implementation SymbolInputViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [QuotezDownload getQuotes:@"AAPL"];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
