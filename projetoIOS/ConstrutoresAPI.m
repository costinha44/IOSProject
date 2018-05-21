//
//  ConstrutoresAPI.m
//  projetoIOS
//
//  Created by FLAG on 16/04/18.
//  Copyright © 2018 Andre Costa. All rights reserved.
//

#import "ConstrutoresAPI.h"

@implementation ConstrutoresAPI
-(id)initWithId:(NSNumber *)idSerie Nome:(NSString *)nome Genero:(NSString *)genero Status:(NSString *)status DataLancamento:(NSString *)dataLancamento OficialSite:(NSString *)oficialSite Rating:(NSNumber *)rating Image:(NSString *)image Sinopse:(NSString *)sinopse{
    self =[super init];
    [self setIdSeries:idSerie];
    [self setNomeSerie:nome];
    [self setGenero:genero];
    [self setStatus:status];
    [self setDataLancamento:dataLancamento];
    [self setOficialSite:oficialSite];
    [self setRating:rating];
    [self setImage:image];
    [self setSinopse:sinopse];
    return self;
}

@end
