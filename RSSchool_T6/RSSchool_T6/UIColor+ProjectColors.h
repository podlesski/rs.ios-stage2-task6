//
//  UIColor+ProjectColors.h
//  RSSchool_T6
//
//  Created by Artemy Podlessky on 6/21/20.
//  Copyright © 2020 Artemy Podlessky. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (ProjectColors)

+ (UIColor *)setColorFromAssets:(NSString *)nameColor;

+ (UIColor *)colorFromHexString:(NSString *)hexString;

@end

NS_ASSUME_NONNULL_END
