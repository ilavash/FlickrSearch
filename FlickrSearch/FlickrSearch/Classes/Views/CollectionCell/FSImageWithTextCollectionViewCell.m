//
//  FSImageWithTextCollectionViewCell.m
//  FlickrSearch
//
//  Created by Illia on 10/16/16.
//  Copyright © 2016 illia. All rights reserved.
//

#import "FSImageWithTextCollectionViewCell.h"

@implementation FSImageWithTextCollectionViewCell

- (void)configWithPhotoModel:(FSPhotoModel *)photoModel {
    self.photoImageView.image = nil;
    [self.nameLabel setText:photoModel.title];
    NSURL *url = [NSURL URLWithString:[photoModel bigUrl] ? : [photoModel mediumUrl]];
    
    [self.photoImageView sd_setImageWithURL:url];
}

@end
