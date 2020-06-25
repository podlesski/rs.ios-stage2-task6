//
//  FileDetailsViewController.h
//  RSSchool_T6
//
//  Created by Artemy Podlessky on 6/25/20.
//  Copyright © 2020 Artemy Podlessky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN

@interface FileDetailsViewController : UIViewController

@property (nonatomic, strong) UIImageView *screenshot;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *createDate;
@property (nonatomic, strong) UILabel *modificationDate;
@property (nonatomic, strong) UILabel *type;
@property (nonatomic, strong) UIImage *someData;

@end

NS_ASSUME_NONNULL_END
