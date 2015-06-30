//
//  XXBTabCellModel.h
//  图文混排
//
//  Created by 杨小兵 on 15/6/29.
//  Copyright (c) 2015年 xiaoxiaobing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XXBTabCellModel : NSObject
@property(nonatomic , copy)     NSString    *title;
@property(nonatomic , copy)     NSString    *selName;
@property(nonatomic , strong)   Class       className;
@end
