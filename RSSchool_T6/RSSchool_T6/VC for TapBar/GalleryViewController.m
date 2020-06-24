//
//  GalleryViewController.m
//  RSSchool_T6
//
//  Created by Artemy Podlessky on 6/22/20.
//  Copyright © 2020 Artemy Podlessky. All rights reserved.
//

#import "GalleryViewController.h"
#import "UIColor+ProjectColors.h"
#import <Photos/Photos.h>
#import "GalleryCell.h"

@interface GalleryViewController ()

@property (nonatomic, strong) UIView *header;
@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) UICollectionView *collectionView;

@property(nonatomic, strong) PHFetchResult *assetsFetchResults;
@property(nonatomic, strong) PHCachingImageManager *imageManager;

@end

@implementation GalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //MARK: -> Header
    self.header = [[UIView alloc] init];
    self.header.backgroundColor = [UIColor setColorFromAssets:@"projectYellow"];
    
    [[self view] addSubview:self.header];
    
    self.header.translatesAutoresizingMaskIntoConstraints = NO;
    
    //MARK: -> Label
    self.label = [[UILabel alloc] init];
    self.label.text = @"Gallery";
    self.label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
    
    [self.view addSubview:self.label];
    
    self.view.backgroundColor = [UIColor setColorFromAssets:@"projectWhite"];
    
    //MARK: -> Phone Gallery
    
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
    //??
    options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
    //???
    self.assetsFetchResults = [PHAsset fetchAssetsWithOptions:options];

    self.imageManager = [[PHCachingImageManager alloc] init];
    
    //MARK: -> CollectionView
    UICollectionViewFlowLayout *layout= [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    
    self.collectionView.scrollEnabled = YES;
    self.collectionView.showsVerticalScrollIndicator = YES;
    self.collectionView.userInteractionEnabled = YES;
    self.collectionView.bounces = YES;

    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerClass:[GalleryCell class] forCellWithReuseIdentifier:@"newCell"];
    [[self view] addSubview:self.collectionView];
    
    self.collectionView.backgroundColor = [UIColor setColorFromAssets:@"projectWhite"];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    [self.header.heightAnchor constraintEqualToConstant:100.0].active = YES;
    [self.header.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.header.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.header.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;

    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    [self.label.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.label.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:60].active = YES;
    
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints: @[
    [self.collectionView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:5],
    [self.collectionView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-5],
    [self.collectionView.topAnchor constraintEqualToAnchor:self.header.bottomAnchor constant:5],
    [self.collectionView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]]];
    
}


- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    double countOfItem = [self.assetsFetchResults count] / 3.0;
    int numberOfSections = ceil(countOfItem);
    return numberOfSections;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    GalleryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"newCell" forIndexPath:indexPath];
    
    PHAsset *asset = self.assetsFetchResults[indexPath.item];
    
    [self.imageManager requestImageForAsset:asset targetSize:cell.screenshot.frame.size contentMode:PHImageContentModeAspectFill options:nil resultHandler:^(UIImage *result, NSDictionary *info)
    {
        cell.screenshot.contentMode = UIViewContentModeScaleAspectFill;
        cell.screenshot.layer.masksToBounds = YES;
        cell.screenshot.image = result;
        
    }];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    double sizeOfItem = collectionView.frame.size.width / 3.0;
    int final = ceil(sizeOfItem) - 15;
    
    return  CGSizeMake (final, final);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {

    return UIEdgeInsetsMake(5, 5, 5, 5);
}


@end
