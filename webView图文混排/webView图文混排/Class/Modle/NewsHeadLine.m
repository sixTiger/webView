//
//  NewsHeadLine.m
//  webView图文混排
//
//  Created by 杨小兵 on 15/4/13.
//  Copyright (c) 2015年 xiaoxiaobing. All rights reserved.
//

#import "NewsHeadLine.h"

@implementation NewsHeadLine

+ (instancetype)headlineWithDict:(NSDictionary *)dict
{
    NewsHeadLine *headline = [[self alloc] init];
    headline.docid = dict[@"docid"];
    headline.title = dict[@"title"];
    headline.digest = dict[@"digest"];
    headline.imgsrc = dict[@"imgsrc"];
    return headline;
}
@end
