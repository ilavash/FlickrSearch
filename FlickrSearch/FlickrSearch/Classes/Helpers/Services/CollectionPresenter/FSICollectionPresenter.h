//
//  FSICollectionPresenter.h
//  FlickrSearch
//
//  Created by Illia on 10/15/16.
//  Copyright © 2016 illia. All rights reserved.
//

#ifndef FSICollectionPresenter_h
#define FSICollectionPresenter_h

#import <UIKit/UIKit.h>

@class FSPhotoModel;

static CGFloat kCellSpacing = 2.0f;

typedef NS_ENUM(NSUInteger, FSCollectionType) {
    FSCollectionTypeColumn,
    FSCollectionTypeTwoColumn,
    FSCollectionTypeThreeColumn,
};

@protocol FSICollectionPresenter <NSObject, UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItem:(FSPhotoModel *)photoModel atIndexPath:(NSIndexPath *)indexPath;
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItem:(FSPhotoModel *)photoModel atIndexPath:(NSIndexPath *)indexPath;

@end

#endif /* FSICollectionPresenter_h */
