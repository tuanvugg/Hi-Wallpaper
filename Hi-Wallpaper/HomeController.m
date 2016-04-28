//
//  HomeController.m
//  Hi-Wallpaper
//
//  Created by tuanhi on 4/28/16.
//  Copyright © 2016 tuanvu2605. All rights reserved.
//

#import "HomeController.h"
#import "WallpaperAPI.h"
#import <FontAwesomeKit/FontAwesomeKit.h>
#import "Images.h"
#import "ImageController.h"


@interface HomeController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>

@property (nonatomic,strong) UIPageViewController *pageViewController;
@property (nonatomic,strong) ImageController *imageController;

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationbarItem];
    _pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"pageViewController"];
    _pageViewController.dataSource = self;
    _pageViewController.delegate = self;
    
    _imageController = [self.storyboard instantiateViewControllerWithIdentifier:@"ImageController"];

    
    

    NSArray *vc = @[_imageController];
    [_pageViewController setViewControllers:vc direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    //    self.pageViewController.view.frame = CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height - 50.0f);
    self.pageViewController.view.frame = self.view.frame;
    [self.view addSubview:_pageViewController.view];
    [self addChildViewController:_pageViewController];
    [_pageViewController didMoveToParentViewController:self];
     // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    self.automaticallyAdjustsScrollViewInsets = NO;
}

-(void)setupNavigationbarItem
{
    FAKFoundationIcons *listIcon = [FAKFoundationIcons listIconWithSize:20.0f];
    
    UIImage *listImg = [listIcon imageWithSize:CGSizeMake(20, 20)];
    
    
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:listImg style:UIBarButtonItemStylePlain target:self action:@selector(btnMenuDidTap)];
    
    self.navigationItem.leftBarButtonItem = leftItem;
}

-(void)btnMenuDidTap
{

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    
    return nil;
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    return nil;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
