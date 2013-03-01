//
//  PlotViewController.m
//  WillzPlotz_iOS
//
//  Created by lyonwj on 2/20/13.
//  Copyright (c) 2013 William Lyon. All rights reserved.
//

#import "PlotViewController.h"
#import "StockModel.h"
#import "GraphView.h"
#import "PriceGraphView.h"

@interface PlotViewController ()

@end

@implementation PlotViewController

-(id)initWithStockModel:(StockModel*)stockModel
{
    self = [super init];
    if (self)
    {
        self.myStockModel = [[StockModel alloc] initWithSymbol:stockModel.symbol];
        
        NSLog(@"init with symbol: %@", stockModel.symbol);
        _price_view = [[GraphView alloc] init];
        
        
        _price_view.dataSource = self.myStockModel.priceHistory;
        _volume_view.dataSource = self.myStockModel.volumeHistory;
        [self.volume_view setNeedsDisplay];
        [self.price_view setNeedsDisplay];
    }
    
    return self;
}

-(void)setUpWithSymbol:(NSString*)symbol
{
    self.symbol = symbol;
    //self.myStockModel = [[StockModel alloc] initWithSymbol:symbol];
    //self.price_view.dataSource = self.myStockModel.priceHistory;
    //[self.price_view setNeedsDisplay];
    NSLog(@"Length of self.dataSource.plotData: %d", [self.price_view.dataSource.plotData count]);
}

-(id)initWithSymbol:(NSString*)symbol
{
    self = [super init];
    if (self)
    {
        self.myStockModel = [[StockModel alloc] initWithSymbol:symbol];
        
        NSLog(@"init with symbol: %@", symbol);
        _price_view = [[GraphView alloc] init];
        
        
        _price_view.dataSource = self.myStockModel.priceHistory;
        _volume_view.dataSource = self.myStockModel.volumeHistory;
        [self.volume_view setNeedsDisplay];
        [self.price_view setNeedsDisplay];
    }
    
    return self;

}
//-(void)setPrice_view:(GraphView *)price_view
//{
//
//    _price_view = price_view;
//    _price_view.plotData = price_view.plotData;
//
//}

-(void)setUpWithStockModel:(StockModel *)myStockModel
{

    self.myStockModel = myStockModel;
    
}
    //    _myStockModel=myStockModel;
    //[self.price_view setDataSource:self.myStockModel.priceHistory];
    
    
//    self.price_view.dataSource = self.myStockModel.priceHistory;
    
//    _volume_view.dataSource = self.myStockModel.volumeHistory;
    
//    NSLog(@"Length of plvc.mystockModel.priceHistoty: %d", [self.myStockModel.priceHistory.plotData count]);
    
//    NSLog(@"Length of plvc.price_view.dataSource.priceHistory: %d", [self.price_view.dataSource.plotData count]);
    
    //[self.volume_view setNeedsDisplay];
    //[self.price_view setNeedsDisplay];

//}

-(void)viewWillAppear:(BOOL)animated
{
    //self.myStockModel = [[StockModel alloc] initWithSymbol:self.symbol];
    
    self.price_view.dataSource = self.myStockModel.priceHistory;
    [self.price_view setNeedsDisplay];
    
    
    self.volume_view.dataSource = self.myStockModel.volumeHistory;
   [self.volume_view setNeedsDisplay];
    
    
    //self.myStockModel = [[StockModel alloc] initWithSymbol:stockModel.symbol];
    
    //NSLog(@"init with symbol: %@", self.myStockModel.symbol);
    //self.price_view.dataSource = self.myStockModel.priceHistory;
    //self.volume_view.dataSource = self.myStockModel.volumeHistory;
    //[self.volume_view setNeedsDisplay];
    //[self.price_view setNeedsDisplay];
    
}
@end
