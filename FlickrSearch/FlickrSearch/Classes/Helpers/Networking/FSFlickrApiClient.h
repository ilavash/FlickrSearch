//
//  FSFlickrApiClient.h
//  FlickrSearch
//
//  Created by Illia on 10/15/16.
//  Copyright © 2016 illia. All rights reserved.
//

#import <Overcoat/Overcoat.h>


@class FSPhotosResponseModel;

@interface FSFlickrApiClient : OVCHTTPRequestOperationManager

+ (instancetype)client;

- (void)getPhotosWithSearchQuery:(NSString *)query
                success:(void (^)(FSPhotosResponseModel *responseObject))success
                failure:(void (^)(NSError *error))failure;

- (void)getPhotosWithSearchQuery:(NSString *)query
                         page:(NSInteger)page
                         success:(void (^)(FSPhotosResponseModel *responseObject))success
                         failure:(void (^)(NSError *error))failure;


@end
