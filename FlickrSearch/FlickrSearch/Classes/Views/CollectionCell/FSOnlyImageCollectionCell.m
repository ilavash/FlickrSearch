//
//  FSOnlyImageCollectionCell.m
//  FlickrSearch
//
//  Created by Illia on 10/15/16.
//  Copyright © 2016 illia. All rights reserved.
//

#import "FSOnlyImageCollectionCell.h"

@implementation FSOnlyImageCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.photoImageView setBackgroundColor:[UIColor fsNavigationBarColor]];
}

- (void)configWithPhotoModel:(FSPhotoModel *)photoModel {
    self.photoImageView.image = nil;
    NSURL *url = [NSURL URLWithString:[photoModel mediumUrl] ? : [photoModel smallUrl]];
    
    [self.photoImageView sd_setImageWithURL:url];
}

@end
