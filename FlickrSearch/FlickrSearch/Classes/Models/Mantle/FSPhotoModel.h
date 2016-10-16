//
//  FSPhotoModel.h
//  FlickrSearch
//
//  Created by Illia on 10/15/16.
//  Copyright © 2016 illia. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface FSPhotoModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *owner;
@property (nonatomic, strong) NSString *secret;
@property (nonatomic, strong) NSString *server;
@property (nonatomic, strong) NSNumber *farm;
@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *smallUrl;//3column url_q
@property (nonatomic, strong) NSString *mediumUrl;//2column url_n
@property (nonatomic, strong) NSString *bigUrl;//1column url_c
@property (nonatomic, strong) NSString *largeUrl;//gallery url_l

@property (nonatomic, strong) NSNumber *height_c;
@property (nonatomic, strong) NSNumber *width_c;


//



@end
