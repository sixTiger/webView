//
//  NewsManager.m
//  webView图文混排
//
//  Created by 杨小兵 on 15/4/13.
//  Copyright (c) 2015年 xiaoxiaobing. All rights reserved.
//

#import "NewsManager.h"

@implementation NewsManager

+ (instancetype)manager {
    NewsManager *mgr = [super manager];
    
    NSMutableSet *newSet = [NSMutableSet set];
    newSet.set = mgr.responseSerializer.acceptableContentTypes;
    [newSet addObject:@"text/html"];
    
    mgr.responseSerializer.acceptableContentTypes = newSet;
    return mgr;
}
@end
