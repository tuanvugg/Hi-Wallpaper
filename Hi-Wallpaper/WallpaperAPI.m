//
//  WallpaperAPI.m
//  Hi-Wallpaper
//
//  Created by tuanhi on 4/28/16.
//  Copyright © 2016 tuanvu2605. All rights reserved.
//

#import "WallpaperAPI.h"

@implementation WallpaperAPI

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static WallpaperAPI *sharedInstance;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[WallpaperAPI alloc]init];
    });
    
    return sharedInstance;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        _configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _httpSessionManager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:_configuration];
    }

    return self;
}

-(void)listImagesCompletionBlock:(void(^)(NSArray *images))completion;
{
    
   NSString *linkImages = @"http://localhost:9090/list";
    
    NSURLSessionDataTask *dataTask = [_httpSessionManager GET:linkImages parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//        NSLog(@"%@",responseObject);
        completion(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"ERROR %@",error);
    }];
    [dataTask resume];

}
-(void)listImages
{
    
    NSString *linkImages = @"http://localhost:9090/list";
    
    NSURLSessionDataTask *dataTask = [_httpSessionManager GET:linkImages
                                                   parameters:nil
                                                      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"ERROR %@",error);
    }];
    [dataTask resume];
    
}

@end
