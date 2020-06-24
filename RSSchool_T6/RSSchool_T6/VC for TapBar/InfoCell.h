//
//  InfoCell.h
//  RSSchool_T6
//
//  Created by Artemy Podlessky on 6/23/20.
//  Copyright © 2020 Artemy Podlessky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InfoCell : UITableViewCell

@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *info;
@property (nonatomic, strong) UIImageView *type;
@property (nonatomic, strong) UIImageView *screenshot;

@end

NS_ASSUME_NONNULL_END
