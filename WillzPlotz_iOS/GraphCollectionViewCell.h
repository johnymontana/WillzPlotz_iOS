//
//  GraphCollectionViewCell.h
//  WillzPlotz_iOS
//
//  Created by lyonwj on 2/21/13.
//  Copyright (c) 2013 William Lyon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SmallMultipleStockView.h"

@interface GraphCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet SmallMultipleStockView *smallMultStockView;

@end
