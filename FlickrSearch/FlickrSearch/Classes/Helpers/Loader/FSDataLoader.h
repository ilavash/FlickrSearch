//
//  FSDataLoader.h
//  FlickrSearch
//
//  Created by Illia on 10/15/16.
//  Copyright © 2016 illia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSPhotoModel.h"

typedef NS_ENUM(NSUInteger, FSDataLoaderState) {
    FSDataLoaderStateNoSearchQuery,
    FSDataLoaderStateNoData,
    FSDataLoaderStateLoadInProgress,
    FSDataLoaderStateHasDataAndCanLoadMore,
    FSDataLoaderStateHasDataAndFull,
    FSDataLoaderStateError
};

@interface FSDataLoader : NSObject

@property (assign, nonatomic) FSDataLoaderState state;
@property (strong, nonatomic) NSMutableArray<FSPhotoModel *> *photos;

- (void)searchPhotos:(NSString *)text
            complete:(dispatch_block_t)completion;

- (void)loadMore:(dispatch_block_t)completion;

- (FSPhotoModel *)itemAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)numberOfCells;



@end
