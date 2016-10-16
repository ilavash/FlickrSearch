//
//  FSPhotoDetailViewController.h
//  FlickrSearch
//
//  Created by Illia on 10/16/16.
//  Copyright © 2016 illia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSPhotoModel.h"

@interface FSPhotoDetailViewController : UIViewController

@property (strong, nonatomic) FSPhotoModel *photo;
@property (assign, nonatomic) NSUInteger index;

@property (strong, nonatomic) dispatch_block_t didShowBlock;


@end
