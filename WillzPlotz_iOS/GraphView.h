//
//  GraphView.h
//  MyGraph
//
//  Created by lyonwj on 2/20/13.
//  Copyright (c) 2013 William Lyon. All rights reserved.
//

// TODO: figure out scaling: find min/max and act accordingly?

#import <UIKit/UIKit.h>
//#import "ViewController.h"
//#import "QuotezDownload.h"

//#define kGraphHeight 300
//#define kDefaultGraphWidth 900
//#define kOffsetX 10
//#define kStepX 27
//#define kGraphBottom 300
//#define kGraphTop 0
//#define kStepY 50
//#define kOffsetY 10
//#define kBarTop 10
//#define kBarWidth 40
//#define kCircleRadius 3

#define LINE_GRAPH_TYPE 1
#define BAR_GRAPH_TYPE 2

@protocol GraphViewDataSource

@property (strong, nonatomic) NSArray* plotData;
@property double maxValue;
@property int graphType;

@end

@interface GraphView : UIView
{
   // CGContextRef context;
}

@property (strong, nonatomic) NSArray* plotData;
@property (strong, nonatomic) NSString* symbol;
@property (strong, nonatomic) id<GraphViewDataSource> dataSource;        // get plotData,

@property int graphHeight;
@property int defaultGraphWidth;
@property int offsetX;
@property int stepX;
@property int graphBottom;
@property int graphTop;
@property int stepY;
@property int offsetY;
@property int barTop;
@property int barWidth;
@property int circleRadius;


// dataSource delegate should implement: plotData...


-(void)drawLineGraphWithContext:(CGContextRef)ctx;
-(void)setUpWithData:(NSArray*) setUpData;
-(void)getOwnData;

@end
