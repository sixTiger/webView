//
//  NewsHeadLine.h
//  webView图文混排
//
//  Created by 杨小兵 on 15/4/13.
//  Copyright (c) 2015年 xiaoxiaobing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsHeadLine : NSObject

/** 新闻ID */
@property (nonatomic, copy) NSString *docid;
/** 新闻标题 */
@property (nonatomic, copy) NSString *title;
/** 新闻摘要 */
@property (nonatomic, copy) NSString *digest;
/** 新闻配图 */
@property (nonatomic, copy) NSString *imgsrc;

+ (instancetype)headlineWithDict:(NSDictionary *)dict;
@end
