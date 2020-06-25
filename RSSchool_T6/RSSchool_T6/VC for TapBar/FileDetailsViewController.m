//
//  FileDetailsViewController.m
//  RSSchool_T6
//
//  Created by Artemy Podlessky on 6/25/20.
//  Copyright © 2020 Artemy Podlessky. All rights reserved.
//

#import "FileDetailsViewController.h"
#import "UIColor+ProjectColors.h"
#import <Photos/Photos.h>

@interface FileDetailsViewController ()

@property (nonatomic, strong) UIView *header;

@property (nonatomic, strong) UILabel *createDateGray;
@property (nonatomic, strong) UILabel *modificationDateGray;
@property (nonatomic, strong) UILabel *typeGray;

@property (nonatomic, strong) UIButton *shareButton;
@property (nonatomic, strong) UIButton *back;

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation FileDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor setColorFromAssets:@"projectWhite"];
    
    [self setUpHeader];
    [self setUpHeaderConstraints];
    
    [self setUpScreenshot];
    [self setUpScreenshotConstraints];
    
    [self setUpLabels];
    [self setUpLabelsConstraint];
    
    [self setUpButton];
    [self setUpButtonConstraints];
    
    [self setUpBack];
    [self setUpBackConstraints];
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

//MARK: -> Set Up Screenshot
- (void) setUpScreenshot {
    self.screenshot = [[UIImageView alloc] init];
    [[self view] addSubview:self.screenshot];
}

- (void) setUpScreenshotConstraints {
    self.screenshot.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints: @[
    [self.screenshot.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:15],
    [self.screenshot.topAnchor constraintEqualToAnchor:self.header.bottomAnchor constant:15],
    [self.screenshot.bottomAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:30],
    [self.screenshot.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant: -15]]];
}

//MARK: -> Set Up Labels
-(void) setUpLabels {
    //name
    self.name = [[UILabel alloc] init];
    self.name.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
    [self.view addSubview:self.name];
    //createDateGray
    self.createDateGray = [[UILabel alloc] init];
    self.createDateGray.text = @"Creation date:";
    self.createDateGray.font = [UIFont fontWithName:@"HelveticaNeue-Regular" size:17];
    self.createDateGray.textColor = [UIColor setColorFromAssets:@"projectGray"];
    [self.view addSubview:self.createDateGray];
    //createDate
    self.createDate = [[UILabel alloc] init];
    self.createDate.font = [UIFont fontWithName:@"HelveticaNeue-Regular" size:17];
    [self.view addSubview:self.createDate];
    //modificationDateGray
    self.modificationDateGray = [[UILabel alloc] init];
    self.modificationDateGray.text = @"Modification date:";
    self.modificationDateGray.font = [UIFont fontWithName:@"HelveticaNeue-Regular" size:17];
    self.modificationDateGray.textColor = [UIColor setColorFromAssets:@"projectGray"];
    [self.view addSubview:self.modificationDateGray];
    //modificationDate
    self.modificationDate = [[UILabel alloc] init];
    self.modificationDate.font = [UIFont fontWithName:@"HelveticaNeue-Regular" size:17];
    [self.view addSubview:self.modificationDate];
    //typeGray
    self.typeGray = [[UILabel alloc] init];
    self.typeGray.text = @"Type:";
    self.typeGray.font = [UIFont fontWithName:@"HelveticaNeue-Regular" size:17];
    self.typeGray.textColor = [UIColor setColorFromAssets:@"projectGray"];
    [self.view addSubview:self.typeGray];
    //type
    self.type = [[UILabel alloc] init];
    self.type.font = [UIFont fontWithName:@"HelveticaNeue-Regular" size:17];
    [self.view addSubview:self.type];
}

