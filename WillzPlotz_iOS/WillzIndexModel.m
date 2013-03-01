//
//  WillzIndexModel.m
//  WillzPlotz_iOS
//
//  Created by lyonwj on 2/24/13.
//  Copyright (c) 2013 William Lyon. All rights reserved.
//

#import "WillzIndexModel.h"
#import "StockModel.h"

@implementation WillzIndexModel


-(id)init
{
    self = [super init];
    
    if (self)
    {
        _stockArray = [[NSMutableArray alloc] init];
        for (NSString* ticker in @[@"TSLA", @"C", @"AAPL", @"HYG", @"GS", @"SPY", @"XLF", @"OIL", @"GOOG", @"ORCL", @"GE"])
        {
            //[_stockArray addObject:[[StockModel alloc] initWithSymbol:ticker]];
            
            
            [self.stockArray addObject:[[StockModel alloc] initWithSymbol:ticker]];
            
            //self.stockArray = @[[[StockModel alloc] initWithSymbol:@"GOOG"], [[StockModel alloc] initWithSymbol:@"AAPL"]];
            
        }
    }
    
    NSLog(@"size of self.stockArray: %d", [self.stockArray count]);
    return self;
}
@end
