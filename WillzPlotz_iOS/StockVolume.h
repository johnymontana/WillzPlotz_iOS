//
//  StockVolume.h
//  WillzPlotz_iOS
//
//  Created by lyonwj on 2/27/13.
//  Copyright (c) 2013 William Lyon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GraphView.h"

@interface StockVolume : NSObject <GraphViewDataSource>

@property (strong, nonatomic) NSArray* plotData;
@property double maxValue;
@property int graphType;


-(id)initWithVolumeData:(NSArray*) priceData;


@end
