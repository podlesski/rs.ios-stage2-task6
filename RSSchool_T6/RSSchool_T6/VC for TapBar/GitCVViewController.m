//
//  GitCVViewController.m
//  RSSchool_T6
//
//  Created by Artemy Podlessky on 6/22/20.
//  Copyright © 2020 Artemy Podlessky. All rights reserved.
//

#import "GitCVViewController.h"
#import "UIColor+ProjectColors.h"
#import "StartVC.h"

@interface GitCVViewController ()

@property (nonatomic, strong) UIView *header;
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UIView *bottomLine;

@property (nonatomic, strong) UIImageView *logo;

@property (nonatomic, strong) UILabel *phoneName;
@property (nonatomic, strong) UILabel *model;
@property (nonatomic, strong) UILabel *system;
@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) UIButton *startButton;
@property (nonatomic, strong) UIButton *buttonWithCV;


@end

@implementation GitCVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpHeader];
    [self setUpHeaderConstraints];
    
    [self setUpLabel];
    [self setUpLabelConstraints];
       
    [self setUpTopView];
    [self setUpTopViewConstraints];
    
    [self setUpLogo];
    [self setUpLogoConstraints];
    
    [self setUpPhoneName];
    [self setUpPhoneNameConstraints];
    
    [self setUpModel];
    [self setUpModelConstraints];
    
    [self setUpSystem];
    [self setUpSystemConstraints];
    
    [self setUpBottomView];
    [self setUpBottomViewConstraints];
    
    [self setUpButtonWithCV];
    [self setUpButtonWithCVConstraints];
    
    [self setUpStartButton];
    [self setUpStartButtonConstraints];
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

//MARK: -> Set Up Label
- (void) setUpLabel {
    self.label = [[UILabel alloc] init];
    self.label.text = @"RSSchool Task 6";
    [self.view addSubview:self.label];
    self.label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
}

- (void) setUpLabelConstraints {
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    [self.label.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.label.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:60].active = YES;
}

//MARK: -> Set Up Logo
- (void) setUpLogo {
    self.logo = [[UIImageView alloc] init];
    self.logo.image = [UIImage imageNamed:@"apple"];
    self.logo.contentMode = UIViewContentModeScaleAspectFill;
    self.logo.layer.masksToBounds = YES;
    [[self view] addSubview:self.logo];
}

- (void) setUpLogoConstraints {
    self.logo.translatesAutoresizingMaskIntoConstraints = NO;
    [self.logo.centerYAnchor constraintEqualToAnchor:self.topView.centerYAnchor].active = YES;
    [self.logo.trailingAnchor constraintEqualToAnchor:self.topView.centerXAnchor constant: -50.0].active = YES;
}

//MARK: -> Set Up Top View
- (void) setUpTopView {
    self.topView = [[UIView alloc] init];
    self.topView.backgroundColor = [UIColor setColorFromAssets:@"projectWhite"];
    [[self view] addSubview:self.topView];
}

- (void) setUpTopViewConstraints {
    self.topView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.topView.bottomAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:-40.0 ].active = YES;
    [self.topView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.topView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.topView.topAnchor constraintEqualToAnchor:self.header.bottomAnchor].active = YES;
}

//MARK: -> Set Up Phone Name
- (void) setUpPhoneName {
    self.phoneName = [[UILabel alloc] init];
    self.phoneName.text = [[UIDevice currentDevice] name];
    [self.view addSubview:self.phoneName];
    self.phoneName.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:17];
}

- (void) setUpPhoneNameConstraints {
    self.phoneName.translatesAutoresizingMaskIntoConstraints = NO;
    [self.phoneName.leadingAnchor constraintEqualToAnchor:self.logo.trailingAnchor constant:35].active = YES;
    [self.phoneName.centerYAnchor constraintEqualToAnchor:self.topView.centerYAnchor constant:-25.0].active = YES;
}

//MARK: -> Set Up Model
- (void) setUpModel {
    self.model = [[UILabel alloc] init];
    self.model.text = [[UIDevice currentDevice] model];
    [self.view addSubview:self.model];
    self.model.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:17];
}

