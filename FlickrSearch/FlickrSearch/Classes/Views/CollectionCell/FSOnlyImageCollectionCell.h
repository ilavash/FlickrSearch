//
//  FSOnlyImageCollectionCell.h
//  FlickrSearch
//
//  Created by Illia on 10/15/16.
//  Copyright © 2016 illia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSPhotoModel.h"

@interface FSOnlyImageCollectionCell : UICollectionViewCell

- (void)configWithPhotoModel:(FSPhotoModel *)photoModel;

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

@end
