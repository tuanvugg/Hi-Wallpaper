//
//  CarouselController.m
//  Hi-Wallpaper
//
//  Created by tuanhi on 4/29/16.
//  Copyright © 2016 tuanvu2605. All rights reserved.
//

#import "CarouselController.h"
#import <iCarousel/iCarousel.h>
#import <FontAwesomeKit/FontAwesomeKit.h>
#define kTAG_CellImage   1009

@interface CarouselController ()<iCarouselDataSource,iCarouselDelegate>
@property (weak, nonatomic) IBOutlet iCarousel *carousel;
@property (weak, nonatomic) IBOutlet UIView *viewButton;
@property (weak, nonatomic) IBOutlet UIButton *btnDimiss;
@property (weak, nonatomic) IBOutlet UIButton *btnGetImage;
@property (weak, nonatomic) IBOutlet UIButton *btnShare;
@property (weak, nonatomic) IBOutlet UIButton *btnMore;
@property (weak, nonatomic) IBOutlet UIButton *btnView;

@end

@implementation CarouselController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupImageForButton];
    


    
    _displayArray = [[NSMutableArray alloc]init];
    _displayArray = [NSMutableArray arrayWithObjects:@"a.jpg",@"a.jpg",@"a.jpg",@"a.jpg",@"a.jpg",@"a.jpg", nil];
    
    self.carousel.delegate = self;
    self.carousel.dataSource = self;
    self.carousel.type = iCarouselTypeLinear;
    [self.carousel reloadData];

    
    [self.view addSubview:_carousel];
    [self.view addSubview:_viewButton];
    [self.view insertSubview:_viewButton aboveSubview:_carousel];

    

    

    // Do any additional setup after loading the view.
}



-(void)setupImageForButton
{
    FAKFoundationIcons *dimissIcon = [FAKFoundationIcons arrowsCompressIconWithSize:30];
    UIImage *dimissImg= [dimissIcon imageWithSize:CGSizeMake(30,30)];
    [_btnDimiss setImage:dimissImg forState:UIControlStateNormal];
    _btnDimiss.tintColor = [UIColor redColor];
    
    FAKFoundationIcons *eyeIcon = [FAKFoundationIcons eyeIconWithSize:30];
    UIImage *eyeImg= [eyeIcon imageWithSize:CGSizeMake(30,30)];
    [_btnView setImage:eyeImg forState:UIControlStateNormal];
    _btnView.tintColor = [UIColor redColor];
    
    FAKFoundationIcons *getIcon = [FAKFoundationIcons downloadIconWithSize:30];
    UIImage *getImg= [getIcon imageWithSize:CGSizeMake(30,30)];
    [_btnGetImage setImage:getImg forState:UIControlStateNormal];
    _btnGetImage.tintColor = [UIColor redColor];
    
    FAKFoundationIcons *shareIcon = [FAKFoundationIcons socialSkillshareIconWithSize:30];
    UIImage *shareImg= [shareIcon imageWithSize:CGSizeMake(30,30)];
    [_btnShare setImage:shareImg forState:UIControlStateNormal];
    _btnShare.tintColor = [UIColor redColor];
    
    FAKFoundationIcons *moreIcon = [FAKFoundationIcons bookmarkIconWithSize:30];
    UIImage *moreImg= [moreIcon imageWithSize:CGSizeMake(30,30)];
    [_btnMore setImage:moreImg forState:UIControlStateNormal];
    _btnMore.tintColor = [UIColor redColor];
    
    
    
    
}

- (IBAction)btnDimissDidTap:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnViewDidTap:(id)sender {
}


- (IBAction)btnGetImageDidTap:(id)sender {
}


- (IBAction)btnShareDidTap:(id)sender {
}


- (IBAction)btnMoreDidTap:(id)sender {
}



- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index;
{
    
    [self.carousel reloadData];
    

}


- (void)carouselCurrentItemIndexDidChange:(__unused iCarousel *)carousel
{

    
}

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 6;
}




- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view
{
    
    UIImageView *itemView;
    
    if (view == nil)
    {
        view = [[UIView alloc] initWithFrame:self.view.frame];
        
        
        itemView = [[UIImageView alloc]initWithFrame:view.frame];
        itemView.contentMode = UIViewContentModeScaleToFill;
        itemView.contentMode = UIViewContentModeScaleAspectFill;
        itemView.tag = kTAG_CellImage;
        
        [view addSubview:itemView];
        view.clipsToBounds = YES;
    }
    else
    {
        itemView = (UIImageView*) [view viewWithTag:kTAG_CellImage];
    }
    
    itemView.image = [UIImage imageNamed:[_displayArray objectAtIndex:index]];
    
    
    
    return itemView;
    
}
-(void)configIcarouselView
{
    _carousel.ignorePerpendicularSwipes = YES;
    _carousel.centerItemWhenSelected = YES;
    _carousel.decelerationRate = 0.5f;
}

#pragma mark Icaroues DataSource

- (NSInteger)numberOfPlaceholdersInCarousel:(__unused iCarousel *)carousel
{
    //note: placeholder views are only displayed on some carousels if wrapping is disabled
    return 0;
}

- (UIView *)carousel:(__unused iCarousel *)carousel placeholderViewAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    UILabel *label = nil;
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        //don't do anything specific to the index within
        //this `if (view == nil) {...}` statement because the view will be
        //recycled and used with other index values later
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200.0f, 200.0f)];
        ((UIImageView *)view).image = [UIImage imageNamed:@"page.png"];
        view.contentMode = UIViewContentModeCenter;
        
        label = [[UILabel alloc] initWithFrame:view.bounds];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [label.font fontWithSize:50.0f];
        label.tag = 1;
        [view addSubview:label];
    }
    else
    {
        //get a reference to the label in the recycled view
        label = (UILabel *)[view viewWithTag:1];
    }
    
    //set item label
    //remember to always set any properties of your carousel item
    //views outside of the `if (view == nil) {...}` check otherwise
    //you'll get weird issues with carousel item content appearing
    //in the wrong place in the carousel
    //    label.text = (index == 0)? @"[": @"]";
    
    return view;
}

- (CATransform3D)carousel:(__unused iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform
{
    //implement 'flip3D' style carousel
    transform = CATransform3DRotate(transform, M_PI / 8.0f, 0.0f, 1.0f, 0.0f);
    return CATransform3DTranslate(transform, 0.0f, 0.0f, offset * self.carousel.itemWidth);
}

- (CGFloat)carousel:(__unused iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    //customize carousel display
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            //normally you would hard-code this to YES or NO
            return NO;
        }
        case iCarouselOptionSpacing:
        {
            //add a bit of spacing between the item views
            return value * 1.0f;
        }
        case iCarouselOptionFadeMax:
        {
            if (self.carousel.type == iCarouselTypeCustom)
            {
                //set opacity based on distance from camera
                return 0.0f;
            }
            return value;
        }
        case iCarouselOptionShowBackfaces:
        {
            return 0.0f;
        }
        case iCarouselOptionRadius:
        case iCarouselOptionAngle:
        case iCarouselOptionArc:
        case iCarouselOptionTilt:
        case iCarouselOptionCount:
        case iCarouselOptionFadeMin:
        case iCarouselOptionFadeMinAlpha:
        case iCarouselOptionFadeRange:
        case iCarouselOptionOffsetMultiplier:
            //        {
            //            return 0.0f;
            //        }
        case iCarouselOptionVisibleItems:
        {
            return value;
        }
    }
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
