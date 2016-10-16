//
//  UIColor+FSColors.m
//  FlickrSearch
//
//  Created by Illia on 10/15/16.
//  Copyright © 2016 illia. All rights reserved.
//

#import "UIColor+FSColors.h"

@implementation UIColor (FSColors)

+ (UIColor *)fsNavigationBarColor {
    return [UIColor colorWithRed:30.0/255.0f green:44.0/255.0f blue:55.0/255.0f alpha:1.0];
}

+ (UIColor *)fsBackgroundColor {
    return [UIColor colorWithRed:26.0/255.0f green:40.0/255.0f blue:50.0/255.0f alpha:1.0];
}
+ (UIColor *)fsMainTextColor {
    return [UIColor whiteColor];
}
+ (UIColor *)fsSecondaryTextColor {
    return [UIColor lightGrayColor];
}
+ (UIColor *)fsControlsDefaultColor {
    return [UIColor lightGrayColor];
}
+ (UIColor *)fsControlsActiveColor {
    return [UIColor colorWithRed:37.0/255.0f green:94.0/255.0f blue:90.0/255.0f alpha:1.0];
}

@end
