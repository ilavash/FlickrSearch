//
//  FSDataLoader.m
//  FlickrSearch
//
//  Created by Illia on 10/15/16.
//  Copyright © 2016 illia. All rights reserved.
//

#import "FSDataLoader.h"
#import "FSFlickrApiClient.h"
#import "FSPhotosResponseModel.h"
#import "FSPhotosListModel.h"



@interface FSDataLoader ()

@property (strong, nonatomic) FSFlickrApiClient *client;

@property (copy, nonatomic) NSString *text;
@property (assign, nonatomic) NSInteger page;

@end

@implementation FSDataLoader

- (instancetype)init {
    if (self = [super init]) {
        self.client = [FSFlickrApiClient client];
        self.state = FSDataLoaderStateNoSearchQuery;
    }
    return self;
}

- (NSMutableArray<FSPhotoModel *> *)photos {
    if (!_photos) {
        _photos = [NSMutableArray new];
    }
    return _photos;
}

- (FSPhotoModel *)itemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >= self.photos.count) {
        return nil;
    }
    return [self.photos objectAtIndex:indexPath.row];
}

- (NSInteger)numberOfCells; {
    return [self.photos count];
}


- (void)loadMore:(dispatch_block_t)completion {
    if (self.state == FSDataLoaderStateHasDataAndCanLoadMore) {
        self.page = self.page + 1;
        [self search:completion lazy:YES];
    }
}

- (void)searchPhotos:(NSString *)text
            complete:(dispatch_block_t)completion {
    self.text = text;
    self.page = 0;
    self.photos = [NSMutableArray new];

    if (text == nil || [text isEqualToString:@""]) {
        self.state = FSDataLoaderStateNoSearchQuery;
        if (completion) {
            completion();
        }
    } else {
        self.state = FSDataLoaderStateLoadInProgress;
        if (completion) {
            completion();
        }
        [self search:completion lazy:NO];
    }
}

- (void)search:(dispatch_block_t)completion lazy:(BOOL)lazy  {
    [self.client getPhotosWithSearchQuery:self.text page:self.page success:^(FSPhotosResponseModel *responseObject) {
        if ([[responseObject stat] isEqualToString:@"ok"]) {
            NSArray *newPhotos = [[responseObject photosListModel] photos];
            if (lazy) {
                [self.photos addObjectsFromArray:newPhotos];
            } else {
                self.photos = [NSMutableArray arrayWithArray:newPhotos];
            }
            
            if (newPhotos.count == 0) {
                self.state = FSDataLoaderStateNoData;
            } else if(newPhotos.count < kPerPageLoadLimit) {
                self.state = FSDataLoaderStateHasDataAndFull;
            } else {
                self.state = FSDataLoaderStateHasDataAndCanLoadMore;
            }
            
            if (completion) {
                completion();
            }
        } else  {
            self.state = FSDataLoaderStateError;
            if (completion) {
                completion();
            }
        }
    } failure:^(NSError *error) {
        self.state = FSDataLoaderStateError;
        if (completion) {
            completion();
        }
    }];
}

@end
