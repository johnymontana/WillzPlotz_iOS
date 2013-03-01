//
//  GraphView.m
//  MyGraph
//
//  Created by lyonwj on 2/20/13.
//  Copyright (c) 2013 William Lyon. All rights reserved.
//

#import "GraphView.h"

@implementation GraphView

//context = UIGraphicsGetCurrentContext();

-(void)setUp
{
    // TODO: set these values from self.frame (or bounds??)
    
    NSLog(@"self.bounds.origin.x: %f", self.bounds.origin.x);
    NSLog(@"self.bounds.origin.y: %f", self.bounds.origin.y);
    NSLog(@"self.bounds.size.height: %f", self.bounds.size.height);
    NSLog(@"self.bounds.size.width: %f", self.bounds.size.width);
    
    _graphHeight = self.bounds.size.height;
    _defaultGraphWidth = self.bounds.size.width;
    _offsetX = 5;
    //_stepX = self.bounds.size.width / [self.dataSource.plotData count];
    _stepX = 10;
    _graphBottom = self.bounds.size.height;
    _graphTop = 0;
    _stepY = 50;
    _offsetY = 10;
    _barTop = 10;
    _barWidth = 10;
    _circleRadius = 3;
    
    
    
    [self setNeedsDisplay];

}

-(void)setDataSource:(id<GraphViewDataSource>)dataSource
{
    _dataSource = dataSource;
    _stepX = self.bounds.size.width / [dataSource.plotData count];
    [self setNeedsDisplay];
    
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self setUp];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
        NSLog(@"initWithFrame");
    }
    
    
    
    return self;
}

//-(void)getOwnData
//{
//    _plotData = @[@1.2, @0.5, @0.5];
//}

-(void)setUpWithData:(NSArray*)setUpData
{
    
    _plotData = setUpData;
    
   // context = UIGraphicsGetCurrentContext();
    NSLog(@"setup");
}

-(void)drawLineGraphWithContext:(CGContextRef) ctx
{
    _stepX = self.bounds.size.width / [self.dataSource.plotData count]; // should not need to this: BAD - why doesn't dataSource setter work???
    
    //CGContextRef ctx = UIGraphicsGetCurrentContext();
    double maxValue = self.dataSource.maxValue;
    double minValue = self.dataSource.minValue;
    double verticalScale = (self.graphHeight-self.offsetY) / (maxValue-minValue);
    CGContextSetLineWidth(ctx, 2.0);
    CGContextSetStrokeColorWithColor(ctx, [[UIColor colorWithRed:1.0 green:0.5 blue:0. alpha:1.0]CGColor]);
    
    int maxGraphHeight = self.graphHeight - self.offsetY;
    CGContextBeginPath(ctx);
    //CGContextMoveToPoint(ctx, self.offsetX, self.graphHeight - maxGraphHeight * ([self.dataSource.plotData[0] doubleValue]/maxValue));
    
    CGContextMoveToPoint(ctx, self.offsetX, ([self.dataSource.plotData[0] doubleValue] - minValue) * verticalScale);
    for (int i = 0; i < [self.dataSource.plotData count]; i++)
    {
        //CGContextAddLineToPoint(ctx, self.offsetX + i * self.stepX, self.graphHeight - maxGraphHeight * ([self.dataSource.plotData[i] doubleValue]/maxValue));
        CGContextAddLineToPoint(ctx, self.offsetX + i * self.stepX, ([self.dataSource.plotData[i] doubleValue] - minValue) * verticalScale+self.offsetY);
    }
    
    CGContextDrawPath(ctx, kCGPathStroke);
    
    //CGContextSetFillColorWithColor(ctx, [[UIColor colorWithRed:1.0 green:0.5 blue:0. alpha:1.0]CGColor]);
    //for (int i = 1; i < [self.dataSource.plotData count] - 1; i++)
    //{
    //    float x = self.offsetX + i * self.stepX;
    //    float y = self.graphHeight - maxGraphHeight * [self.dataSource.plotData[i] doubleValue];
    //    CGRect rect = CGRectMake(x - self.circleRadius, y - self.circleRadius, 2 * self.circleRadius, 2 * self.circleRadius);
    //    CGContextAddEllipseInRect(ctx, rect);
    //}
    //CGContextDrawPath(ctx, kCGPathFillStroke);
}

-(void)drawSymbolWithContext:(CGContextRef) ctx
{
    CGContextSetTextMatrix(ctx, CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0.0, 0.0));
    CGContextSelectFont(ctx, "Helvetica", 28, kCGEncodingMacRoman);
    
    CGContextSetTextDrawingMode(ctx, kCGTextFill);
    
    CGContextSetFillColorWithColor(ctx, [[UIColor colorWithRed:0. green:0. blue:0. alpha:1.0] CGColor]);
    
    CGContextShowTextAtPoint(ctx, 5, 20, [self.symbol cStringUsingEncoding:NSUTF8StringEncoding], [self.symbol length]);

}
-(void)drawNumbersForDataPointsWithContext:(CGContextRef) ctx
{
    CGContextSetTextMatrix(ctx, CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0.0, 0.0));
    CGContextSelectFont(ctx, "Helvetica", 18, kCGEncodingMacRoman);
    
    CGContextSetTextDrawingMode(ctx, kCGTextFill);
    
    CGContextSetFillColorWithColor(ctx, [[UIColor colorWithRed:0. green:0. blue:0. alpha:1.0] CGColor]);
    
    for (int i = 1; i < [self.dataSource.plotData count]; i++)
    {
        NSString *theText = [NSString stringWithFormat:@"%d", i];
        CGSize labelSize = [theText sizeWithFont:[UIFont fontWithName:@"Helvetica" size:18]];
        
        CGContextShowTextAtPoint(ctx, self.offsetX + i * self.stepX - labelSize.width/2, self.graphBottom-5, [theText cStringUsingEncoding:NSUTF8StringEncoding], [theText length]);
        
    }
}

