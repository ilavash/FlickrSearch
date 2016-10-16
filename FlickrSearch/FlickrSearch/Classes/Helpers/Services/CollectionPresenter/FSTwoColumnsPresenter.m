//
//  FSTwoColumnsPresenter.m
//  FlickrSearch
//
//  Created by Illia on 10/15/16.
//  Copyright © 2016 illia. All rights reserved.
//

#import "FSTwoColumnsPresenter.h"
#import "FSOnlyImageCollectionCell.h"
#import "FSPhotoModel.h"

static NSString *kImageCellReuseId = @"photoCell";

@implementation FSTwoColumnsPresenter

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItem:(FSPhotoModel *)photoModel atIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = collectionView.frame.size.width / 2.0f -  2.0 * kCellSpacing;
    CGFloat height = width;
    return CGSizeMake(width, height);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return kCellSpacing;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return kCellSpacing;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    NSInteger numberOfLines = 2;
    CGFloat itemWidth = collectionView.frame.size.width / 2.0f -  2.0 * kCellSpacing;
    CGFloat inset = MAX(kCellSpacing, floor( (collectionView.bounds.size.width - (numberOfLines * itemWidth) - (numberOfLines-1)*kCellSpacing) / 2 ));
    return UIEdgeInsetsMake(kCellSpacing, inset, kCellSpacing, inset);
}




- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItem:(FSPhotoModel *)photoModel atIndexPath:(NSIndexPath *)indexPath {
    FSOnlyImageCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kImageCellReuseId forIndexPath:indexPath];
    [cell configWithPhotoModel:photoModel];
    return cell;
}

@end
