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
        self.screenshot = [[UIImageView alloc] init];
        self.name = [[UILabel alloc] init];
        self.type = [[UIImageView alloc] init];
        self.info = [[UILabel alloc] init];
        
        [self addSubview:self.screenshot];
        [self addSubview:self.name];
        [self addSubview:self.type];
        [self addSubview:self.info];
           
        self.name.translatesAutoresizingMaskIntoConstraints = NO;
        self.screenshot.translatesAutoresizingMaskIntoConstraints = NO;
        self.type.translatesAutoresizingMaskIntoConstraints = NO;
        self.info.translatesAutoresizingMaskIntoConstraints = NO;
           
        [NSLayoutConstraint activateConstraints: @[
            [self.screenshot.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:5.0],
            [self.screenshot.topAnchor constraintEqualToAnchor:self.topAnchor constant:5.0],
            [self.screenshot.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-5.0],
            [self.screenshot.widthAnchor constraintEqualToAnchor:self.screenshot.heightAnchor],
               
            [self.name.leadingAnchor constraintEqualToAnchor:self.screenshot.trailingAnchor constant:15.0],
            [self.name.topAnchor constraintEqualToAnchor:self.topAnchor constant:35.0],
            [self.name.trailingAnchor constraintLessThanOrEqualToAnchor:self.trailingAnchor constant:-10.0],
               
            [self.type.leadingAnchor constraintEqualToAnchor:self.screenshot.trailingAnchor constant:15.0],
            [self.type.topAnchor constraintEqualToAnchor:self.name.bottomAnchor constant:15.0],
            [self.type.widthAnchor constraintEqualToAnchor:self.type.heightAnchor],
               
            [self.info.leadingAnchor constraintEqualToAnchor:self.type.trailingAnchor constant:5.0],
            [self.info.centerYAnchor constraintEqualToAnchor:self.type.centerYAnchor]]];
        
        self.selectedBackgroundView = [[UIView alloc] init];
        self.selectedBackgroundView.backgroundColor = [UIColor setColorFromAssets:@"projectYellowHighlighted"];

    }
    
    return self;
}



- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
