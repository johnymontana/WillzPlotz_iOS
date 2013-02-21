//
//  IndexPlotViewController.m
//  WillzPlotz_iOS
//
//  Created by lyonwj on 2/21/13.
//  Copyright (c) 2013 William Lyon. All rights reserved.
//

#import "IndexPlotViewController.h"
#import "GraphCollectionViewCell.h"
#import "GraphView.h"
#import "QuotezDownload.h"
#import "PlotViewController.h"

@interface IndexPlotViewController () <UICollectionViewDataSource>


@end

@implementation IndexPlotViewController

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 15;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Graph" forIndexPath:indexPath];
    
    [self updateCell:cell usingSymbol:@"AAPL"];
    return cell;
}

-(void)updateCell:(UICollectionViewCell *)cell usingSymbol:(NSString*) symbol
{
    if ([cell isKindOfClass:[GraphCollectionViewCell class]])
    {
        GraphView* graphView = ((GraphCollectionViewCell*)cell).graph_view;
        
        graphView.plotData = [QuotezDownload getQuotes:symbol];
        graphView.symbol = symbol;
    }
}

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    PlotViewController* plvc = [segue destinationViewController];
    
    // [plvc setUpWithData:[QuotezDownload getQuotes:@"AAPL"]];
    plvc.plotData = ((GraphView*)sender).plotData;
    plvc.symbol = ((GraphView*)sender).symbol;
    
}


-(IBAction)selectGraph:(UITapGestureRecognizer *)gesture
{
    CGPoint tapLocation = [gesture locationInView:self.graphCollectionView];
    
    NSIndexPath *indexPath = [self.graphCollectionView indexPathForItemAtPoint:tapLocation];
    
    if (indexPath)
    {
        // perform segue!!!
        NSLog(@"Perform segue!");
        
        PlotViewController* plvc = [[PlotViewController alloc] init];
        
        // [plvc setUpWithData:[QuotezDownload getQuotes:@"AAPL"]];
        GraphCollectionViewCell* cell = [self.collectionView cellForItemAtIndexPath:indexPath];
        
        GraphView* graphView = ((GraphCollectionViewCell*)cell).graph_view;

        plvc.plotData = graphView.plotData;
        plvc.symbol = graphView.symbol;

        
        [self.navigationController pushViewController:plvc animated:YES];
       // [self.navigationController performSegueWithIdentifier:@"pushGraphView" sender:graphView];
    }
}

@end
