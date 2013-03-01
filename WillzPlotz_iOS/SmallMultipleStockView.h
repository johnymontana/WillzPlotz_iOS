//
//  SmallMultipleStockView.h
//  WillzPlotz_iOS
//
//  Created by lyonwj on 2/24/13.
//  Copyright (c) 2013 William Lyon. All rights reserved.
//

// Will live in IndexPlotViewController
// properties: stock Object (get ticker, get yearly return)
// if yearly return < 1%, background color = red, rtn>1% color = green, -1<x>1 = black

// gesture handled by PlotViewController!


// use coreGraphics rounded rect to fill a rect with appropriate color

#import <UIKit/UIKit.h>

@interface SmallMultipleStockView : UIView

@end
