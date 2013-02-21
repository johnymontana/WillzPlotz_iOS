//
//  GraphCollectionViewCell.h
//  WillzPlotz_iOS
//
//  Created by lyonwj on 2/21/13.
//  Copyright (c) 2013 William Lyon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GraphView.h"

@interface GraphCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet GraphView *graph_view;

@end
