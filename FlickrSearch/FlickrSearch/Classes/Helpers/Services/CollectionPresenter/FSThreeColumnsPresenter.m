//
//  FSThreeColumnsPresenter.m
//  FlickrSearch
//
//  Created by Illia on 10/15/16.
//  Copyright © 2016 illia. All rights reserved.
//

#import "FSThreeColumnsPresenter.h"
#import "FSOnlyImageCollectionCell.h"
#import "FSPhotoModel.h"

static NSString *kImageCellReuseId = @"photoCell";

@implementation FSThreeColumnsPresenter

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItem:(FSPhotoModel *)photoModel atIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = collectionView.frame.size.width / 3.0f -  kCellSpacing;
    CGFloat height = width;
    return CGSizeMake(width, height);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return kCellSpacing;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return kCellSpacing;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItem:(FSPhotoModel *)photoModel atIndexPath:(NSIndexPath *)indexPath {
    FSOnlyImageCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kImageCellReuseId forIndexPath:indexPath];
    [cell configWithPhotoModel:photoModel];
    return cell;
}

@end
