//
//  FSCollectionHeaderView.m
//  FlickrSearch
//
//  Created by Illia on 10/15/16.
//  Copyright © 2016 illia. All rights reserved.
//

#import "FSCollectionHeaderView.h"
#import "FSICollectionPresenter.h"

@implementation FSCollectionHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self refreshColors];
}

- (void)refreshColors {
    [self.button1 setTintColor:[UIColor fsControlsDefaultColor]];
    [self.button2 setTintColor:[UIColor fsControlsDefaultColor]];
    [self.button3 setTintColor:[UIColor fsControlsDefaultColor]];
}

- (IBAction)buttonOneColumnClick:(id)sender {
    [self refreshColors];
    [sender setTintColor:[UIColor fsControlsActiveColor]];
    [self selectColumnType:FSCollectionTypeColumn];
}

- (IBAction)buttonTwoColumnClick:(id)sender {
    [self refreshColors];
    [sender setTintColor:[UIColor fsControlsActiveColor]];
    [self selectColumnType:FSCollectionTypeTwoColumn];
}

- (IBAction)buttonThreeColumnClick:(id)sender {
    [self refreshColors];
    [sender setTintColor:[UIColor fsControlsActiveColor]];
    [self selectColumnType:FSCollectionTypeThreeColumn];
}

- (void)selectColumnType:(FSCollectionType)type {
    if (self.selectBlock) {
        self.selectBlock(type);
    }
}

- (void)selectType:(NSInteger)type {
    [self refreshColors];
    UIButton *btn = nil;
    switch (type) {
        case 0:
            btn = self.button1;
            break;
        case 1:
            btn = self.button2;
            break;
        case 2:
            btn = self.button3;
            break;
            
        default:
            break;
    }
    [btn setTintColor:[UIColor fsControlsActiveColor]];

}


@end
