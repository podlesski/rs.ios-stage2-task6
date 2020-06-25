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
#import "FileDetailsViewController.h"

@interface GalleryViewController ()

@property (nonatomic, strong) UIView *header;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UICollectionView *collectionView;
@property(nonatomic, strong) PHFetchResult *assetsFetchResults;
@property(nonatomic, strong) PHCachingImageManager *imageManager;
@property (nonatomic, strong) FileDetailsViewController *fileDetailsViewController;

@end

@implementation GalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpHeader];
    [self setUpHeaderConstraints];
    
    [self setUpLabel];
    [self setUpLabelConstraints];
    
    [self setUpCollectionView];
    [self setUpCollectionViewConstraints];
    
    self.view.backgroundColor = [UIColor setColorFromAssets:@"projectWhite"];
    
    //Phone Gallery
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
    options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
    self.assetsFetchResults = [PHAsset fetchAssetsWithOptions:options];
    self.imageManager = [[PHCachingImageManager alloc] init];
}


//MARK: -> Set Up CollectionView
- (void) setUpCollectionView {
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

- (void) setUpCollectionViewConstraints {
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints: @[
    [self.collectionView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:5],
    [self.collectionView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-5],
    [self.collectionView.topAnchor constraintEqualToAnchor:self.header.bottomAnchor constant:5],
    [self.collectionView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]]];
}

//MARK: -> Set Up Label
- (void) setUpLabel {
    self.label = [[UILabel alloc] init];
    self.label.text = @"Gallery";
    self.label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
    [self.view addSubview:self.label];
}

- (void) setUpLabelConstraints {
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    [self.label.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.label.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:60].active = YES;
}

//MARK: -> Set Up Header
- (void) setUpHeader {
    self.header = [[UIView alloc] init];
    self.header.backgroundColor = [UIColor setColorFromAssets:@"projectYellow"];
    [[self view] addSubview:self.header];
}

- (void) setUpHeaderConstraints {
    self.header.translatesAutoresizingMaskIntoConstraints = NO;
    [self.header.heightAnchor constraintEqualToConstant:100.0].active = YES;
    [self.header.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.header.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.header.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
}

//MARK: -> DataSource
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
    long int index = (indexPath.section * 3) + indexPath.row;
    PHAsset *asset = self.assetsFetchResults[index];
    [self.imageManager requestImageForAsset:asset targetSize:cell.screenshot.frame.size contentMode:PHImageContentModeAspectFill options:nil resultHandler:^(UIImage *result, NSDictionary *info)
    {
        cell.screenshot.contentMode = UIViewContentModeScaleAspectFill;
        cell.screenshot.layer.masksToBounds = YES;
        cell.screenshot.image = result;
    }];
    return cell;
}

//MARK: -> CollectionView Layout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    double sizeOfItem = collectionView.frame.size.width / 3.0;
    int final = ceil(sizeOfItem) - 15;
    return  CGSizeMake (final, final);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

//MARK: -> Item was selected
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.fileDetailsViewController = [[FileDetailsViewController alloc] init];
    long int index = (indexPath.section * 3) + indexPath.row;
    PHAsset *asset = self.assetsFetchResults[index];
    [self.imageManager requestImageForAsset:asset targetSize:self.fileDetailsViewController.screenshot.frame.size contentMode:PHImageContentModeAspectFill options:nil resultHandler:^(UIImage *result, NSDictionary *info)
    {
        self.fileDetailsViewController.screenshot.contentMode = UIViewContentModeScaleAspectFill;
        self.fileDetailsViewController.screenshot.layer.masksToBounds = YES;
        self.fileDetailsViewController.screenshot.image = result;
        self.fileDetailsViewController.someData = result;
        self.fileDetailsViewController.name.text = ((PHAssetResource*)self.assetsFetchResults[0]).originalFilename;
        self.fileDetailsViewController.createDate.text = [self dateToString:asset.creationDate];
        self.fileDetailsViewController.modificationDate.text = [self dateToString:asset.modificationDate];
        
        switch (asset.mediaType) {
            case PHAssetMediaTypeImage:
                self.fileDetailsViewController.type.text = @"Image";
                
                break;
            case PHAssetMediaTypeVideo:
                self.fileDetailsViewController.type.text = @"Video";
                break;
            case PHAssetMediaTypeAudio:
                self.fileDetailsViewController.type.text = @"Audio";
                break;
            default:
                self.fileDetailsViewController.type.text = @"Other";
                break;
        }
    }];
    
    UINavigationController *customNVC = [[UINavigationController alloc] initWithRootViewController:self.fileDetailsViewController];
    [customNVC setNavigationBarHidden:YES];
    [self presentViewController:customNVC animated:YES completion:nil];
}

//MARK: -> Date Formatter
- (NSString *) dateToString:(NSDate*)fileDate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm:ss dd:MM:YYYY";
    NSString *result = [formatter stringFromDate:[NSDate date]];
    
    return result;
}

@end
