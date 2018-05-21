//
//  HttpShows.h
//  projetoIOS
//
//  Created by FLAG on 16/04/18.
//  Copyright © 2018 Andre Costa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UNIRest.h>
#import <UIKit/UIKit.h>
#import "ConstrutoresAPI.h"

@interface Http : NSObject
@property NSMutableArray *saveSerie;
+(NSArray *)makeExternalRequest:(NSString *)api;
+(NSArray *)makeExternalRequestSearch:(NSString *)api andParam:(NSString *)parameter;
@end
