//
//  NewListTableViewController.m
//  webView图文混排
//
//  Created by 杨小兵 on 15/4/13.
//  Copyright (c) 2015年 xiaoxiaobing. All rights reserved.
//

#import "NewListTableViewController.h"
#import "NewsManager.h"
#import "NewsHeadLine.h"
#import "UIImageView+WebCache.h"
#import "NewsDetailViewController.h"

@interface NewListTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *headlines;
@end

@implementation NewListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 70;
    
    [[NewsManager manager] GET:@"http://c.m.163.com/nc/article/headline/T1348647853363/0-140.html" parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        // 新闻字典数组
        NSArray *dictArray = responseObject[@"T1348647853363"];
        
        // 新闻模型数组
        NSMutableArray *headlines = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            NewsHeadLine *headline = [NewsHeadLine headlineWithDict:dict];
            [headlines addObject:headline];
        }
        _headlines = headlines;
        // 刷新表格
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败 - %@", error);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.headlines.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" ];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"reuseIdentifier"];
    }
    NewsHeadLine *newsHeadLine = self.headlines[indexPath.row];
    cell.textLabel.text = newsHeadLine.title;
    cell.detailTextLabel.text = newsHeadLine.digest;
    cell.imageView.clipsToBounds = YES;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:newsHeadLine.imgsrc] placeholderImage:[UIImage imageNamed:@"wechat"]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsDetailViewController *newsDetaileVC = [[NewsDetailViewController alloc] init];
    newsDetaileVC.headline = self.headlines[indexPath.row];
    [self.navigationController pushViewController:newsDetaileVC animated:YES];
}
@end
