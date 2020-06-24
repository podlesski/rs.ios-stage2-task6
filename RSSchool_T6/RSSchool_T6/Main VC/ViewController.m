//
//  ViewController.m
//  RSSchool_T6
//
//  Created by Artemy Podlessky on 6/21/20.
//  Copyright © 2020 Artemy Podlessky. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+ProjectColors.h"
#import "RSTapBarViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIStackView *stackView;
@property (nonatomic, strong) UIButton *startButton;
@property (nonatomic, strong) UILabel *startLabel;
@property (nonatomic, strong) RSTapBarViewController *configVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //MARK: -> Button
    self.startButton = [[UIButton alloc] init];
    self.startButton.layer.cornerRadius = 25;
    [self.startButton setTitle: @"START" forState:UIControlStateNormal];
    [self.startButton setTitleColor: [UIColor setColorFromAssets: @"projectBlack"] forState:UIControlStateNormal];
    self.startButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:20];
    self.startButton.backgroundColor = [UIColor setColorFromAssets: @"projectYellow"];
    
    [self.view addSubview:self.startButton];
    
    [self.startButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    //MARK: -> Label
    self.startLabel = [[UILabel alloc] init];
    self.startLabel.text = @"Are you ready?";
    self.startLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:24];
    
    [self.view addSubview:self.startLabel];
    
    //MARK: -> Add views for StackView
    UIView *circle = [[UIView alloc] init];
    UIView *square = [[UIView alloc] init];
    UIView *triangle = [[UIView alloc] init];
    [self.view addSubview: circle];
    [self.view addSubview: square];
    [self.view addSubview: triangle];
    
    //MARK: -> Circle
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    [circleLayer setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 70, 70)] CGPath]];
    circleLayer.fillColor = [[UIColor setColorFromAssets: @"projectRed"] CGColor];
    
    [circle layer].mask = circleLayer;
    [[circle layer] addSublayer:circleLayer];
    
    //MARK: -> Square
    CAShapeLayer *squareLayer = [CAShapeLayer layer];
    [squareLayer setPath:[[UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 70, 70)] CGPath]];
    squareLayer.fillColor = [[UIColor setColorFromAssets: @"projectBlue"] CGColor];
    
    [[square layer] addSublayer:squareLayer];
    
    //MARK: -> Triangle
    CAShapeLayer *triangleLayer = [CAShapeLayer layer];
    UIBezierPath *trianglePath = [UIBezierPath bezierPath];
    [trianglePath moveToPoint: CGPointMake(35, 0)];
    [trianglePath addLineToPoint: CGPointMake(70, 60.6)];
    [trianglePath addLineToPoint: CGPointMake(0, 60.6)];
    [triangleLayer setPath:[trianglePath CGPath]];
    triangleLayer.fillColor = [[UIColor setColorFromAssets: @"projectGreen"] CGColor];
    
    [[triangle layer] addSublayer:triangleLayer];
    
    
    //MARK: -> StackView
    self.stackView = [[UIStackView alloc] init];
    [self.stackView addArrangedSubview:circle];
    [self.stackView addArrangedSubview:square];
    [self.stackView addArrangedSubview:triangle];
    [self.stackView setDistribution:UIStackViewDistributionEqualCentering];
    
    [self.view addSubview:self.stackView];
    
    
    
    //MARK: -> Constant Constraint
    self.stackView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.startLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.startButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.startButton.heightAnchor constraintEqualToConstant:55.5].active = YES;
    [self.startButton.widthAnchor constraintEqualToConstant:250].active = YES;
    
    circle.translatesAutoresizingMaskIntoConstraints = NO;
    square.translatesAutoresizingMaskIntoConstraints = NO;
    triangle.translatesAutoresizingMaskIntoConstraints = NO;
    
    [circle.heightAnchor constraintEqualToConstant:70.0].active = YES;
    [circle.widthAnchor constraintEqualToConstant:70.0].active = YES;
    [square.heightAnchor constraintEqualToConstant:70.0].active = YES;
    [square.widthAnchor constraintEqualToConstant:70.0].active = YES;
    [triangle.heightAnchor constraintEqualToConstant:70.0].active = YES;
    [triangle.widthAnchor constraintEqualToConstant:70.0].active = YES;
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    [self.startLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.startLabel.bottomAnchor constraintEqualToAnchor:self.stackView.topAnchor constant: -100].active = YES;
    
    [self.startButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.startButton.topAnchor constraintEqualToAnchor:self.stackView.bottomAnchor constant: 100].active = YES;
    
    [self.stackView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    [self.stackView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant: 35].active = YES;
    [self.stackView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant: -35].active = YES;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //Add triangle animation
    CABasicAnimation *triangleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    triangleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    triangleAnimation.fromValue = [NSNumber numberWithFloat:0];
    triangleAnimation.toValue = [NSNumber numberWithFloat:(360 * M_PI / 180.0f)];
    triangleAnimation.repeatCount = HUGE_VALF;
    triangleAnimation.duration = 3.0;
    triangleAnimation.removedOnCompletion = NO;

    [self.stackView.arrangedSubviews[2].layer addAnimation:triangleAnimation forKey:@"rotationAnimation"];
    
    //Add square animation
    CABasicAnimation *squareAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    squareAnimation.duration = 1.0;
    squareAnimation.repeatCount = HUGE_VALF;
    squareAnimation.autoreverses = YES;
    squareAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.stackView.arrangedSubviews[1].frame.origin.x + 35, self.stackView.arrangedSubviews[1].bounds.size.height/2 + 7)];
    squareAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.stackView.arrangedSubviews[1].frame.origin.x + 35, self.stackView.arrangedSubviews[1].bounds.size.height/2 - 7)];
    [self.stackView.arrangedSubviews[1].layer addAnimation:squareAnimation forKey:@"animatePosition"];
    
    //Add circle animation
    self.stackView.arrangedSubviews[0].transform = CGAffineTransformMakeScale(0.9, 0.9);

    [UIView animateKeyframesWithDuration:3.0 delay:0 options:(UIViewKeyframeAnimationOptionAutoreverse | UIViewKeyframeAnimationOptionRepeat) animations:^{
        
        self.stackView.arrangedSubviews[0].transform = CGAffineTransformMakeScale(1.1, 1.1);
    } completion:nil];
    
}

- (void) buttonClick {
    self.configVC = [[RSTapBarViewController alloc] init];
//    [self addChildViewController:self.configVC];
    [self.navigationController pushViewController:self.configVC animated:YES];
    [[self view] addSubview:self.configVC.view];
//    [self didMoveToParentViewController:self];
    NSLog(@"Done");
}

@end
