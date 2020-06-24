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

@interface InfoViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIView *header;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UITableView *tableView;

@property(nonatomic , strong) PHFetchResult *assetsFetchResults;
@property(nonatomic , strong) PHCachingImageManager *imageManager;

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //MARK: -> Header
    self.header = [[UIView alloc] init];
    self.header.backgroundColor = [UIColor setColorFromAssets:@"projectYellow"];
    
    [[self view] addSubview:self.header];
    
    self.header.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    //MARK: -> TableView
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
    
    //MARK: -> Phone Gallery
    
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
    //??
    options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
    //???
    self.assetsFetchResults = [PHAsset fetchAssetsWithOptions:options];

    self.imageManager = [[PHCachingImageManager alloc] init];
    
    
    //MARK: -> Label
    self.label = [[UILabel alloc] init];
    self.label.text = @"Info";
    self.label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
    
    [self.view addSubview:self.label];
    
    
    self.view.backgroundColor = [UIColor setColorFromAssets:@"projectWhite"];
    
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
    
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints: @[
    [self.tableView.widthAnchor constraintEqualToConstant:self.view.frame.size.width],
    [self.tableView.topAnchor constraintEqualToAnchor:self.header.bottomAnchor constant:5],
    [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]]];
    
}

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

-(NSString*)formattedDuration:(NSTimeInterval)interval{
    NSDateComponentsFormatter *formatter = [[NSDateComponentsFormatter alloc] init];
    formatter.allowedUnits = NSCalendarUnitMinute | NSCalendarUnitSecond;
    formatter.zeroFormattingBehavior = NSDateComponentsFormatterZeroFormattingBehaviorPad;
    NSString *string = [formatter stringFromTimeInterval:interval];
    return string;
}

@end
