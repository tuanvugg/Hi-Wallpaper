//
//  WallpaperAPI.h
//  Hi-Wallpaper
//
//  Created by tuanhi on 4/28/16.
//  Copyright © 2016 tuanvu2605. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

#define sWallpaperAPI [WallpaperAPI sharedInstance]

@interface WallpaperAPI : NSObject
@property NSURLSessionConfiguration *configuration;
@property AFHTTPSessionManager *httpSessionManager;

+ (instancetype)sharedInstance;
-(void)listImages;
-(void)listImagesCompletionBlock:(void(^)(NSArray *images))completion;

@end
