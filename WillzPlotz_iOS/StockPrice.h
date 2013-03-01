//
//  StockPrice.h
//  WillzPlotz_iOS
//
//  Created by lyonwj on 2/27/13.
//  Copyright (c) 2013 William Lyon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GraphView.h"



@interface StockPrice : NSObject <GraphViewDataSource>

@property (strong, nonatomic) NSArray* plotData;
@property double maxValue;
@property int graphType;
@property double minValue;


-(id)initWithPriceData:(NSArray*) priceData;

@end
