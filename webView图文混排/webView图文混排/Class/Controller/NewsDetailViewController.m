//
//  NewsDetailViewController.m
//  webView图文混排
//
//  Created by 杨小兵 on 15/4/13.
//  Copyright (c) 2015年 xiaoxiaobing. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "NewsHeadLine.h"
#import "NewsManager.h"
#import "NewsDetail.h"
#import "NewsDetailImg.h"

@interface NewsDetailViewController ()<UIWebViewDelegate>
@property(nonatomic , weak)UIWebView *webView;
@property (nonatomic, strong) NewsDetail *detail;
@end

@implementation NewsDetailViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"新闻详情";
    // 发送一个GET请求, 获得新闻的详情数据
    NSString *url = [NSString stringWithFormat:@"http://c.m.163.com/nc/article/%@/full.html", self.headline.docid];
    
    [[NewsManager manager] GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        self.detail = [NewsDetail detailWithDict:responseObject[self.headline.docid]];
        [self showNewsDetail];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"failure - %@", error);
    }];
}
/**
 *  显示新闻详情数据
 */
- (void)showNewsDetail
{
    NSMutableString *html = [NSMutableString string];
    // 头部内容
    [html appendString:@"<html>"];
    [html appendString:@"<head>"];
    [html appendFormat:@"<link rel=\"stylesheet\" href=\"%@\">", [[NSBundle mainBundle] URLForResource:@"NewsDetail.css" withExtension:nil]];
    [html appendString:@"</head>"];
    
    // 具体内容
    [html appendString:@"<body>"];
    
    // 将图片插入body对应的标记中, 比如<!--IMG#0-->
    [html appendString:[self setupBody]];
    
    [html appendString:@"</body>"];
    
    // 尾部内容
    [html appendString:@"</html>"];
    
    // 显示网页
    [self.webView loadHTMLString:html baseURL:nil];
}
/**
 *  初始化body内容
 */
- (NSString *)setupBody
{
    NSMutableString *body = [NSMutableString string];
    
    // 拼接标题
    [body appendFormat:@"<div class=\"title\">%@</div>", self.detail.title];
    
    // 拼接时间
    [body appendFormat:@"<div class=\"time\">%@</div>", self.detail.ptime];
    
    // 拼接图片
    [body appendString:self.detail.body];
    for (NewsDetailImg *img in self.detail.img) {
        // 图片的html字符串
        NSMutableString *imgHtml = [NSMutableString string];
        [imgHtml appendString:@"<div class=\"img-parent\">"];
        
        // img.pixel = 500*332
        NSArray *pixel = [img.pixel componentsSeparatedByString:@"*"];
        int width = [[pixel firstObject] intValue];
        int height = [[pixel lastObject] intValue];
        int maxWidth = [UIScreen mainScreen].bounds.size.width * 0.8;
        if (width > maxWidth) { // 限制尺寸
            height = height * maxWidth / width;
            width = maxWidth;
        }
        
        NSString *onload = @"this.onclick = function() {"
        "   window.location.href = 'news:src=' + this.src;"
        "};";
        
        [imgHtml appendFormat:@"<img onload=\"%@\" width=\"%d\" height=\"%d\" src=\"%@\">", onload, width, height, img.src];
        [imgHtml appendString:@"</div>"];
        
        // 将img.ref替换为img标签的内容
        [body replaceOccurrencesOfString:img.ref withString:imgHtml options:NSCaseInsensitiveSearch range:NSMakeRange(0, body.length)];
    }
    return body;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"%@",NSStringFromCGSize(webView.scrollView.contentSize));
    webView.frame = CGRectMake(0, 64, webView.scrollView.contentSize.width, webView.scrollView.contentSize.height);
    webView.scrollView.bouncesZoom = NO;
    webView.scrollView.alwaysBounceHorizontal = NO;
    webView.scrollView.alwaysBounceVertical = NO;
   
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    /**
     *  这里只是测试 可以调用任何一个方法
     */
    /**
     *  调用test方法进行测试
     */
    SEL testSEL = sel_getUid("test:");
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [self performSelector:testSEL withObject:@"hahaahah"];
#pragma clang diagnostic pop
    /**
     *  以上是测试部分
     */
    NSLog(@"链接地址%@",request.URL);
    NSString *urlStr = request.URL.absoluteString;
    NSRange range = [urlStr rangeOfString:@"news:src="];
    if (range.location != NSNotFound)
    {
        NSUInteger loc = range.location + range.length;
        NSString *src = [urlStr substringFromIndex:loc];
        // 保存图片
        [self saveImageToAlbum:src];
        return NO;
    }
    return YES;
}
- (void)test:(NSString *)test
{
    NSLog(@"++++test ++ %@",test);
}
- (void)saveImageToAlbum:(NSString *)src
{
    // UIAlertController == UIAletView + UIActionSheet
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"友情提示" message:@"是否要保存图片到相册?" preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        // UIWebView的缓存由NSURLCache来管理
        NSURLCache *cache = [NSURLCache sharedURLCache];
        
        // 从网页缓存中取得图片
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:src]];
        NSData *imgData = [cache cachedResponseForRequest:request].data;
        
        // 保存图片
        UIImage *image = [UIImage imageWithData:imgData];
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleCancel handler:nil]];
    // 显示
    [self presentViewController:alert animated:YES completion:nil];
}

- (UIWebView *)webView
{
    if (_webView == nil) {
        UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
        [self.view addSubview:webView];
        webView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin| UIViewAutoresizingFlexibleWidth       |UIViewAutoresizingFlexibleRightMargin |UIViewAutoresizingFlexibleTopMargin   |UIViewAutoresizingFlexibleHeight      ;
        webView.delegate = self;
        _webView = webView;
    }
    return _webView;
}
@end
