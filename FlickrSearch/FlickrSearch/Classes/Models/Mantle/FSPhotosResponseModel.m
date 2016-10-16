//
//  FSPhotosResponseModel.m
//  FlickrSearch
//
//  Created by Illia on 10/15/16.
//  Copyright © 2016 illia. All rights reserved.
//

#import "FSPhotosResponseModel.h"
#import "FSPhotosListModel.h"

@implementation FSPhotosResponseModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    NSDictionary *dict = @{
                           @"photosListModel" : @"photos",
                           @"stat" : @"stat"
                           };
    return dict;
}

+ (NSValueTransformer *)photosListModelJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[FSPhotosListModel class]];
}

@end
