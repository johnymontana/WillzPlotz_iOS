//
//  PlotViewController.h
//  WillzPlotz_iOS
//
//  Created by lyonwj on 2/20/13.
//  Copyright (c) 2013 William Lyon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GraphView.h"

@interface PlotViewController : UIViewController

@property (strong, nonatomic) IBOutlet GraphView *graph_view;

@property (strong, nonatomic) IBOutlet UIScrollView *scroller;
@property (strong, nonatomic) NSArray* plotData;
@property (strong, nonatomic) NSString* symbol;


-(void)setUpWithData:(NSArray*)plotData;



@end
