//
//  TwoViewController.m
//  图文混排
//
//  Created by 杨小兵 on 15/4/17.
//  Copyright (c) 2015年 xiaoxiaobing. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView1;
@property (weak, nonatomic) IBOutlet UITextView *textView2;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test7];
}

- (void)test1
{
    // alignment 对齐方式，取值枚举常量 NSTextAlignment
    
    //    enum {
    //        NSTextAlignmentLeft      = 0,
    //        NSTextAlignmentCenter    = 1,
    //        NSTextAlignmentRight     = 2,
    //        NSTextAlignmentJustified = 3,
    //        NSTextAlignmentNatural   = 4,
    //    };
    //    typedef NSInteger NSTextAlignment;
    
    self.textView1.editable = NO;
    self.textView2.editable = NO;
    
//    _label11.text = @"alignment : NSTextAlignmentCenter";
//    _label12.text = @"alignment : NSTextAlignmentJustified";
    
    NSString *text = [NSString stringWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"荷塘月色" ofType:@"txt"] encoding: NSUTF8StringEncoding error: NULL] ;
    
    // NSParagraphStyle
    NSMutableParagraphStyle *paraStyle01 = [[NSMutableParagraphStyle alloc] init];
    paraStyle01.alignment = NSTextAlignmentNatural;
    
    NSDictionary *attrDict01 = @{ NSParagraphStyleAttributeName: paraStyle01,
                                  NSFontAttributeName: [UIFont systemFontOfSize: 12] };
    
    self.textView1.attributedText = [[NSAttributedString alloc] initWithString: text attributes: attrDict01];
    
    
    NSMutableParagraphStyle *paraStyle02 = [[NSMutableParagraphStyle alloc] init];
    paraStyle02.alignment = NSTextAlignmentJustified;
    
    NSDictionary *attrDict02 = @{ NSParagraphStyleAttributeName: paraStyle02,
                                  NSFontAttributeName: [UIFont systemFontOfSize: 12] };
    self.textView2.attributedText = [[NSAttributedString alloc] initWithString: text attributes: attrDict02];
}
- (void)test2
{
    //firstLineHeadIndent 首行缩进，取值 float
    
    self.textView1.editable = NO;
    self.textView2.editable = NO;
    
//    _label11.text = @"firstLineHeadIndent： 24";
//    _label12.text = @"firstLineHeadIndent： 48";
    
    NSString *text = [NSString stringWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"荷塘月色" ofType:@"txt"] encoding: NSUTF8StringEncoding error: NULL] ;
    
    // NSParagraphStyle
    NSMutableParagraphStyle *paraStyle01 = [[NSMutableParagraphStyle alloc] init];
    paraStyle01.firstLineHeadIndent = 24;
    
    NSDictionary *attrDict01 = @{ NSParagraphStyleAttributeName: paraStyle01,
                                  NSFontAttributeName: [UIFont systemFontOfSize: 12] };
    
    self.textView1.attributedText = [[NSAttributedString alloc] initWithString: text attributes: attrDict01];
    
    
    NSMutableParagraphStyle *paraStyle02 = [[NSMutableParagraphStyle alloc] init];
    paraStyle02.firstLineHeadIndent = 240;
    
    NSDictionary *attrDict02 = @{ NSParagraphStyleAttributeName: paraStyle02,
                                  NSFontAttributeName: [UIFont systemFontOfSize: 12] };
    self.textView2.attributedText = [[NSAttributedString alloc] initWithString: text attributes: attrDict02];
}
- (void)test3
{
    //headIndent 除了首行之外的行缩进，取值 float
    
    self.textView1.editable = NO;
    self.textView2.editable = NO;
    
    NSString *text = [NSString stringWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"荷塘月色" ofType:@"txt"] encoding: NSUTF8StringEncoding error: NULL] ;
    
    // NSParagraphStyle
    NSMutableParagraphStyle *paraStyle01 = [[NSMutableParagraphStyle alloc] init];
    paraStyle01.headIndent = 24;
    
    NSDictionary *attrDict01 = @{ NSParagraphStyleAttributeName: paraStyle01,
                                  NSFontAttributeName: [UIFont systemFontOfSize: 12] };
    
    self.textView1.attributedText = [[NSAttributedString alloc] initWithString: text attributes: attrDict01];
    
    
    NSMutableParagraphStyle *paraStyle02 = [[NSMutableParagraphStyle alloc] init];
    paraStyle02.headIndent = 48;
    
    NSDictionary *attrDict02 = @{ NSParagraphStyleAttributeName: paraStyle02,
                                  NSFontAttributeName: [UIFont systemFontOfSize: 12] };
    self.textView2.attributedText = [[NSAttributedString alloc] initWithString: text attributes: attrDict02];
}
- (void)test4
{
    //tailIndent 行尾缩进，注意距离是从行首算起
    
    NSString *text = [NSString stringWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"荷塘月色" ofType:@"txt"] encoding: NSUTF8StringEncoding error: NULL] ;
    
    // NSParagraphStyle
    NSMutableParagraphStyle *paraStyle01 = [[NSMutableParagraphStyle alloc] init];
    paraStyle01.tailIndent = 48;
    
    NSDictionary *attrDict01 = @{ NSParagraphStyleAttributeName: paraStyle01,
                                  NSFontAttributeName: [UIFont systemFontOfSize: 12] };
    
    self.textView1.attributedText = [[NSAttributedString alloc] initWithString: text attributes: attrDict01];
    
    
    NSMutableParagraphStyle *paraStyle02 = [[NSMutableParagraphStyle alloc] init];
    paraStyle02.tailIndent = 252;
    
    NSDictionary *attrDict02 = @{ NSParagraphStyleAttributeName: paraStyle02,
                                  NSFontAttributeName: [UIFont systemFontOfSize: 12] };
    self.textView2.attributedText = [[NSAttributedString alloc] initWithString: text attributes: attrDict02];
}
- (void)test5
{
    //lineHeightMultiple 行高倍数因子，大于1行高变小，小于1行高变小，实际上字体大小不会改变，改变的时行间距
    
    self.textView1.editable = NO;
    self.textView2.editable = NO;
    NSString *text = [NSString stringWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"荷塘月色" ofType:@"txt"] encoding: NSUTF8StringEncoding error: NULL] ;
    
    // NSParagraphStyle
    NSMutableParagraphStyle *paraStyle01 = [[NSMutableParagraphStyle alloc] init];
    paraStyle01.lineHeightMultiple = 0.6;
    
    NSDictionary *attrDict01 = @{ NSParagraphStyleAttributeName: paraStyle01,
                                  NSFontAttributeName: [UIFont systemFontOfSize: 12] };
    
    self.textView1.attributedText = [[NSAttributedString alloc] initWithString: text attributes: attrDict01];
    
    
    NSMutableParagraphStyle *paraStyle02 = [[NSMutableParagraphStyle alloc] init];
    paraStyle02.lineHeightMultiple = 2.5;
    
    NSDictionary *attrDict02 = @{ NSParagraphStyleAttributeName: paraStyle02,
                                  NSFontAttributeName: [UIFont systemFontOfSize: 12] };
    self.textView2.attributedText = [[NSAttributedString alloc] initWithString: text attributes: attrDict02];
}
- (void)test6
{
    //maximumLineHeight 最大行高，若其值小于默认行高，则行间距变小，若其值大于默认行高，则不会引起任何变化
    
    self.textView1.editable = NO;
    self.textView2.editable = NO;
    
    NSString *text = [NSString stringWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"荷塘月色" ofType:@"txt"] encoding: NSUTF8StringEncoding error: NULL] ;
    
    // NSParagraphStyle
    NSMutableParagraphStyle *paraStyle01 = [[NSMutableParagraphStyle alloc] init];
    paraStyle01.maximumLineHeight = 7;
    
    NSDictionary *attrDict01 = @{ NSParagraphStyleAttributeName: paraStyle01,
                                  NSFontAttributeName: [UIFont systemFontOfSize: 12] };
    
    self.textView1.attributedText = [[NSAttributedString alloc] initWithString: text attributes: attrDict01];
    
    
    NSMutableParagraphStyle *paraStyle02 = [[NSMutableParagraphStyle alloc] init];
    paraStyle02.maximumLineHeight = 25;
    
    NSDictionary *attrDict02 = @{ NSParagraphStyleAttributeName: paraStyle02,
                                  NSFontAttributeName: [UIFont systemFontOfSize: 12] };
    self.textView2.attributedText = [[NSAttributedString alloc] initWithString: text attributes: attrDict02];
}
- (void)test7
{
    //minimumLineHeight 最小行高，若其值大于默认行高，则行间距变大，若其值小于默认行高，则不会引起任何变化
    
    self.textView1.editable = NO;
    self.textView2.editable = NO;
    NSString *text = [NSString stringWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"荷塘月色" ofType:@"txt"] encoding: NSUTF8StringEncoding error: NULL] ;
    
    // NSParagraphStyle
    NSMutableParagraphStyle *paraStyle01 = [[NSMutableParagraphStyle alloc] init];
    paraStyle01.minimumLineHeight = 0.6;
    
    NSDictionary *attrDict01 = @{ NSParagraphStyleAttributeName: paraStyle01,
                                  NSFontAttributeName: [UIFont systemFontOfSize: 12] };
    
    self.textView1.attributedText = [[NSAttributedString alloc] initWithString: text attributes: attrDict01];
    
    
    NSMutableParagraphStyle *paraStyle02 = [[NSMutableParagraphStyle alloc] init];
    paraStyle02.minimumLineHeight = 25;
    
    NSDictionary *attrDict02 = @{ NSParagraphStyleAttributeName: paraStyle02,
                                  NSFontAttributeName: [UIFont systemFontOfSize: 12] };
    self.textView2.attributedText = [[NSAttributedString alloc] initWithString: text attributes: attrDict02];
}
- (void)test8
{
    //lineSpacing 行距，取值为 float，可正可负，正值增加行距，负值减小行距
    
    self.textView1.editable = NO;
    self.textView2.editable = NO;
    
    NSString *text = [NSString stringWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"荷塘月色" ofType:@"txt"] encoding: NSUTF8StringEncoding error: NULL] ;
    
    // NSParagraphStyle
    NSMutableParagraphStyle *paraStyle01 = [[NSMutableParagraphStyle alloc] init];
    paraStyle01.lineSpacing = -7;
    
    NSDictionary *attrDict01 = @{ NSParagraphStyleAttributeName: paraStyle01,
                                  NSFontAttributeName: [UIFont systemFontOfSize: 12] };
    
    self.textView1.attributedText = [[NSAttributedString alloc] initWithString: text attributes: attrDict01];
    
    
    NSMutableParagraphStyle *paraStyle02 = [[NSMutableParagraphStyle alloc] init];
    paraStyle02.lineSpacing = 25;
    
    NSDictionary *attrDict02 = @{ NSParagraphStyleAttributeName: paraStyle02,
                                  NSFontAttributeName: [UIFont systemFontOfSize: 12] };
    self.textView2.attributedText = [[NSAttributedString alloc] initWithString: text attributes: attrDict02];
}
- (void)test9
{
    //paragraphSpacing 段距，取值 float, 负值无效，取0值
    
    self.textView1.editable = NO;
    self.textView2.editable = NO;
    
    NSString *text = [NSString stringWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"荷塘月色" ofType:@"txt"] encoding: NSUTF8StringEncoding error: NULL] ;
    
    // NSParagraphStyle
    NSMutableParagraphStyle *paraStyle01 = [[NSMutableParagraphStyle alloc] init];
    paraStyle01.paragraphSpacing = -7;
    
    NSDictionary *attrDict01 = @{ NSParagraphStyleAttributeName: paraStyle01,
                                  NSFontAttributeName: [UIFont systemFontOfSize: 12] };
    
    self.textView1.attributedText = [[NSAttributedString alloc] initWithString: text attributes: attrDict01];
    
    
    NSMutableParagraphStyle *paraStyle02 = [[NSMutableParagraphStyle alloc] init];
    paraStyle02.paragraphSpacing = 25;
    
    NSDictionary *attrDict02 = @{ NSParagraphStyleAttributeName: paraStyle02,
                                  NSFontAttributeName: [UIFont systemFontOfSize: 12] };
    self.textView2.attributedText = [[NSAttributedString alloc] initWithString: text attributes: attrDict02];
}
- (void)test10
{
    //paragraphSpacingBefore 段首距离，取值 float , 最小取值为0
    
    self.textView1.editable = NO;
    self.textView2.editable = NO;
    
    
    NSString *text = [NSString stringWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"荷塘月色" ofType:@"txt"] encoding: NSUTF8StringEncoding error: NULL] ;
    
    // NSParagraphStyle
    NSMutableParagraphStyle *paraStyle01 = [[NSMutableParagraphStyle alloc] init];
    paraStyle01.paragraphSpacingBefore = -7;
    
    NSDictionary *attrDict01 = @{ NSParagraphStyleAttributeName: paraStyle01,
                                  NSFontAttributeName: [UIFont systemFontOfSize: 12] };
    
    self.textView1.attributedText = [[NSAttributedString alloc] initWithString: text attributes: attrDict01];
    
    
    NSMutableParagraphStyle *paraStyle02 = [[NSMutableParagraphStyle alloc] init];
    paraStyle02.paragraphSpacingBefore = 25;
    
    NSDictionary *attrDict02 = @{ NSParagraphStyleAttributeName: paraStyle02,
                                  NSFontAttributeName: [UIFont systemFontOfSize: 12] };
    self.textView2.attributedText = [[NSAttributedString alloc] initWithString: text attributes: attrDict02];
}
- (void)test11
{
    //baseWritingDirection  //句子排版方向，取值为枚举常量 NSWritingDirection
    //    enum {
    //        NSWritingDirectionNatural = -1,
    //        NSWritingDirectionLeftToRight =  0,
    //        NSWritingDirectionRightToLeft =  1
    //    };
    //    typedef NSInteger NSWritingDirection;
    
    self.textView1.editable = NO;
    self.textView2.editable = NO;
    
    
    NSString *text = [NSString stringWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"荷塘月色" ofType:@"txt"] encoding: NSUTF8StringEncoding error: NULL] ;
    
    // NSParagraphStyle
    NSMutableParagraphStyle *paraStyle01 = [[NSMutableParagraphStyle alloc] init];
    paraStyle01.baseWritingDirection = NSWritingDirectionLeftToRight;
    
    NSDictionary *attrDict01 = @{ NSParagraphStyleAttributeName: paraStyle01,
                                  NSFontAttributeName: [UIFont systemFontOfSize: 12] };
    
    self.textView1.attributedText = [[NSAttributedString alloc] initWithString: text attributes: attrDict01];
    
    
    NSMutableParagraphStyle *paraStyle02 = [[NSMutableParagraphStyle alloc] init];
    paraStyle02.baseWritingDirection = NSWritingDirectionRightToLeft;
    
    NSDictionary *attrDict02 = @{ NSParagraphStyleAttributeName: paraStyle02,
                                  NSFontAttributeName: [UIFont systemFontOfSize: 12] };
    self.textView2.attributedText = [[NSAttributedString alloc] initWithString: text attributes: attrDict02];
}
- (void)test12
{
    //lineBreakMode 断行方式，取值枚举常量 NSLineBreakMode
    
    //    enum {
    //        NSLineBreakByWordWrapping = 0, //自动换行，单词切断
    //        NSLineBreakByCharWrapping,     //自动换行，字母切断
    //        NSLineBreakByClipping,         //非自动换行，不切断
    //        NSLineBreakByTruncatingHead,   //非自动换行，行首切断
    //        NSLineBreakByTruncatingTail,   //非自动换行，行尾切断
    //        NSLineBreakByTruncatingMiddle  //非自动换行，中间切断
    //    };
    //    typedef NSUInteger NSLineBreakMode;
    
    self.textView1.editable = NO;
    self.textView2.editable = NO;
    
    
    NSString *text = [NSString stringWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"荷塘月色" ofType:@"txt"] encoding: NSUTF8StringEncoding error: NULL] ;
    
    // NSParagraphStyle
    NSMutableParagraphStyle *paraStyle01 = [[NSMutableParagraphStyle alloc] init];
    paraStyle01.lineBreakMode = NSLineBreakByTruncatingHead;
    
    NSDictionary *attrDict01 = @{ NSParagraphStyleAttributeName: paraStyle01,
                                  NSFontAttributeName: [UIFont systemFontOfSize: 12] };
    
    self.textView1.attributedText = [[NSAttributedString alloc] initWithString: text attributes: attrDict01];
    
    
    NSMutableParagraphStyle *paraStyle02 = [[NSMutableParagraphStyle alloc] init];
    paraStyle02.lineBreakMode = NSLineBreakByTruncatingTail;
    
    NSDictionary *attrDict02 = @{ NSParagraphStyleAttributeName: paraStyle02,
                                  NSFontAttributeName: [UIFont systemFontOfSize: 12] };
    self.textView2.attributedText = [[NSAttributedString alloc] initWithString: text attributes: attrDict02];
}
- (void)test13
{
    //hyphenationFactor 连字符属性，取值 0 到 1 之间，开启断词功能
    
    NSString *strstr = @"These two documents provide the perfect starting point for iOS and Mac app development. Follow either road map to learn how to get and use Xcode to create your first app. You will learn how to use Xcode to test and debug your source code, analyze to improve your app’s performance, perform source control operations, archive your app, and submit your app to the App Store.";
    
    self.textView1.editable = NO;
    self.textView2.editable = NO;
    
    
    // NSParagraphStyle
    NSMutableParagraphStyle *paraStyle01 = [[NSMutableParagraphStyle alloc] init];
    paraStyle01.hyphenationFactor = 0.3;
    
    NSDictionary *attrDict01 = @{ NSParagraphStyleAttributeName: paraStyle01,
                                  NSFontAttributeName: [UIFont systemFontOfSize: 15] };
    
    self.textView1.attributedText = [[NSAttributedString alloc] initWithString: strstr  attributes: attrDict01];
    
    
    NSMutableParagraphStyle *paraStyle02 = [[NSMutableParagraphStyle alloc] init];
    paraStyle02.hyphenationFactor = 0.9;
    
    NSDictionary *attrDict02 = @{ NSParagraphStyleAttributeName: paraStyle02,
                                  NSFontAttributeName: [UIFont systemFontOfSize: 15] };
    self.textView2.attributedText = [[NSAttributedString alloc] initWithString: strstr  attributes: attrDict02];
}
@end
