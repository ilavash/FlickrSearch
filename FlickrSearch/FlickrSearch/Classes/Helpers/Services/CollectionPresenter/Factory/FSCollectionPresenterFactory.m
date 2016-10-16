//
//  FSCollectionPresenterFactory.m
//  FlickrSearch
//
//  Created by Illia on 10/15/16.
//  Copyright © 2016 illia. All rights reserved.
//

#import "FSCollectionPresenterFactory.h"
#import "FSThreeColumnsPresenter.h"
#import "FSTwoColumnsPresenter.h"
#import "FSOneColumnPresenter.h"



@implementation FSCollectionPresenterFactory

+ (id<FSICollectionPresenter>)presenterForType:(FSCollectionType)type {
    id<FSICollectionPresenter> presenter = nil;
    
    switch (type) {
        case FSCollectionTypeColumn:
            presenter = [FSOneColumnPresenter new];
            break;
        case FSCollectionTypeTwoColumn:
            presenter = [FSTwoColumnsPresenter new];
            break;
        case FSCollectionTypeThreeColumn:
            presenter = [FSThreeColumnsPresenter new];
            break;
        default:
            break;
    }
    return presenter;
}

@end
