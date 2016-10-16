//
//  FSCollectionHeaderView.h
//  FlickrSearch
//
//  Created by Illia on 10/15/16.
//  Copyright © 2016 illia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FSCollectionHeaderView : UICollectionReusableView

@property (strong, nonatomic) void(^selectBlock)(NSInteger columnType);

- (void)selectType:(NSInteger)type;

@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button1;

@end
