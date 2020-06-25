//
//  GalleryCell.m
//  RSSchool_T6
//
//  Created by Artemy Podlessky on 6/24/20.
//  Copyright © 2020 Artemy Podlessky. All rights reserved.
//

#import "GalleryCell.h"
#import "UIColor+ProjectColors.h"

@implementation GalleryCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.screenshot = [[UIImageView alloc] init];
        [self addSubview:self.screenshot];
        
        self.screenshot.translatesAutoresizingMaskIntoConstraints = NO;
        
        [NSLayoutConstraint activateConstraints: @[
        [self.screenshot.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [self.screenshot.topAnchor constraintEqualToAnchor:self.topAnchor],
        [self.screenshot.bottomAnchor constraintEqualToAnchor:self.bottomAnchor],
        [self.screenshot.trailingAnchor constraintEqualToAnchor:self.trailingAnchor]]];
        
        self.selectedBackgroundView = [[UIView alloc] init];
        self.selectedBackgroundView.backgroundColor = [UIColor setColorFromAssets:@"projectYellowHighlighted"];
    }
    return self;
}

@end
