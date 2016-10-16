//
//  FSGalleryViewController.h
//  FlickrSearch
//
//  Created by Illia on 10/16/16.
//  Copyright © 2016 illia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSPhotoModel.h"

@interface FSGalleryViewController : UIViewController

@property (strong, nonatomic) NSArray<FSPhotoModel *> *items;
@property (assign, nonatomic) NSUInteger selectedIndex;

@end
