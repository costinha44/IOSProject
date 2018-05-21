//
//  HttpShows.m
//  projetoIOS
//
//  Created by FLAG on 16/04/18.
//  Copyright © 2018 Andre Costa. All rights reserved.
//

#import "Http.h"


@implementation Http

+(NSArray *)makeExternalRequest:(NSString *)api{
    NSDictionary *headers = nil;
    NSDictionary *parameters =nil;
    UNIHTTPJsonResponse *response =[[UNIRest get:^(UNISimpleRequest *request){
        [request setUrl:api];
        [request setHeaders:headers];
        [request setParameters:parameters];
    }]asJson];
    return [[response body]array];
}

+(NSArray *)makeExternalRequestSearch:(NSString *)api andParam:(NSString *)parameter{
    NSDictionary *headers = nil;
    NSDictionary* parameters = @{@"q":parameter};
    UNIHTTPJsonResponse *response =[[UNIRest get:^(UNISimpleRequest *request){
        [request setUrl:api];
        [request setHeaders:headers];
        [request setParameters:parameters];
    }]asJson];
    return [[response body]array];
}

@end
