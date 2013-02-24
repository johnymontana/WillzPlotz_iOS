//
//  WillzIndexModel.h
//  WillzPlotz_iOS
//
//  Created by lyonwj on 2/24/13.
//  Copyright (c) 2013 William Lyon. All rights reserved.
//

// in init create an array of StockModel objects, populated with data(symbol) do the downloading in StockModel

// IndexPlotViewControll will have a WillzIndexModel property
// WIM will hold all StockModel objects and return a pointer to the selected one in IndexPlotViewController

#import <Foundation/Foundation.h>

@interface WillzIndexModel : NSObject

@end
