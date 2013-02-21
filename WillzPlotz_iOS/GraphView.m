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


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      //  context = UIGraphicsGetCurrentContext();
        NSLog(@"init");
    }
    
    
    
    return self;
}

-(void)getOwnData
{
    _plotData = [QuotezDownload getQuotes:@"APPL"];
}

-(void)setUpWithData:(NSArray*)setUpData
{
    
    _plotData = setUpData;
    
   // context = UIGraphicsGetCurrentContext();
    NSLog(@"setup");
}

-(void)drawLineGraphWithContext:(CGContextRef) ctx
{
    //CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(ctx, 2.0);
    CGContextSetStrokeColorWithColor(ctx, [[UIColor colorWithRed:1.0 green:0.5 blue:0. alpha:1.0]CGColor]);
    
    int maxGraphHeight = kGraphHeight - kOffsetY;
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, kOffsetX, kGraphHeight - maxGraphHeight * [self.plotData[0] doubleValue]);
    for (int i = 1; i < [self.plotData count]; i++)
    {
        CGContextAddLineToPoint(ctx, kOffsetX + i * kStepX, kGraphHeight - maxGraphHeight * [self.plotData[i] doubleValue]);
    }
    
    CGContextDrawPath(ctx, kCGPathStroke);
    
    CGContextSetFillColorWithColor(ctx, [[UIColor colorWithRed:1.0 green:0.5 blue:0. alpha:1.0]CGColor]);
    for (int i = 1; i < [self.plotData count] - 1; i++)
    {
        float x = kOffsetX + i * kStepX;
        float y = kGraphHeight - maxGraphHeight * [self.plotData[i] doubleValue];
        CGRect rect = CGRectMake(x - kCircleRadius, y - kCircleRadius, 2 * kCircleRadius, 2 * kCircleRadius);
        CGContextAddEllipseInRect(ctx, rect);
    }
    CGContextDrawPath(ctx, kCGPathFillStroke);
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
    
    for (int i = 1; i < [self.plotData count]; i++)
    {
        NSString *theText = [NSString stringWithFormat:@"%d", i];
        CGSize labelSize = [theText sizeWithFont:[UIFont fontWithName:@"Helvetica" size:18]];
        
        CGContextShowTextAtPoint(ctx, kOffsetX + i * kStepX - labelSize.width/2, kGraphBottom-5, [theText cStringUsingEncoding:NSUTF8StringEncoding], [theText length]);
        
    }
}

-(void)drawGridLinesWithContext:(CGContextRef) ctx
{
    CGContextSetLineWidth(ctx, 0.6);
    CGContextSetStrokeColorWithColor(ctx, [[UIColor lightGrayColor] CGColor]);
    CGFloat dash[] = {2.0, 2.0};
    CGContextSetLineDash(ctx, 0.0, dash, 2);
    
    int howMany = (kDefaultGraphWidth - kOffsetX) / kStepX;
    
    for (int i =0; i < howMany; i++)
    {
        CGContextMoveToPoint(ctx, kOffsetX + i * kStepX, kGraphTop);
        CGContextAddLineToPoint(ctx, kOffsetX + i * kStepX, kGraphBottom);
    }
    
    int howManyHorizontal = (kGraphBottom - kGraphTop - kOffsetY) / kStepY;
    
    for (int i = 0; i <= howManyHorizontal; i++)
    {
        CGContextMoveToPoint(ctx, kOffsetY, kGraphBottom - kOffsetY - i * kStepY);
        CGContextAddLineToPoint(ctx, kDefaultGraphWidth, kGraphBottom-kOffsetY-i*kStepY);
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

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

//float data[] = {0.7, 0.01, 0.9, 1.0, 0.2, 0.2, 0.99, 0.1, 0.2, 0.3, 0.4, 0.1, 0.2, 0.3, 0.4, 0.5, 0.2};

- (void)drawRect:(CGRect)rect
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
 
    
   
    /* float maxBarHeight = kGraphHeight - kBarTop - kOffsetY;
    for (int i = 0; i < sizeof(data); i++)
    {
        float barX = kOffsetX + kStepX + i * kStepX - kBarWidth / 2;
        float barY = kBarTop + maxBarHeight - maxBarHeight * data[i];
        float barHeight = maxBarHeight * data[i];
        CGRect barRect = CGRectMake(barX, barY, kBarWidth, barHeight);
        [self drawBar:barRect context:context];
    }
    */
    [self drawGridLinesWithContext:context];
    [self drawLineGraphWithContext:context];
    [self drawNumbersForDataPointsWithContext:context];
    [self drawSymbolWithContext:context];
}

@end
