//
//  NewsDetailImg.m
//  webView图文混排
//
//  Created by 杨小兵 on 15/4/13.
//  Copyright (c) 2015年 xiaoxiaobing. All rights reserved.
//

#import "NewsDetailImg.h"

@implementation NewsDetailImg

+ (instancetype)detailImgWithDict:(NSDictionary *)dict
{
    NewsDetailImg *img = [[self alloc] init];
    img.pixel = dict[@"pixel"];
    img.src = dict[@"src"];
    img.ref = dict[@"ref"];
    return img;
}
@end
