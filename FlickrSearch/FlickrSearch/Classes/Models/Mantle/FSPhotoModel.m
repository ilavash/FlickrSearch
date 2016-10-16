//
//  FSPhotoModel.m
//  FlickrSearch
//
//  Created by Illia on 10/15/16.
//  Copyright © 2016 illia. All rights reserved.
//

#import "FSPhotoModel.h"

@implementation FSPhotoModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    NSDictionary *dict = @{
                           @"identifier" : @"id",
                           @"owner" : @"owner",
                           @"secret" : @"secret",
                           @"server" : @"server",
                           @"farm" : @"farm",
                           @"title" : @"title",
                           @"smallUrl" : @"url_q",
                           @"mediumUrl" : @"url_n",
                           @"bigUrl" : @"url_c",
                           @"largeUrl" : @"url_l",
                           @"height_c" : @"height_c",
                           @"width_c" : @"width_c",
                           };
    return dict;
}

+ (NSValueTransformer *)width_cJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *value, BOOL *success, NSError *__autoreleasing *error) {
        return [NSNumber numberWithInteger:value.integerValue];
    } reverseBlock:^id(NSNumber *value, BOOL *success, NSError *__autoreleasing *error) {
        return [value stringValue];
    }];
}
+ (NSValueTransformer *)height_cJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *value, BOOL *success, NSError *__autoreleasing *error) {
        return [NSNumber numberWithInteger:value.integerValue];
    } reverseBlock:^id(NSNumber *value, BOOL *success, NSError *__autoreleasing *error) {
        return [value stringValue];
    }];
}

@end
