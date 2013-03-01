//
//  PlotViewController.h
//  WillzPlotz_iOS
//
//  Created by lyonwj on 2/20/13.
//  Copyright (c) 2013 William Lyon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GraphView.h"
#import "StockModel.h"

// set a delegate for setting the price_view and volume_view dataSources?

@interface PlotViewController : UIViewController

@property (strong, nonatomic) IBOutlet GraphView *price_view;
@property (strong, nonatomic) IBOutlet GraphView *volume_view;

@property (strong, nonatomic) NSString* symbol;

// for testing:
@property (strong, nonatomic) StockModel* myStockModel;


-(id)initWithStockModel:(StockModel*)stockModel;
-(void)setUpWithStockModel:(StockModel*)myStockModel;
-(void)setUpWithSymbol:(NSString*)symbol;

@end
