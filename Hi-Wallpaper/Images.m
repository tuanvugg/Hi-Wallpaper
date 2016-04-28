//
//  Images.m
//  Hi-Wallpaper
//
//  Created by tuanhi on 4/28/16.
//  Copyright © 2016 tuanvu2605. All rights reserved.
//

#import "Images.h"

@implementation Images

-(instancetype)initWithJsonDict:(NSDictionary*)dict;
{
    if (self) {
        _imgID = dict[@"_id"];
        if ([dict[@"_id"] isKindOfClass:[NSNull class]]) {
            _imgID = @"";
        }
        _link = dict[@"link"];
        if ([dict[@"link"] isKindOfClass:[NSNull class]]) {
            _link = @"";
        }
        _category = dict[@"category"];
        if ([dict[@"_id"] isKindOfClass:[NSNull class]]) {
            _imgID = @"";
        }
        _color = dict[@"color"];
        if ([dict[@"category"] isKindOfClass:[NSNull class]]) {
            _category = @"";
        }
        _rank = dict[@"rank"];
        if ([dict[@"rank"] isKindOfClass:[NSNull class]]) {
            _rank = @"";
        }
        _tag = dict[@"tag"];
        if ([dict[@"tag"] isKindOfClass:[NSNull class]]) {
            _tag = @"";
        }
        
    }
    
    return self;
}



@end
