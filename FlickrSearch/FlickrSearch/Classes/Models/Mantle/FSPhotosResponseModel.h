//
//  FSPhotosResponseModel.h
//  FlickrSearch
//
//  Created by Illia on 10/15/16.
//  Copyright © 2016 illia. All rights reserved.
//

#import <Mantle/Mantle.h>

@class FSPhotosListModel;

@interface FSPhotosResponseModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong) NSString *stat;
@property (nonatomic, strong) FSPhotosListModel *photosListModel;


@end
