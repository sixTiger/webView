//
//  NewsDetail.m
//  webView图文混排
//
//  Created by 杨小兵 on 15/4/13.
//  Copyright (c) 2015年 xiaoxiaobing. All rights reserved.
//

#import "NewsDetail.h"
#import "NewsDetailImg.h"

@implementation NewsDetail

+ (instancetype)detailWithDict:(NSDictionary *)dict
{
    NewsDetail *detail = [[self alloc] init];
    detail.title = dict[@"title"];
    detail.ptime = dict[@"ptime"];
    detail.body = dict[@"body"];
    
    // 图片模型数组
    NSArray *imgDictArray = dict[@"img"];
    NSMutableArray *imgModelArray = [NSMutableArray array];
    for (NSDictionary *imgDict in imgDictArray) {
        NewsDetailImg *imgModel = [NewsDetailImg detailImgWithDict:imgDict];
        [imgModelArray addObject:imgModel];
    }
    detail.img = imgModelArray;
    
    return detail;
}
@end
