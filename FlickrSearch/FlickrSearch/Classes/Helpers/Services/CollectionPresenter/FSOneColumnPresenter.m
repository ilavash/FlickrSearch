//
//  FSOneColumnPresenter.m
//  FlickrSearch
//
//  Created by Illia on 10/15/16.
//  Copyright © 2016 illia. All rights reserved.
//

#import "FSOneColumnPresenter.h"
#import "FSImageWithTextCollectionViewCell.h"
#import "FSPhotoModel.h"

static NSString *kImageCellReuseId = @"photoTextCell";

@implementation FSOneColumnPresenter

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItem:(FSPhotoModel *)photoModel atIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat width = collectionView.frame.size.width -  kCellSpacing;
    
    CGFloat itemWidth = photoModel.width_c.floatValue;
    CGFloat itemHeight = photoModel.height_c.floatValue;
    
    CGFloat koef = itemHeight / itemWidth;
    CGFloat height = width;

    if (koef > 0.4) {
        height = width * koef;
    }
    
    return CGSizeMake(width, height);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return kCellSpacing;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return kCellSpacing;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItem:(FSPhotoModel *)photoModel atIndexPath:(NSIndexPath *)indexPath {
    FSImageWithTextCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kImageCellReuseId forIndexPath:indexPath];
    [cell configWithPhotoModel:photoModel];
    return cell;
}

@end