- (void) setUpModelConstraints {
    self.model.translatesAutoresizingMaskIntoConstraints = NO;
    [self.model.leadingAnchor constraintEqualToAnchor:self.logo.trailingAnchor constant:35].active = YES;
    [self.model.centerYAnchor constraintEqualToAnchor:self.topView.centerYAnchor].active = YES;
}

//MARK: -> Set Up System
- (void) setUpSystem {
    self.system = [[UILabel alloc] init];
    self.system.text = [[NSString alloc] initWithFormat:@"%@ %@", [[UIDevice currentDevice] systemName], [[UIDevice currentDevice] systemVersion]];
    [self.view addSubview:self.system];
    self.system.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:17];
}

- (void) setUpSystemConstraints {
    self.system.translatesAutoresizingMaskIntoConstraints = NO;
    [self.system.leadingAnchor constraintEqualToAnchor:self.logo.trailingAnchor constant:35].active = YES;
    [self.system.centerYAnchor constraintEqualToAnchor:self.topView.centerYAnchor constant:25.0].active = YES;
}

//MARK: -> Set Up Bottom View
- (void) setUpBottomView {
    self.bottomView = [[UIView alloc] init];
    self.bottomView.backgroundColor = [UIColor setColorFromAssets:@"projectWhite"];
    [[self view] addSubview:self.bottomView];
}

- (void) setUpBottomViewConstraints {
    self.bottomView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.bottomView.topAnchor constraintEqualToAnchor:self.view.centerYAnchor constant: 40.0 ].active = YES;
    [self.bottomView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.bottomView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.bottomView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
}

//MARK: -> Set Up Button With CV
- (void) setUpButtonWithCV {
    self.buttonWithCV = [[UIButton alloc] init];
    self.buttonWithCV.layer.cornerRadius = 25;
    [self.buttonWithCV setTitle: @"Open Git CV" forState:UIControlStateNormal];
    [self.buttonWithCV setTitleColor: [UIColor setColorFromAssets: @"projectBlack"] forState:UIControlStateNormal];
    self.buttonWithCV.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:20];
    self.buttonWithCV.backgroundColor = [UIColor setColorFromAssets: @"projectYellow"];
    
    [self.view addSubview:self.buttonWithCV];
    [self.buttonWithCV addTarget:self action:@selector(buttonCVClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void) setUpButtonWithCVConstraints {
    self.buttonWithCV.translatesAutoresizingMaskIntoConstraints = NO;
    [self.buttonWithCV.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.buttonWithCV.topAnchor constraintEqualToAnchor:self.bottomView.centerYAnchor constant: -100].active = YES;
    [self.buttonWithCV.heightAnchor constraintEqualToConstant:55.5].active = YES;
    [self.buttonWithCV.widthAnchor constraintEqualToConstant:250].active = YES;
}

//MARK: -> Set Up Start Button
- (void) setUpStartButton{
    self.startButton = [[UIButton alloc] init];
    self.startButton.layer.cornerRadius = 25;
    [self.startButton setTitle: @"Go to start!" forState:UIControlStateNormal];
    [self.startButton setTitleColor: [UIColor setColorFromAssets: @"projectWhite"] forState:UIControlStateNormal];
    self.startButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:20];
    self.startButton.backgroundColor = [UIColor setColorFromAssets: @"projectRed"];
    
    [self.view addSubview:self.startButton];
    [self.startButton addTarget:self action:@selector(buttonStartClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void) setUpStartButtonConstraints {
    self.startButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.startButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.startButton.bottomAnchor constraintEqualToAnchor:self.bottomView.centerYAnchor constant: 30].active = YES;
    [self.startButton.heightAnchor constraintEqualToConstant:55.5].active = YES;
    [self.startButton.widthAnchor constraintEqualToConstant:250].active = YES;
}

//MARK: -> Actions
- (void) buttonCVClick {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"https://podlesski.github.io/rsschool-cv/cv"] options: @{} completionHandler: nil];
}

- (void) buttonStartClick {
    [self.tabBarController dismissViewControllerAnimated:YES completion:nil];
    [self.tabBarController.view removeFromSuperview];
}

@end
