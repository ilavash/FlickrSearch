//
//  FSPhotosListModel.m
//  FlickrSearch
//
//  Created by Illia on 10/15/16.
//  Copyright © 2016 illia. All rights reserved.
//

#import "FSPhotosListModel.h"
#import "FSPhotoModel.h"

@implementation FSPhotosListModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    NSDictionary *dict = @{
                           @"page" : @"page",
                           @"pages" : @"pages",
                           @"perpage" : @"perpage",
                           @"total" : @"total",
                           @"photos" : @"photo"
                           };
    return dict;
}

+ (NSValueTransformer *)photosJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[FSPhotoModel class]];
}

@end
