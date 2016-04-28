//
//  Images.h
//  Hi-Wallpaper
//
//  Created by tuanhi on 4/28/16.
//  Copyright © 2016 tuanvu2605. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Images : NSObject

@property (nonatomic ,strong) NSString *imgID;
@property (nonatomic ,strong) NSString *category;
@property (nonatomic ,strong) NSString *link;
@property (nonatomic ,strong) NSString *color;
@property (nonatomic ,strong) NSString *rank;
@property (nonatomic ,strong) NSString *tag;


-(instancetype)initWithJsonDict:(NSDictionary*)dict;

@end
