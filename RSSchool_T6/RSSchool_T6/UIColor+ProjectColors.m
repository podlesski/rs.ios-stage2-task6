//
//  UIColor+ProjectColors.m
//  RSSchool_T6
//
//  Created by Artemy Podlessky on 6/21/20.
//  Copyright © 2020 Artemy Podlessky. All rights reserved.
//

#import "UIColor+ProjectColors.h"

#import <UIKit/UIKit.h>


@implementation UIColor (ProjectColors)

+ (UIColor *)setColorFromAssets:(NSString *)nameColor {
    
    UIColor *finalColor = UIColor.clearColor;
    
    if ([nameColor  isEqual: @"projectBlack"]) {
        finalColor = [UIColor colorFromHexString: @"#101010"];
    }
    
    if ([nameColor  isEqual: @"projectBlue"]) {
        finalColor = [UIColor colorFromHexString: @"#29C2D1"];
    }
    
    if ([nameColor  isEqual: @"projectGray"]) {
        finalColor = [UIColor colorFromHexString: @"#707070"];
    }
    
    if ([nameColor  isEqual: @"projectGreen"]) {
        finalColor = [UIColor colorFromHexString: @"#34C1A1"];
    }
    
    if ([nameColor  isEqual: @"projectRed"]) {
        finalColor = [UIColor colorFromHexString: @"#EE686A"];
    }
    
    if ([nameColor  isEqual: @"projectWhite"]) {
        finalColor = [UIColor colorFromHexString: @"#FFFFFF"];
    }
    
    if ([nameColor  isEqual: @"projectYellow"]) {
        finalColor = [UIColor colorFromHexString: @"#F9CC78"];
    }
    
    if ([nameColor  isEqual: @"projectYellowHighlighted"]) {
        finalColor = [UIColor colorFromHexString: @"#FDF4E3"];
    }
    
    
    return finalColor;
}

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1];
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

@end
