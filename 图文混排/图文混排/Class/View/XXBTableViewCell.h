//
//  XXBTableViewCell.h
//  图文混排
//
//  Created by 杨小兵 on 15/6/29.
//  Copyright (c) 2015年 xiaoxiaobing. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XXBTabCellModel;

@interface XXBTableViewCell : UITableViewCell

@property(nonatomic , strong)XXBTabCellModel *tabCellModel;

+ (instancetype)tableViewCellWithTable:(UITableView *)tableView;
@end
