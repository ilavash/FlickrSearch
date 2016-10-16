//
//  FSMainViewController.m
//  FlickrSearch
//
//  Created by Illia on 10/15/16.
//  Copyright © 2016 illia. All rights reserved.
//

#import "FSMainViewController.h"
#import "FSCollectionHeaderView.h"
#import "FSCollectionPresenterFactory.h"
#import "FSDataLoader.h"
#import "FSPhotoModel.h"
#import "FSGalleryViewController.h"

#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>

static NSString *kSectionHeaderReuseId = @"sectionHeaderView";
static NSString *kToGalleryVcSegueId = @"toGalleryVcSegueId";

@interface FSMainViewController ()
    <
    UISearchBarDelegate,
    DZNEmptyDataSetSource,
    DZNEmptyDataSetDelegate
    >


@property (strong, nonatomic) id<FSICollectionPresenter> collectionPresenter;
@property (strong, nonatomic) FSDataLoader *dataLoader;
@property (weak, nonatomic) UISearchBar *searchbar;
@property (strong, nonatomic) FSCollectionHeaderView *header;
@property (assign, nonatomic) FSCollectionType presentationType;

@end

@implementation FSMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    UICollectionViewFlowLayout *flowLayout = (id)self.collectionView.collectionViewLayout;
    [flowLayout invalidateLayout];
}

#pragma mark - Configuration

- (void)setUp {
    [self setUpUI];
    self.dataLoader = [FSDataLoader new];
    [self selectPresentationType:FSCollectionTypeThreeColumn];
}

- (void)setUpUI {
    [self configureSearchBar];
    [self configureCollectionView];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
}

- (void)configureCollectionView {
    
    self.collectionView.emptyDataSetSource = self;
    self.collectionView.emptyDataSetDelegate = self;
    
    [self.collectionView setBackgroundColor:[UIColor fsBackgroundColor]];
    
    UINib *sectionHeaderNib = [UINib nibWithNibName:NSStringFromClass([FSCollectionHeaderView class]) bundle:nil];
    [self.collectionView registerNib:sectionHeaderNib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kSectionHeaderReuseId];
}

- (void)configureSearchBar {
    UISearchBar *bar = [[UISearchBar alloc] init];
    [bar setBarStyle:UIBarStyleDefault];
    [bar setTintColor:[UIColor fsMainTextColor]];
    [bar setReturnKeyType:UIReturnKeyDone];
    [bar setSearchBarStyle:UISearchBarStyleMinimal];
    [bar setKeyboardAppearance:UIKeyboardAppearanceDark];
    [bar setDelegate:self];
    
    [[UITextField appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setDefaultTextAttributes:@{NSForegroundColorAttributeName:[UIColor fsMainTextColor]}];
    
    [self.navigationItem setTitleView:bar];
    self.searchbar = bar;
}

#pragma mark - Common

- (void)search:(NSString *)text {
    [self.dataLoader searchPhotos:text complete:^{
        [self.collectionView setContentOffset:CGPointMake(0.0f, -64.0f)];
        [self.collectionView reloadData];
    }];
}

- (void)selectPresentationType:(FSCollectionType)type {
    self.presentationType = type;
    self.collectionPresenter = [FSCollectionPresenterFactory presenterForType:type];
    [self.collectionView reloadData];
}

#pragma mark - UISearchBarDelegate

- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text   {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(search:) object:searchBar.text];
    return YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self performSelector:@selector(search:) withObject:searchText afterDelay:0.5f];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}


#pragma mark - UICollectionViewDataSource, UICollectionViewDelegate

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    FSCollectionHeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kSectionHeaderReuseId forIndexPath:indexPath];
    
    __weak typeof (self) weakSelf = self;
    [view setSelectBlock:^(NSInteger type) {
        __strong typeof (weakSelf) strongSelf = weakSelf;
        [strongSelf selectPresentationType:type];
    }];
    [view selectType:self.presentationType];
    
    return view;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:kToGalleryVcSegueId sender:indexPath];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataLoader numberOfCells];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FSPhotoModel *item = [self.dataLoader itemAtIndexPath:indexPath];
    UICollectionViewCell *cell = [self.collectionPresenter collectionView:collectionView cellForItem:item atIndexPath:indexPath];
    return cell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return [self.collectionPresenter collectionView:collectionView layout:collectionViewLayout minimumLineSpacingForSectionAtIndex:section];
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return [self.collectionPresenter collectionView:collectionView layout:collectionViewLayout minimumInteritemSpacingForSectionAtIndex:section];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    FSPhotoModel *item = [self.dataLoader itemAtIndexPath:indexPath];
    return [self.collectionPresenter collectionView:collectionView layout:collectionViewLayout sizeForItem:item atIndexPath:indexPath];
}

#pragma mark - UISCrollViewDelegate

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    //if reaches end 
    if (scrollView.contentSize.height - scrollView.frame.size.height - targetContentOffset->y < 1.0f) {
        [self.dataLoader loadMore:^{
            [self.collectionView reloadData];
        }];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.searchbar resignFirstResponder];
}


#pragma mark - DZNEmptyDataSetDelegate

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
    return NO;
}

- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView {
    return NO;
}

- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView {
    
    UIView *emptyView = nil;
    
    if (self.dataLoader.state == FSDataLoaderStateLoadInProgress) {
        UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] init];
        [spinner startAnimating];
        emptyView = spinner;
    } else {
        NSString *title= @"";
        switch (self.dataLoader.state) {
            case FSDataLoaderStateNoSearchQuery:
                title = NSLocalizedString(@"start_searching_key", nil);
                break;
            case FSDataLoaderStateNoData:
                title = NSLocalizedString(@"nothing_found_key", nil) ;
                break;
            case FSDataLoaderStateError:
                title = NSLocalizedString(@"error_key", nil);
                break;
            default:
                break;
        }
        NSAttributedString *str = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName : [UIColor fsMainTextColor]}];
        
        UILabel *label = [[UILabel alloc] init];
        [label setFont:[UIFont boldSystemFontOfSize:24.0f]];
        [label setContentMode:UIViewContentModeCenter];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setAttributedText:str];
        emptyView = label;
    }
    [self.collectionView setContentOffset:CGPointMake(0.0f, -64.0f)];

    return emptyView;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kToGalleryVcSegueId]) {
        
        FSGalleryViewController *vc = [segue destinationViewController];
        [vc setItems:[[self.dataLoader photos] copy]];
        NSIndexPath *indexPath = sender;
        [vc setSelectedIndex:indexPath.row];
    }
}




@end
