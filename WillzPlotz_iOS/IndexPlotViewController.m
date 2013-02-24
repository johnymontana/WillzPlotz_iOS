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
    
    [self updateCell:cell usingSymbol:self.willzIndexSymbols[[indexPath indexAtPosition:[indexPath length]-1]]];
     
    NSLog(@"Index at position %d: %d", [indexPath length], [indexPath indexAtPosition:[indexPath length]-1]);
    return cell;
}

-(void)updateCell:(UICollectionViewCell *)cell usingSymbol:(NSString*) symbol
{
    if ([cell isKindOfClass:[GraphCollectionViewCell class]])
    {
        GraphView* graphView = ((GraphCollectionViewCell*)cell).graph_view;
        
        graphView.plotData = [QuotezDownload getQuotes:symbol];
        graphView.symbol = symbol;
        ((GraphCollectionViewCell*)cell).plotButton.titleLabel.text = symbol;
        
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
    self.willzIndexSymbols = @[@"AAPL", @"GE", @"C", @"TSLA", @"ORCL", @"MSFT", @"GOOG", @"IBM", @"GS", @"QQQ", @"SPY", @"BAC", @"BP", @"IWM", @"XLF"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    PlotViewController* plvc = [segue destinationViewController];
//
//    // [plvc setUpWithData:[QuotezDownload getQuotes:@"AAPL"]];
//    plvc.plotData = ((GraphView*)sender).plotData;
//    plvc.symbol = ((GraphView*)sender).symbol;
//
//}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[GraphView class]])
    {
        PlotViewController* plvc = [[PlotViewController alloc] init];
        plvc.graph_view = (GraphView*)sender;
        plvc.plotData = ((GraphView*)sender).plotData;
        plvc.symbol = ((GraphView*)sender).symbol;

    }
    
    else
    {
        
        PlotViewController* plvc = [segue destinationViewController];
        NSLog(@"Sender class: %@", [[sender class] description]);
        NSLog(@"Sender title: %@", ((UIButton*)sender).titleLabel.text);
    
    
        plvc.plotData = [QuotezDownload getQuotes:((UIButton*)sender).titleLabel.text];
        plvc.symbol = ((UIButton*)sender).titleLabel.text;
    }
}


-(IBAction)selectGraph:(UITapGestureRecognizer *)gesture
{
    CGPoint tapLocation = [gesture locationInView:self.graphCollectionView];
    
    NSIndexPath *indexPath = [self.graphCollectionView indexPathForItemAtPoint:tapLocation];
    
    if (indexPath)
    {
        // perform segue!!!
        NSLog(@"Perform segue!");
        
       // PlotViewController* plvc = [[PlotViewController alloc] init];
        NSString *vcid = @"plotViewController";
        UIViewController *plvc = [self.storyboard instantiateViewControllerWithIdentifier:vcid];
        // [plvc setUpWithData:[QuotezDownload getQuotes:@"AAPL"]];
        GraphCollectionViewCell* cell = [self.collectionView cellForItemAtIndexPath:indexPath];
        
        GraphView* graphView = ((GraphCollectionViewCell*)cell).graph_view;
        GraphView* newGraphView = [[GraphView alloc] initWithFrame:graphView.frame];
        
      //  plvc.graph_view = newGraphView;
      //  plvc.plotData = graphView.plotData;
      //  plvc.symbol = graphView.symbol;
        
       // plvc.view = graphView;
        [self.navigationController pushViewController:plvc animated:YES];
     //   [self.navigationController performSegueWithIdentifier:@"pushPlot" sender:graphView];
    
       // [self.navigationController performSegueWithIdentifier:@"pushGraphView" sender:graphView];
    }
}

@end
