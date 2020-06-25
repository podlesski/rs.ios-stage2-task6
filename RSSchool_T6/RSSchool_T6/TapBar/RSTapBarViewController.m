//
//  RSTapBarViewController.m
//  RSSchool_T6
//
//  Created by Artemy Podlessky on 6/22/20.
//  Copyright © 2020 Artemy Podlessky. All rights reserved.
//

#import "RSTapBarViewController.h"
#import "UIColor+ProjectColors.h"

@interface RSTapBarViewController ()


@end

@implementation RSTapBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //MARK: -> Add VC for Items
    InfoViewController *infoVC = [InfoViewController new];
    GalleryViewController *galleryVC = [GalleryViewController new];
    GitCVViewController *gitVC = [GitCVViewController new];
    
    NSArray *tabViewControllers = @[infoVC, galleryVC, gitVC];
    
    //MARK: -> Set Up Tab Bar Items
    //1
    infoVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"info_unselected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:0];
    infoVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"info_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    infoVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    //2
    galleryVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"gallery_unselected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:1];
    galleryVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"gallery_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    galleryVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    //3
    gitVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"home_unselected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:2];
    gitVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    gitVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    
    [self setViewControllers:tabViewControllers];
}

@end