-(void)drawMinMaxNumbersWithContext:(CGContextRef) ctx
{
    CGContextSetTextMatrix(ctx, CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0.0, 0.0));
    CGContextSelectFont(ctx, "Helvetica", 12, kCGEncodingMacRoman);
    
    CGContextSetTextDrawingMode(ctx, kCGTextFill);
    
    CGContextSetFillColorWithColor(ctx, [[UIColor colorWithRed:0. green:0. blue:0. alpha:1.0] CGColor]);
    NSNumberFormatter* f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    
    NSString* maxVal = [f stringForObjectValue:[NSNumber numberWithDouble:self.dataSource.maxValue]];
    NSString* minVal = [f stringForObjectValue:[NSNumber numberWithDouble:self.dataSource.minValue]];
    
    //NSString *maxVal = [NSString stringWithFormat:@"%f", self.dataSource.maxValue];
    //NSString *minVal = [NSString stringWithFormat:@"%f", self.dataSource.minValue];
    
    CGSize labelSize = [maxVal sizeWithFont:[UIFont fontWithName:@"Helvetica" size:18]];
    
    CGContextShowTextAtPoint(ctx, self.offsetX, self.graphTop+15, [maxVal cStringUsingEncoding:NSUTF8StringEncoding], [maxVal length]);
    
    labelSize = [minVal sizeWithFont:[UIFont fontWithName:@"Helvetica" size:18]];
    
    CGContextShowTextAtPoint(ctx, self.offsetX, self.graphBottom, [minVal cStringUsingEncoding:NSUTF8StringEncoding], [minVal length]);
    
}
-(void)drawGridLinesWithContext:(CGContextRef) ctx
{
    CGContextSetLineWidth(ctx, 0.6);
    CGContextSetStrokeColorWithColor(ctx, [[UIColor lightGrayColor] CGColor]);
    CGFloat dash[] = {2.0, 2.0};
    CGContextSetLineDash(ctx, 0.0, dash, 2);
    
    int howMany = (self.defaultGraphWidth - self.offsetX) / self.stepX;
    
    for (int i =0; i < howMany; i++)
    {
        CGContextMoveToPoint(ctx, self.offsetX + i * self.stepX, self.graphTop);
        CGContextAddLineToPoint(ctx, self.offsetX + i * self.stepX, self.graphBottom);
    }
    
    int howManyHorizontal = (self.graphBottom - self.graphTop - self.offsetY) / self.stepY;
    
    for (int i = 0; i <= howManyHorizontal; i++)
    {
        CGContextMoveToPoint(ctx, self.offsetY, self.graphBottom - self.offsetY - i * self.stepY);
        CGContextAddLineToPoint(ctx, self.defaultGraphWidth, self.graphBottom-self.offsetY-i*self.stepY);
    }
    
    CGContextStrokePath(ctx);
    
    CGContextSetLineDash(ctx, 0, NULL, 0);

}

-(void)drawBar:(CGRect)rect context:(CGContextRef)ctx
{
    CGContextBeginPath(ctx);
    
    CGContextSetGrayFillColor(ctx, 0.2, 0.7);
    
    CGContextMoveToPoint(ctx, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect), CGRectGetMinY(rect));
    CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect), CGRectGetMaxY(rect));
    CGContextAddLineToPoint(ctx, CGRectGetMinX(rect), CGRectGetMaxY(rect));
    
    
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
}



-(void)drawBarGraphWithContext:(CGContextRef)ctx
{
     float maxBarHeight = self.graphHeight - self.barTop - self.offsetY;
     for (int i = 0; i < [self.dataSource.plotData count]; i++)
     {
         float barX = self.offsetX + self.stepX + i * self.stepX - self.barWidth / 2;
         float barY = self.barTop + maxBarHeight - maxBarHeight * ([self.dataSource.plotData[i] doubleValue] / self.dataSource.maxValue);
         float barHeight = maxBarHeight * ([self.dataSource.plotData[i] doubleValue] / self.dataSource.maxValue);
         CGRect barRect = CGRectMake(barX, barY, self.barWidth, barHeight);
         [self drawBar:barRect context:ctx];
     }
     
}
- (void)drawRect:(CGRect)rect
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
 
    
   
    
    [self drawGridLinesWithContext:context];
    
    if (self.dataSource.graphType == LINE_GRAPH_TYPE)
    {
        [self drawLineGraphWithContext:context];
        [self drawMinMaxNumbersWithContext:context];
    }
    
    else if (self.dataSource.graphType == BAR_GRAPH_TYPE)
    {
        [self drawBarGraphWithContext:context];
        [self drawMinMaxNumbersWithContext:context];
    }
    //[self drawNumbersForDataPointsWithContext:context];
    //[self drawSymbolWithContext:context];
    
}

@end
