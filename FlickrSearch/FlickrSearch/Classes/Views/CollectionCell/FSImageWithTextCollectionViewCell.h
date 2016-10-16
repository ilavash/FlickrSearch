//
//  FSImageWithTextCollectionViewCell.h
//  FlickrSearch
//
//  Created by Illia on 10/16/16.
//  Copyright © 2016 illia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSPhotoModel.h"

@interface FSImageWithTextCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

- (void)configWithPhotoModel:(FSPhotoModel *)photoModel;

@end
