//
//  StockModel.m
//  WillzPlotz_iOS
//
//  Created by lyonwj on 2/24/13.
//  Copyright (c) 2013 William Lyon. All rights reserved.
//

// Do the downloading of stock data here

#import "StockModel.h"

@implementation StockModel

-(id)init
{
    self = [super init];
    
    if (self)
    {
        // do init
    }
    
    return self;
}

-(id)initWithSymbol:(NSString*) symbol
{
    self = [self init];
    
    if (self)
    {
        self.symbol = symbol;
        self.priceHistory = [[StockPrice alloc] initWithPriceData:[StockModel getQuotes:symbol]];
        self.volumeHistory = [[StockVolume alloc] initWithVolumeData:[StockModel getVolume:symbol]];
        self.ytdReturn = [self calcYtdReturn];
    }
    
    return self;
}

//-(void)setUpWithSymbol:(NSString*)symbol
//{
//
//}

-(NSNumber*)calcYtdReturn
{
    double begin = [[self.priceHistory.plotData objectAtIndex:0] doubleValue];
    double end = [[self.priceHistory.plotData lastObject] doubleValue];
    
    return [NSNumber numberWithDouble:((end-begin)/begin)*100];
}

#define HIST_QUOTES_PREFIX @"http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.historicaldata%20where%20symbol%20%3D%20%22"
#define HIST_QUOTES_SUFFIX @"%22%20and%20startDate%20%3D%20%222013-01-01%22%20and%20endDate%20%3D%20%222013-02-27%22&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback="
// TODO: fix hardcoded dates

+(NSArray*)getQuotes:(NSString *)ticker
{
    
    //TODO: return more info (volume, ticker, dates, last quote, etc.) for bottom view
    
    //select Adj_Close from yahoo.finance.historicaldata where symbol = "YHOO" and startDate = "2009-09-11" and endDate = "2010-03-10"
    
    
    NSMutableArray* histQuotes = [[NSMutableArray alloc] init];
    NSMutableString* query = [[NSMutableString alloc] init];
    NSMutableArray* cumReturns = [[NSMutableArray alloc] init];
    
    
    [query appendString:HIST_QUOTES_PREFIX];
    //[query appendFormat:@"%%22%@%%22", ticker];
    [query appendFormat:@"%@", ticker];
    [query appendString:HIST_QUOTES_SUFFIX];
    
    NSLog(@"Query: %@", query);
    
    NSData* jsonData = [[NSString stringWithContentsOfURL:[NSURL URLWithString:query] encoding:NSUTF8StringEncoding error:nil] dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *results = jsonData ? [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error ] : nil;
    
    if (error)
    {
        NSLog(@"[%@ %@] JSON error: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), error.localizedDescription);
        NSLog(@"Yahoo! Finance quotes not available. Try again later. Terminating...");
        exit(1);
    }
    NSLog(@"[%@ %@] received %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), results);
    NSArray* quoteEntries = [results valueForKeyPath:@"query.results.quote"]; // see what we get
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    if ([quoteEntries isKindOfClass:[NSArray class]])
    {
        for (NSDictionary *quoteEntry in quoteEntries)
        {
            
            [histQuotes addObject:[formatter numberFromString:quoteEntry[@"Adj_Close"]]];
        }
        
        NSLog(@"%@", histQuotes);
        return histQuotes;
        
        
        
        //NSNumber* firstDay = histQuotes[0];
        //double j = [firstDay doubleValue];
        
        //for (NSNumber*  quote in histQuotes)
        //{
         //   //double ret = 0.0;
         //   double i = [quote doubleValue];
            
            
           // [cumReturns addObject:[NSNumber numberWithDouble:(i/j)-0.5]];
            
            
        //}
        
        //if ([cumReturns count] > 1)
        //{
        //    return cumReturns;
        //}
        
    }
    
    NSLog(@"Quotes not available. Terminating...");
    exit(1);
}

+(NSArray*)getVolume:(NSString *)ticker
{
    
    //TODO: return more info (volume, ticker, dates, last quote, etc.) for bottom view
    
    //select Adj_Close from yahoo.finance.historicaldata where symbol = "YHOO" and startDate = "2009-09-11" and endDate = "2010-03-10"
    
    
    NSMutableArray* histQuotes = [[NSMutableArray alloc] init];
    NSMutableString* query = [[NSMutableString alloc] init];
    NSMutableArray* cumReturns = [[NSMutableArray alloc] init];
    
    
    [query appendString:HIST_QUOTES_PREFIX];
    //[query appendFormat:@"%%22%@%%22", ticker];
    [query appendFormat:@"%@", ticker];
    [query appendString:HIST_QUOTES_SUFFIX];
    
    NSLog(@"Query: %@", query);
    
    NSData* jsonData = [[NSString stringWithContentsOfURL:[NSURL URLWithString:query] encoding:NSUTF8StringEncoding error:nil] dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *results = jsonData ? [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error ] : nil;
    
    if (error)
    {
        NSLog(@"[%@ %@] JSON error: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), error.localizedDescription);
        NSLog(@"Yahoo! Finance quotes not available. Try again later. Terminating...");
        exit(1);
    }
    NSLog(@"[%@ %@] received %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), results);
    NSArray* quoteEntries = [results valueForKeyPath:@"query.results.quote"]; // see what we get
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    if ([quoteEntries isKindOfClass:[NSArray class]])
    {
        for (NSDictionary *quoteEntry in quoteEntries)
        {
            
            [histQuotes addObject:[formatter numberFromString:quoteEntry[@"Volume"]]];
        }
        
        NSLog(@"%@", histQuotes);
        return histQuotes;
        
        
        
        //NSNumber* firstDay = histQuotes[0];
        //double j = [firstDay doubleValue];
        
        //for (NSNumber*  quote in histQuotes)
        //{
            //double ret = 0.0;
            //double i = [quote doubleValue];
            
            
            //[cumReturns addObject:[NSNumber numberWithDouble:(i/j)-0.5]];
            
            
        //}
        
        //if ([cumReturns count] > 1)
        //{
        //    return cumReturns;
        //}
        
    }
    
    NSLog(@"Quotes not available. Terminating...");
    exit(1);
}

@end
