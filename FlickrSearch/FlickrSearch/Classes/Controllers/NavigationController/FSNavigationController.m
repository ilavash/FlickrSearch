//
//  FSNavigationController.m
//  FlickrSearch
//
//  Created by Illia on 10/15/16.
//  Copyright © 2016 illia. All rights reserved.
//

#import "FSNavigationController.h"
#import "UIColor+FSColors.h"

@interface FSNavigationController ()

@end

@implementation FSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setup {
    [self.navigationBar setTintColor:[UIColor fsMainTextColor]];
    [self.navigationBar setBarTintColor:[UIColor fsNavigationBarColor]];
    
    self.navigationBar.titleTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:17.0 weight:UIFontWeightSemibold],
                                               NSForegroundColorAttributeName : [UIColor fsMainTextColor]};
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

@end
