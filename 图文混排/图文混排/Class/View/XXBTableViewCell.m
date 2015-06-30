//
//  XXBTableViewCell.m
//  图文混排
//
//  Created by 杨小兵 on 15/6/29.
//  Copyright (c) 2015年 xiaoxiaobing. All rights reserved.
//

#import "XXBTableViewCell.h"
#import "XXBTabCellModel.h"

static   NSString * const cellIdenfifier = @"XXBTableViewCell";

@implementation XXBTableViewCell
+ (instancetype)tableViewCellWithTable:(UITableView *)tableView
{
    XXBTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdenfifier];
    if (cell == nil)
    {
        cell = [[XXBTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdenfifier];
    }
    return cell;
}
- (void)setTabCellModel:(XXBTabCellModel *)tabCellModel
{
    _tabCellModel = tabCellModel;
    self.textLabel.text = _tabCellModel.title;
}
@end
