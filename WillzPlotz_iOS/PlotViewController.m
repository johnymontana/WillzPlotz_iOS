//
//  PlotViewController.m
//  WillzPlotz_iOS
//
//  Created by lyonwj on 2/20/13.
//  Copyright (c) 2013 William Lyon. All rights reserved.
//

#import "PlotViewController.h"

@interface PlotViewController ()

@end

@implementation PlotViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       // [self.graph_view setUpWithData:self.plotData];
    }
    return self;
}

-(void)plotData:(NSArray*)plotData
{
    _plotData = plotData;
    _scroller.contentSize = CGSizeMake(kDefaultGraphWidth, kGraphHeight);
    [self.graph_view setUpWithData:self.plotData];
    self.graph_view.symbol = self.symbol;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _scroller.contentSize = CGSizeMake(kDefaultGraphWidth, kGraphHeight);
    [self.graph_view setUpWithData:self.plotData];
    self.graph_view.symbol = self.symbol;
    
   // [self.graph_view getOwnData];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUpWithData:(NSArray*) plotData
{
   // [self.graph_view setUpWithData:plotData];
}
@end
