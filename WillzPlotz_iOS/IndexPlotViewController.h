//
//  IndexPlotViewController.h
//  WillzPlotz_iOS
//
//  Created by lyonwj on 2/21/13.
//  Copyright (c) 2013 William Lyon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WillzIndexModel.h"

@interface IndexPlotViewController : UICollectionViewController

@property (strong, nonatomic) IBOutlet UICollectionView *graphCollectionView;
@property (strong, nonatomic) WillzIndexModel* willzIndex;

-(void)updateCell:(UICollectionViewCell *)cell usingSymbol:(NSString*) symbol;

-(IBAction)selectGraph:(UITapGestureRecognizer*)gesture;

@end
