//
//  FSFlickrApiClient.m
//  FlickrSearch
//
//  Created by Illia on 10/15/16.
//  Copyright © 2016 illia. All rights reserved.
//

#import "FSFlickrApiClient.h"
#import "FSPhotosResponseModel.h"
#import <Mantle/MTLJSONAdapter.h>

@interface FSFlickrApiClient ()

@property (strong, nonatomic) AFHTTPRequestOperation *operation;

@end

@implementation FSFlickrApiClient

- (instancetype)init {
    return [self initWithBaseURL:[NSURL URLWithString:kBaseApiPath]];
}

+ (instancetype)client {
    return [[[self class] alloc] init];
}

+ (NSDictionary *)modelClassesByResourcePath {
    return @{};
}

- (void)getPhotosWithSearchQuery:(NSString *)query
                         success:(void (^)(FSPhotosResponseModel *responseObject))success
                         failure:(void (^)(NSError *error))failure {
    [self getPhotosWithSearchQuery:query page:0 success:success failure:failure];
}

- (void)getPhotosWithSearchQuery:(NSString *)query
                            page:(NSInteger)page
                         success:(void (^)(FSPhotosResponseModel *responseObject))success
                         failure:(void (^)(NSError *error))failure {
    if (self.operation) {
        [self.operation cancel];
    }
    
    NSString *path = [self constructQueryForText:query page:page];
    self.operation = [self GET:path parameters:nil completion:^(OVCResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            if (failure) {
                failure(error);
            }
        } else  {
            NSError *err = nil;
            FSPhotosResponseModel *obj = [MTLJSONAdapter modelOfClass:[FSPhotosResponseModel class] fromJSONDictionary:[response result] error:&err];
            if (err) {
                if (failure) {
                    failure(error);
                }
            } else {
                if (success) {
                    success(obj);
                }
            }
        }
    }];
}

- (NSString *)constructQueryForText:(NSString *)text page:(NSInteger)page {
        
    NSString *str = [NSString stringWithFormat:@"rest/?method=flickr.photos.search&api_key=%@&text=%@&format=json&nojsoncallback=1&page=%@&extras=url_q,url_n,url_c,url_l&per_page=%@",
                     kFlickrAppApiKey, text, @(page).stringValue, @(kPerPageLoadLimit).stringValue];
    
    str = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    return str;
}

@end
