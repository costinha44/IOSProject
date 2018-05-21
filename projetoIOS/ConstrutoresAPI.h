//
//  ConstrutoresAPI.h
//  projetoIOS
//
//  Created by FLAG on 16/04/18.
//  Copyright © 2018 Andre Costa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConstrutoresAPI : NSObject
@property NSNumber *idSeries;
@property NSString *nomeSerie;
@property NSString *genero;
@property NSString *status;
@property NSString *dataLancamento;
@property NSString *oficialSite;
@property NSNumber *rating;
@property NSString *image;
@property NSString *sinopse;
//Construtor para Series
-(id)initWithId:(NSNumber*)idSerie Nome:(NSString *)nome Genero:(NSString *)genero Status:(NSString *)status DataLancamento:(NSString *)dataLancamento OficialSite:(NSString *)oficialSite Rating:(NSNumber *)rating Image:(NSString *)image Sinopse:(NSString *)sinopse;

@end