- (void) setUpLabelsConstraint {
    //name
    self.name.translatesAutoresizingMaskIntoConstraints = NO;
    [self.name.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.name.centerYAnchor constraintEqualToAnchor:self.header.centerYAnchor constant:10].active = YES;
    //createDateGray
    self.createDateGray.translatesAutoresizingMaskIntoConstraints = NO;
    [self.createDateGray.leadingAnchor constraintEqualToAnchor:self.screenshot.leadingAnchor].active = YES;
    [self.createDateGray.topAnchor constraintEqualToAnchor:self.screenshot.bottomAnchor constant:50].active = YES;
    //modificationDateGray
    self.modificationDateGray.translatesAutoresizingMaskIntoConstraints = NO;
    [self.modificationDateGray.leadingAnchor constraintEqualToAnchor:self.screenshot.leadingAnchor].active = YES;
    [self.modificationDateGray.topAnchor constraintEqualToAnchor:self.createDateGray.bottomAnchor constant:5].active = YES;
    //typeGray
    self.typeGray.translatesAutoresizingMaskIntoConstraints = NO;
    [self.typeGray.leadingAnchor constraintEqualToAnchor:self.screenshot.leadingAnchor].active = YES;
    [self.typeGray.topAnchor constraintEqualToAnchor:self.modificationDateGray.bottomAnchor constant:5].active = YES;
    //createDate
    self.createDate.translatesAutoresizingMaskIntoConstraints = NO;
    [self.createDate.leadingAnchor constraintEqualToAnchor:self.createDateGray.trailingAnchor constant:5].active = YES;
    [self.createDate.topAnchor constraintEqualToAnchor:self.screenshot.bottomAnchor constant:50].active = YES;
    //modificationDate
    self.modificationDate.translatesAutoresizingMaskIntoConstraints = NO;
    [self.modificationDate.leadingAnchor constraintEqualToAnchor:self.modificationDateGray.trailingAnchor constant:5].active = YES;
    [self.modificationDate.topAnchor constraintEqualToAnchor:self.createDate.bottomAnchor constant:5].active = YES;
    //type
    self.type.translatesAutoresizingMaskIntoConstraints = NO;
    [self.type.leadingAnchor constraintEqualToAnchor:self.typeGray.trailingAnchor constant:5].active = YES;
    [self.type.topAnchor constraintEqualToAnchor:self.modificationDate.bottomAnchor constant:5].active = YES;
}

//MARK: -> Set Up Buttons
//Share Button
- (void) setUpButton {
    self.shareButton = [[UIButton alloc] init];
    self.shareButton.layer.cornerRadius = 25;
    [self.shareButton setTitle: @"Share" forState:UIControlStateNormal];
    [self.shareButton setTitleColor: [UIColor setColorFromAssets: @"projectBlack"] forState:UIControlStateNormal];
    self.shareButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:20];
    self.shareButton.backgroundColor = [UIColor setColorFromAssets: @"projectYellow"];
    [self.view addSubview:self.shareButton];
    [self.shareButton addTarget:self action:@selector(shareButtonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void) setUpButtonConstraints {
    self.shareButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.shareButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.shareButton.topAnchor constraintEqualToAnchor:self.type.bottomAnchor constant: 40].active = YES;
    [self.shareButton.heightAnchor constraintEqualToConstant:55.5].active = YES;
    [self.shareButton.widthAnchor constraintEqualToConstant:250].active = YES;
}
//Back Button
- (void) setUpBack {
    self.back = [[UIButton alloc] init];
    [self.back setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [self.back addSubview:self.back.imageView];
    [self.view addSubview:self.back];
    [self.back addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void) setUpBackConstraints {
    self.back.translatesAutoresizingMaskIntoConstraints = NO;
    [self.back.heightAnchor constraintEqualToConstant:15].active = YES;
    [self.back.widthAnchor constraintEqualToConstant:15].active = YES;
    [self.back.centerYAnchor constraintEqualToAnchor:self.header.centerYAnchor constant:10].active = YES;
    [self.back.trailingAnchor constraintEqualToAnchor:self.name.leadingAnchor constant:-40].active = YES;
}

//MARK: -> Actions
- (void) shareButtonClick {
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[self.someData] applicationActivities:nil];
    [self presentViewController:activityViewController animated:YES completion:nil];
}

- (void) backButtonClick {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.view removeFromSuperview];
}

@end
