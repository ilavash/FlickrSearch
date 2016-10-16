//
//  FSGalleryViewController.m
//  FlickrSearch
//
//  Created by Illia on 10/16/16.
//  Copyright © 2016 illia. All rights reserved.
//

#import "FSGalleryViewController.h"
#import "FSPhotoDetailViewController.h"

@interface FSGalleryViewController ()
    <
    UIPageViewControllerDataSource,
    UIPageViewControllerDelegate
    >

@property (weak, nonatomic) UIPageViewController *pageViewController;

@end

@implementation FSGalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.pageViewController ref];
    
}

- (void)dealloc {
    NSLog(@"Deallocating FSGalleryViewController");
}

#pragma mark - Configuration

- (void)setUp {
    [self setUpPaging];
}

- (void)setUpPaging {
    
    UIPageViewController *pageVc = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    pageVc.delegate = self;
    pageVc.dataSource = self;
    
    [self addChildViewController:pageVc];
    [self.view addSubview:pageVc.view];
    [self.view sendSubviewToBack:pageVc.view];
    [pageVc didMoveToParentViewController:self];
    
    if (self.items.count > 0) {
        FSPhotoDetailViewController *vc = [self contentViewControllerForIndex:self.selectedIndex];
        [pageVc setViewControllers:@[vc]
                                    direction:UIPageViewControllerNavigationDirectionForward
                                    animated:NO
                                    completion:nil];
    }
    
    
    self.pageViewController = pageVc;

    
}

#pragma mark - Common

- (FSPhotoDetailViewController *)contentViewControllerForIndex:(NSUInteger)index {
    FSPhotoDetailViewController *pageContentViewController = nil;
    
    if (index < self.items.count) {
        NSString *identifier = NSStringFromClass([FSPhotoDetailViewController class]);
        FSPhotoModel *item = self.items[index];
        
        pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
        pageContentViewController.index = index;
        pageContentViewController.photo = item;
        
        __weak typeof (self) weakSelf = self;
        pageContentViewController.didShowBlock = ^{
            __strong typeof (weakSelf) strongSelf = weakSelf;
            NSString *title = [NSString stringWithFormat:@"%@ of %@",@(index + 1).stringValue, @(strongSelf.items.count).stringValue];
            [[strongSelf navigationItem] setTitle:title];
        };
    }
    
    return pageContentViewController;
}

#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(UIViewController *)viewController {
    FSPhotoDetailViewController *currentPageContentViewController = (FSPhotoDetailViewController *)viewController;
    FSPhotoDetailViewController *previousPageContentViewController = nil;

    if (currentPageContentViewController.index > 0)
    {
        previousPageContentViewController = [self contentViewControllerForIndex:currentPageContentViewController.index - 1];
    }
    return previousPageContentViewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerAfterViewController:(UIViewController *)viewController {
    FSPhotoDetailViewController *currentPageContentViewController = (FSPhotoDetailViewController *)viewController;
    FSPhotoDetailViewController *nextPageContentViewController = nil;
    
    if (currentPageContentViewController.index + 1 < self.items.count) {
        nextPageContentViewController = [self contentViewControllerForIndex:currentPageContentViewController.index + 1];
    }
    
    return nextPageContentViewController;
}


@end
