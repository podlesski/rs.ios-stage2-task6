//
//  InfoCell.m
//  RSSchool_T6
//
//  Created by Artemy Podlessky on 6/23/20.
//  Copyright © 2020 Artemy Podlessky. All rights reserved.
//

#import "InfoCell.h"
#import "UIColor+ProjectColors.h"

@implementation InfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpScreenshot];
        [self setUpScreenshotConstraints];
        
        [self setUpName];
        [self setUpNameConstraints];
        
        [self setUpType];
        [self setUpTypeConstraints];
        
        [self setUpInfo];
        [self setUpInfoConstraints];
        
        self.selectedBackgroundView = [[UIView alloc] init];
        self.selectedBackgroundView.backgroundColor = [UIColor setColorFromAssets:@"projectYellowHighlighted"];
    }
    return self;
}

//MARK: -> Set Up Info
- (void) setUpInfo {
    self.info = [[UILabel alloc] init];
    [self addSubview:self.info];
}

- (void) setUpInfoConstraints {
    self.info.translatesAutoresizingMaskIntoConstraints = NO;
    [self.info.leadingAnchor constraintEqualToAnchor:self.type.trailingAnchor constant:5.0].active = YES;
    [self.info.centerYAnchor constraintEqualToAnchor:self.type.centerYAnchor].active = YES;
}

//MARK: -> Set Up Type
- (void) setUpType {
    self.type = [[UIImageView alloc] init];
    [self addSubview:self.type];
}

- (void) setUpTypeConstraints {
    self.type.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints: @[
    [self.type.leadingAnchor constraintEqualToAnchor:self.screenshot.trailingAnchor constant:15.0],
    [self.type.topAnchor constraintEqualToAnchor:self.name.bottomAnchor constant:15.0],
    [self.type.widthAnchor constraintEqualToAnchor:self.type.heightAnchor]]];
}

//MARK: -> Set Up Name
- (void) setUpName {
    self.name = [[UILabel alloc] init];
    [self addSubview:self.name];
}

- (void) setUpNameConstraints {
    self.name.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints: @[
    [self.name.leadingAnchor constraintEqualToAnchor:self.screenshot.trailingAnchor constant:15.0],
    [self.name.topAnchor constraintEqualToAnchor:self.topAnchor constant:35.0],
    [self.name.trailingAnchor constraintLessThanOrEqualToAnchor:self.trailingAnchor constant:-10.0]]];
}

//MARK: -> Set Up Screenshot
- (void) setUpScreenshot {
    self.screenshot = [[UIImageView alloc] init];
    [self addSubview:self.screenshot];
}

- (void) setUpScreenshotConstraints {
    self.screenshot.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints: @[
    [self.screenshot.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:5.0],
    [self.screenshot.topAnchor constraintEqualToAnchor:self.topAnchor constant:5.0],
    [self.screenshot.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-5.0],
    [self.screenshot.widthAnchor constraintEqualToAnchor:self.screenshot.heightAnchor]]];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
