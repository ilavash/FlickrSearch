//
//  FSPhotoDetailViewController.m
//  FlickrSearch
//
//  Created by Illia on 10/16/16.
//  Copyright © 2016 illia. All rights reserved.
//

#import "FSPhotoDetailViewController.h"

@interface FSPhotoDetailViewController ()
    <
    UIScrollViewDelegate
    >

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation FSPhotoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
}

- (void)dealloc {
    NSLog(@"Deallocating FSPhotoDetailViewController");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.scrollView.zoomScale = 1;
    [self.scrollView setContentOffset:CGPointZero];
    if (self.didShowBlock) {
        self.didShowBlock();
    }
}

- (void)setUp {
    self.scrollView.maximumZoomScale = 6;
    self.scrollView.delegate = self;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:[self.photo largeUrl] ? : [self.photo mediumUrl]]];

}

#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}


@end
