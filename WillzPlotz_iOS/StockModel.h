//
//  StockModel.h
//  WillzPlotz_iOS
//
//  Created by lyonwj on 2/24/13.
//  Copyright (c) 2013 William Lyon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StockPrice.h"
#import "StockVolume.h"

@interface StockModel : NSObject

@property (strong, nonatomic) NSString* symbol;
@property (strong, nonatomic) NSNumber* ytdReturn;
@property (strong, nonatomic) NSArray* tradingDatesArray;
@property (strong, nonatomic) StockPrice* priceHistory;
@property (strong, nonatomic) StockVolume* volumeHistory;
@property (strong, nonatomic) NSArray* quoteArray;  // should be a stockPrice obj - set this as dataSource for PriceGraphView
@property (strong, nonatomic) NSArray* volumeArray; // should be a stockVolume obj - set this as dataSource for VolumeGraphView


-(id)initWithSymbol:(NSString*)symbol;
@end
