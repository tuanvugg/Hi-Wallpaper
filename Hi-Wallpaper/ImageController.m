//
//  ImageController.m
//  Hi-Wallpaper
//
//  Created by tuanhi on 4/28/16.
//  Copyright © 2016 tuanvu2605. All rights reserved.
//

#import "ImageController.h"
#import "Images.h"
#import "WallpaperAPI.h"
#import "ImageCell.h"
#import "CarouselController.h"
#import <KRLCollectionViewGridLayout/KRLCollectionViewGridLayout.h>

@interface ImageController ()
{
    KRLCollectionViewGridLayout *layout;
}
@property (nonatomic,strong) NSMutableArray *images;
@property (nonatomic,strong) NSMutableArray *displayArray;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLayoutCollectionView];
    // Do any additional setup after loading the view.
}
-(void)loadImages
{
    [sWallpaperAPI listImagesCompletionBlock:^(NSArray *images) {
        NSLog(@"%@",images[0][@"link"]);
        for (int i = 0 ; i< images.count; i++) {
            Images *img =[[Images alloc]initWithJsonDict:images[i]];
            NSLog(@"%@",img.link);
            [_images addObject:img];
        }
    }];
    
}
-(void)setupLayoutCollectionView
{
    static NSString *cellID = @"ImageCell";
    [self.collectionView registerNib:[UINib nibWithNibName:@"ImageCell" bundle:nil] forCellWithReuseIdentifier:cellID];
    layout = [[KRLCollectionViewGridLayout alloc]init];
    _collectionView.collectionViewLayout = layout;
    layout.numberOfItemsPerLine =3;
    layout.aspectRatio = 9.0/16.0;
    layout.lineSpacing = 1;
    layout.interitemSpacing = 1;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _collectionView.backgroundColor = [UIColor whiteColor];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    
    return 100;
    
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellID = @"ImageCell";
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.imgView.image = [UIImage imageNamed:@"a.jpg"];
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
{
    CarouselController *carouselController = [self.storyboard instantiateViewControllerWithIdentifier:@"CarouselController"];
    [self presentViewController:carouselController animated:YES completion:nil];
    
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
