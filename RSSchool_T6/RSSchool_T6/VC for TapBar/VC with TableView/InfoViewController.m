//
//  InfoViewController.m
//  RSSchool_T6
//
//  Created by Artemy Podlessky on 6/22/20.
//  Copyright © 2020 Artemy Podlessky. All rights reserved.
//

#import "InfoViewController.h"
#import "UIColor+ProjectColors.h"
#import "InfoCell.h"
#import <Photos/Photos.h>
#import "FileDetailsViewController.h"

@interface InfoViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIView *header;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UITableView *tableView;

@property(nonatomic , strong) PHFetchResult *assetsFetchResults;
@property(nonatomic , strong) PHCachingImageManager *imageManager;

@property (nonatomic, strong) FileDetailsViewController *fileDetailsViewController;

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpHeader];
    [self setUpHeaderConstraints];
    
    [self setUpTableView];
    [self setUpTableViewConstraint];
    
    [self setUpLabel];
    [self setUpLabelConstraints];

    //Phone Gallery
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
    options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
    self.assetsFetchResults = [PHAsset fetchAssetsWithOptions:options];
    self.imageManager = [[PHCachingImageManager alloc] init];
}

//MARK: -> Set Up Label
- (void) setUpLabel {
    self.label = [[UILabel alloc] init];
    self.label.text = @"Info";
    self.label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
    [self.view addSubview:self.label];
    self.view.backgroundColor = [UIColor setColorFromAssets:@"projectWhite"];
}

- (void) setUpLabelConstraints {
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    [self.label.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.label.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:60].active = YES;
}

//MARK: -> Set Up TableView
- (void) setUpTableView {
    self.tableView = [[UITableView alloc]init];
    self.tableView.rowHeight = 150;
    self.tableView.scrollEnabled = YES;
    self.tableView.showsVerticalScrollIndicator = YES;
    self.tableView.userInteractionEnabled = YES;
    self.tableView.bounces = YES;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[InfoCell class] forCellReuseIdentifier:@"newCell"];
    [[self view] addSubview:self.tableView];
}

- (void) setUpTableViewConstraint {
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints: @[
    [self.tableView.widthAnchor constraintEqualToConstant:self.view.frame.size.width],
    [self.tableView.topAnchor constraintEqualToAnchor:self.header.bottomAnchor constant:5],
    [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]]];
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
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    InfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newCell" forIndexPath:indexPath];
    PHAsset *asset = self.assetsFetchResults[indexPath.item];
    [self.imageManager requestImageForAsset:asset targetSize:cell.screenshot.frame.size contentMode:PHImageContentModeAspectFill options:nil resultHandler:^(UIImage *result, NSDictionary *info)
    {
        cell.screenshot.contentMode = UIViewContentModeScaleAspectFill;
        cell.screenshot.layer.masksToBounds = YES;
        cell.type.contentMode = UIViewContentModeScaleAspectFill;
        
        cell.name.text = ((PHAssetResource*)self.assetsFetchResults[0]).originalFilename;
        cell.screenshot.image = result;
        
        switch (asset.mediaType) {
            case PHAssetMediaTypeImage:
                cell.type.image = [UIImage imageNamed:@"image"];
                cell.info.text = [[NSString alloc] initWithFormat:@"%lux%lu", (unsigned long)asset.pixelHeight, asset.pixelWidth];
                
                break;
            case PHAssetMediaTypeVideo:
                cell.type.image = [UIImage imageNamed:@"video"];
                cell.info.text = [[NSString alloc] initWithFormat:@"%lux%lu %@", (unsigned long)asset.pixelHeight, asset.pixelWidth, [self formattedDuration: asset.duration]];
                break;
            case PHAssetMediaTypeAudio:
                cell.type.image = [UIImage imageNamed:@"audio"];
                cell.info.text = [[NSString alloc] initWithFormat:@"%@", [self formattedDuration: asset.duration]];
                break;
            default:
                cell.screenshot.image = [UIImage imageNamed:@"other"];
                break;
        }
        
    }];
    
    cell.name.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:17];
    cell.info.font = [UIFont fontWithName:@"HelveticaNeue-Regular" size:12];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.assetsFetchResults count];
}

//MARK: -> Row was selected
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.fileDetailsViewController = [[FileDetailsViewController alloc] init];
    PHAsset *asset = self.assetsFetchResults[indexPath.item];
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
    
    [self.navigationController pushViewController:self.fileDetailsViewController animated:YES];
    [[self view] addSubview:self.fileDetailsViewController.view];
}

//MARK: -> Duration Formatter
-(NSString*)formattedDuration:(NSTimeInterval)interval{
    NSDateComponentsFormatter *formatter = [[NSDateComponentsFormatter alloc] init];
    formatter.allowedUnits = NSCalendarUnitMinute | NSCalendarUnitSecond;
    formatter.zeroFormattingBehavior = NSDateComponentsFormatterZeroFormattingBehaviorPad;
    NSString *string = [formatter stringFromTimeInterval:interval];
    return string;
}

//MARK: -> Date Formatter
- (NSString *) dateToString:(NSDate*)fileDate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm:ss dd:MM:YYYY";
    NSString *result = [formatter stringFromDate:[NSDate date]];
    return result;
}

@end
