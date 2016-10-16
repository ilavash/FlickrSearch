//
//  FSPhotosListModel.h
//  FlickrSearch
//
//  Created by Illia on 10/15/16.
//  Copyright © 2016 illia. All rights reserved.
//

#import <Mantle/Mantle.h>

@class FSPhotoModel;

@interface FSPhotosListModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong) NSNumber *page;
@property (nonatomic, strong) NSNumber *pages;
@property (nonatomic, strong) NSNumber *perpage;
@property (nonatomic, strong) NSString *total; //??

@property (nonatomic, strong) NSArray<FSPhotoModel *> *photos;



@end
