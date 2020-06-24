//
//  GitCVViewController.m
//  RSSchool_T6
//
//  Created by Artemy Podlessky on 6/22/20.
//  Copyright © 2020 Artemy Podlessky. All rights reserved.
//

#import "GitCVViewController.h"
#import "UIColor+ProjectColors.h"

@interface GitCVViewController ()

@property (nonatomic, strong) UIView *header;
@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UIView *bottomLine;

@property (nonatomic, strong) UIImageView *logo;
@property (nonatomic, strong) UILabel *phoneName;
@property (nonatomic, strong) UILabel *model;
@property (nonatomic, strong) UILabel *system;

@property (nonatomic, strong) UIButton *cvButton;
@property (nonatomic, strong) UIButton *startButton;


@end

@implementation GitCVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //MARK: -> Top and Bottom view
    
    self.topView = [[UIView alloc] init];
    self.topView.backgroundColor = [UIColor setColorFromAssets:@"projectWhite"];
    [[self view] addSubview:self.topView];
    self.topView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.bottomView = [[UIView alloc] init];
    self.bottomView.backgroundColor = [UIColor setColorFromAssets:@"projectWhite"];
    [[self view] addSubview:self.bottomView];
    self.bottomView.translatesAutoresizingMaskIntoConstraints = NO;
    
    //MARK: -> Buttons
    self.startButton = [[UIButton alloc] init];
    self.startButton.layer.cornerRadius = 25;
    [self.startButton setTitle: @"Open Git CV" forState:UIControlStateNormal];
    [self.startButton setTitleColor: [UIColor setColorFromAssets: @"projectBlack"] forState:UIControlStateNormal];
    self.startButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:20];
    self.startButton.backgroundColor = [UIColor setColorFromAssets: @"projectYellow"];
    
    [self.view addSubview:self.startButton];
    [self.startButton addTarget:self action:@selector(buttonStartClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.cvButton = [[UIButton alloc] init];
    self.cvButton.layer.cornerRadius = 25;
    [self.cvButton setTitle: @"Go to start!" forState:UIControlStateNormal];
    [self.cvButton setTitleColor: [UIColor setColorFromAssets: @"projectBlack"] forState:UIControlStateNormal];
    self.cvButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:20];
    self.cvButton.backgroundColor = [UIColor setColorFromAssets: @"projectRed"];
    
    [self.view addSubview:self.cvButton];
    [self.cvButton addTarget:self action:@selector(buttonStartClick) forControlEvents:UIControlEventTouchUpInside];
    
    //MARK: -> Logo
    
    self.logo = [[UIImageView alloc] init];
    self.logo.image = [UIImage imageNamed:@"apple"];
    
    self.logo.contentMode = UIViewContentModeScaleAspectFill;
    self.logo.layer.masksToBounds = YES;
    
    [[self view] addSubview:self.logo];
    self.logo.translatesAutoresizingMaskIntoConstraints = NO;
    
    //MARK: -> Header
    self.header = [[UIView alloc] init];
    self.header.backgroundColor = [UIColor setColorFromAssets:@"projectYellow"];
    
    [[self view] addSubview:self.header];
    
    self.header.translatesAutoresizingMaskIntoConstraints = NO;
    
    //MARK: -> Labels
    self.label = [[UILabel alloc] init];
    self.label.text = @"RSSchool Task 6";
    [self.view addSubview:self.label];
    self.label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
    
    self.phoneName = [[UILabel alloc] init];
    self.phoneName.text = [[UIDevice currentDevice] name];
    [self.view addSubview:self.phoneName];
    self.phoneName.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:17];
    
    self.model = [[UILabel alloc] init];
    self.model.text = [[UIDevice currentDevice] model];
    [self.view addSubview:self.model];
    self.model.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:17];
    
    self.system = [[UILabel alloc] init];
    self.system.text = [[NSString alloc] initWithFormat:@"%@ %@", [[UIDevice currentDevice] systemName], [[UIDevice currentDevice] systemVersion]];
    [self.view addSubview:self.system];
    self.system.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:17];
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
    
    [self.topView.bottomAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:-40.0 ].active = YES;
    [self.topView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.topView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.topView.topAnchor constraintEqualToAnchor:self.header.bottomAnchor].active = YES;
    
    [self.logo.centerYAnchor constraintEqualToAnchor:self.topView.centerYAnchor].active = YES;
    [self.logo.trailingAnchor constraintEqualToAnchor:self.topView.centerXAnchor constant: -50.0].active = YES;
    
    self.phoneName.translatesAutoresizingMaskIntoConstraints = NO;
    [self.phoneName.leadingAnchor constraintEqualToAnchor:self.logo.trailingAnchor constant:35].active = YES;
    [self.phoneName.centerYAnchor constraintEqualToAnchor:self.topView.centerYAnchor constant:-25.0].active = YES;
    
    self.model.translatesAutoresizingMaskIntoConstraints = NO;
    [self.model.leadingAnchor constraintEqualToAnchor:self.logo.trailingAnchor constant:35].active = YES;
    [self.model.centerYAnchor constraintEqualToAnchor:self.topView.centerYAnchor].active = YES;
    
    self.system.translatesAutoresizingMaskIntoConstraints = NO;
    [self.system.leadingAnchor constraintEqualToAnchor:self.logo.trailingAnchor constant:35].active = YES;
    [self.system.centerYAnchor constraintEqualToAnchor:self.topView.centerYAnchor constant:25.0].active = YES;
    
    
    [self.bottomView.topAnchor constraintEqualToAnchor:self.view.centerYAnchor constant: 35.0 ].active = YES;
    [self.bottomView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.bottomView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.bottomView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    
    [self.startButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.startButton.topAnchor constraintEqualToAnchor:self.bottomView.centerYAnchor constant: - 30].active = YES;
    
    [self.cvButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.cvButton.bottomAnchor constraintEqualToAnchor:self.bottomView.bottomAnchor constant: -5].active = YES;
    
}

- (void) buttonStartClick {
    NSURL* url = [[NSURL alloc] initWithString: @"https://podlesski.github.io/rsschool-cv/cv"];
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    NSLog(@"Done");
}

@end
