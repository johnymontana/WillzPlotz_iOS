//
//  QuotezDownload.h
//  WillzPlotz_iOS
//
//  Created by lyonwj on 2/21/13.
//  Copyright (c) 2013 William Lyon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuotezDownload : NSObject

+(NSArray*)getQuotes:(NSString*)ticker;
@end
