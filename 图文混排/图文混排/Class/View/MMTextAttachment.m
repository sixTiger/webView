//
//  MMTextAttachment.m
//  图文混排
//
//  Created by 杨小兵 on 15/4/17.
//  Copyright (c) 2015年 xiaoxiaobing. All rights reserved.
//

#import "MMTextAttachment.h"

@implementation MMTextAttachment
// 要话的图片的宽高
- (CGRect)attachmentBoundsForTextContainer:(NSTextContainer *)textContainer proposedLineFragment:(CGRect)lineFrag glyphPosition:(CGPoint)position characterIndex:(NSUInteger)charIndex NS_AVAILABLE_IOS(7_0)
{
    return CGRectMake( 0 , 0 , lineFrag.size.height * 0.5 , lineFrag.size.height * 0.5 );
}
@end
