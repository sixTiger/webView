//
//  TableViewController.m
//  图文混排
//
//  Created by 杨小兵 on 15/6/29.
//  Copyright (c) 2015年 xiaoxiaobing. All rights reserved.
//

#import "TableViewController.h"
#import "XXBTableViewCell.h"
#import "XXBTabCellModel.h"

#import "ViewController.h"

@interface TableViewController ()
@property(nonatomic , strong)NSMutableArray *dataSourceArray;
@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSourceArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSourceArray[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XXBTableViewCell *cell = [XXBTableViewCell tableViewCellWithTable:tableView];
    cell.tabCellModel = self.dataSourceArray[indexPath.section][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        ViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"ViewController"];
        XXBTabCellModel *TM = self.dataSourceArray[indexPath.section][indexPath.row];
        vc.selString = TM.selName;
        [self.navigationController pushViewController:vc animated:YES];
    }
}
#pragma mark - 添加数据
- (NSMutableArray *)dataSourceArray
{
    if (_dataSourceArray == nil)
    {
        _dataSourceArray = [NSMutableArray array];
        {
            NSMutableArray *data1 = [NSMutableArray array];
            [_dataSourceArray addObject:data1];
            for (int i = 0; i < 11; i++)
            {
                XXBTabCellModel *tabCellModel = [[XXBTabCellModel alloc] init];
                tabCellModel.className = [ViewController class];
                NSString *string = [NSString stringWithFormat:@"test%d",i];
                tabCellModel.title = string;
                tabCellModel.selName = string;
                [data1 addObject:tabCellModel];
            }
        }
        {
            NSMutableArray *data2 = [NSMutableArray array];
            [_dataSourceArray addObject:data2];
        }
    }
    return _dataSourceArray;
}
@end
