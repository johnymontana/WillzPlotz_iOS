//
//  StockPrice.m
//  WillzPlotz_iOS
//
//  Created by lyonwj on 2/27/13.
//  Copyright (c) 2013 William Lyon. All rights reserved.
//

#import "StockPrice.h"

#define LINE_GRAPH_TYPE 1
#define BAR_GRAPH_TYPE 2

@implementation StockPrice

-(id)initWithPriceData:(NSArray*) priceData
{
    self = [super init];
    
    if (self)
    {
        self.plotData = priceData;
        self.maxValue = [self findMaxValue:priceData];
        self.graphType = LINE_GRAPH_TYPE;
    }
    
    return self;
}

-(double)findMaxValue:(NSArray*) array_of_doubles
{
    double tempMax = 0.;
    
    for (NSNumber* myNum in array_of_doubles)
    {
        if ([myNum doubleValue] > tempMax)
        {
            tempMax = [myNum doubleValue];
        }
        
        
    }
    
    return tempMax;
}

@end
