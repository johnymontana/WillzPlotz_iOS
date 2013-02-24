//
//  StockModel.h
//  WillzPlotz_iOS
//
//  Created by lyonwj on 2/24/13.
//  Copyright (c) 2013 William Lyon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StockModel : NSObject

@property (strong, nonatomic) NSString* symbol;
@property (strong, nonatomic) NSNumber* ytdReturn;
@property (strong, nonatomic) NSArray* tradingDatesArray;
@property (strong, nonatomic) NSArray* quoteArray;
@property (strong, nonatomic) NSArray* volumeArray;

@end
