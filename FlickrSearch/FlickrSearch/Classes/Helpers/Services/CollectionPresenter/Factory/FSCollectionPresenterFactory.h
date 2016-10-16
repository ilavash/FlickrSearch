//
//  FSCollectionPresenterFactory.h
//  FlickrSearch
//
//  Created by Illia on 10/15/16.
//  Copyright © 2016 illia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSICollectionPresenter.h"

@interface FSCollectionPresenterFactory : NSObject

+ (id<FSICollectionPresenter>)presenterForType:(FSCollectionType)type;

@end
