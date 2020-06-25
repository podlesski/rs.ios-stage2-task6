//
//  ViewController.m
//  RSSchool_T6
//
//  Created by Artemy Podlessky on 6/21/20.
//  Copyright © 2020 Artemy Podlessky. All rights reserved.
//

#import "StartVC.h"
#import "UIColor+ProjectColors.h"
#import "RSTapBarViewController.h"

@interface StartVC ()

@property (nonatomic, strong) UIStackView *stackView;
@property (nonatomic, strong) UIButton *startButton;
@property (nonatomic, strong) UILabel *startLabel;
@property (nonatomic, strong) RSTapBarViewController *configVC;

@property (nonatomic, strong) UIView *circle;
@property (nonatomic, strong) UIView *square;
@property (nonatomic, strong) UIView *triangle;

@end

@implementation StartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpViewForAnimations];
    [self setUpViewForAnimationsConstraints];
    
    [self setUpStackView];
    [self setUpStackViewConstraints];
    
    [self setUpStartButton];
    [self setUpStartButtonConstraints];
    
    [self setUpLabel];
    [self setUpLabelConstraints];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //MARK: -> Triangle Animation
    CABasicAnimation *triangleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    triangleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    triangleAnimation.fromValue = [NSNumber numberWithFloat:0];
    triangleAnimation.toValue = [NSNumber numberWithFloat:(360 * M_PI / 180.0f)];
    triangleAnimation.repeatCount = HUGE_VALF;
    triangleAnimation.duration = 3.0;
    triangleAnimation.removedOnCompletion = NO;
    [self.stackView.arrangedSubviews[2].layer addAnimation:triangleAnimation forKey:@"rotationAnimation"];
    
    //MARK: -> Square Animation
    CABasicAnimation *squareAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    squareAnimation.duration = 1.0;
    squareAnimation.repeatCount = HUGE_VALF;
    squareAnimation.autoreverses = YES;
    squareAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.stackView.arrangedSubviews[1].frame.origin.x + 35, self.stackView.arrangedSubviews[1].bounds.size.height/2 + 7)];
    squareAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.stackView.arrangedSubviews[1].frame.origin.x + 35, self.stackView.arrangedSubviews[1].bounds.size.height/2 - 7)];
    [self.stackView.arrangedSubviews[1].layer addAnimation:squareAnimation forKey:@"animatePosition"];
    
    //MARK: -> Circle Animation
    self.stackView.arrangedSubviews[0].transform = CGAffineTransformMakeScale(0.9, 0.9);
    [UIView animateKeyframesWithDuration:3.0 delay:0 options:(UIViewKeyframeAnimationOptionAutoreverse | UIViewKeyframeAnimationOptionRepeat) animations:^{
        self.stackView.arrangedSubviews[0].transform = CGAffineTransformMakeScale(1.1, 1.1);
    } completion:nil];
}

//MARK: -> Set Up View for Animations
- (void) setUpViewForAnimations {
    self.circle = [[UIView alloc] init];
    self.square = [[UIView alloc] init];
    self.triangle = [[UIView alloc] init];
    [self.view addSubview: self.circle];
    [self.view addSubview: self.square];
    [self.view addSubview: self.triangle];
    
    //Circle
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    [circleLayer setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 70, 70)] CGPath]];
    circleLayer.fillColor = [[UIColor setColorFromAssets: @"projectRed"] CGColor];
    [self.circle layer].mask = circleLayer;
    [[self.circle layer] addSublayer:circleLayer];
    
    //Square
    CAShapeLayer *squareLayer = [CAShapeLayer layer];
    [squareLayer setPath:[[UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 70, 70)] CGPath]];
    squareLayer.fillColor = [[UIColor setColorFromAssets: @"projectBlue"] CGColor];
    [[self.square layer] addSublayer:squareLayer];
    
    //Triangle
    CAShapeLayer *triangleLayer = [CAShapeLayer layer];
    UIBezierPath *trianglePath = [UIBezierPath bezierPath];
    [trianglePath moveToPoint: CGPointMake(35, 0)];
    [trianglePath addLineToPoint: CGPointMake(70, 60.6)];
    [trianglePath addLineToPoint: CGPointMake(0, 60.6)];
    [triangleLayer setPath:[trianglePath CGPath]];
    triangleLayer.fillColor = [[UIColor setColorFromAssets: @"projectGreen"] CGColor];
    [[self.triangle layer] addSublayer:triangleLayer];
}

- (void) setUpViewForAnimationsConstraints {
    self.circle.translatesAutoresizingMaskIntoConstraints = NO;
    self.square.translatesAutoresizingMaskIntoConstraints = NO;
    self.triangle.translatesAutoresizingMaskIntoConstraints = NO;
    [self.circle.heightAnchor constraintEqualToConstant:70.0].active = YES;
    [self.circle.widthAnchor constraintEqualToConstant:70.0].active = YES;
    [self.square.heightAnchor constraintEqualToConstant:70.0].active = YES;
    [self.square.widthAnchor constraintEqualToConstant:70.0].active = YES;
    [self.triangle.heightAnchor constraintEqualToConstant:70.0].active = YES;
    [self.triangle.widthAnchor constraintEqualToConstant:70.0].active = YES;
}

//MARK: -> Set Up StackView
- (void) setUpStackView {
    self.stackView = [[UIStackView alloc] init];
    [self.stackView addArrangedSubview:self.circle];
    [self.stackView addArrangedSubview:self.square];
    [self.stackView addArrangedSubview:self.triangle];
    [self.stackView setDistribution:UIStackViewDistributionEqualCentering];
    [self.view addSubview:self.stackView];
}

- (void) setUpStackViewConstraints {
    self.stackView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.stackView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    [self.stackView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant: 35].active = YES;
    [self.stackView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant: -35].active = YES;
}

//MARK: -> Set Up Label
- (void) setUpLabel {
    self.startLabel = [[UILabel alloc] init];
    self.startLabel.text = @"Are you ready?";
    self.startLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:24];
    [self.view addSubview:self.startLabel];
}

- (void) setUpLabelConstraints {
    self.startLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.startLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.startLabel.bottomAnchor constraintEqualToAnchor:self.stackView.topAnchor constant: -100].active = YES;
}

//MARK: -> Set Up Button
- (void) setUpStartButton {
    self.startButton = [[UIButton alloc] init];
    self.startButton.layer.cornerRadius = 25;
    [self.startButton setTitle: @"START" forState:UIControlStateNormal];
    [self.startButton setTitleColor: [UIColor setColorFromAssets: @"projectBlack"] forState:UIControlStateNormal];
    self.startButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:20];
    self.startButton.backgroundColor = [UIColor setColorFromAssets: @"projectYellow"];
    [self.view addSubview:self.startButton];
    [self.startButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void) setUpStartButtonConstraints {
    self.startButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.startButton.heightAnchor constraintEqualToConstant:55.5].active = YES;
    [self.startButton.widthAnchor constraintEqualToConstant:250].active = YES;
    [self.startButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.startButton.topAnchor constraintEqualToAnchor:self.stackView.bottomAnchor constant: 100].active = YES;
}

//MARK: -> Actions
- (void) buttonClick {
    self.configVC = [[RSTapBarViewController alloc] init];
    [self.navigationController pushViewController:self.configVC animated:YES];
    [[self view] addSubview:self.configVC.view];
}

@end
