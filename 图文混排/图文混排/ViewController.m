//
//  ViewController.m
//  图文混排
//
//  Created by 杨小兵 on 15/4/17.
//  Copyright (c) 2015年 xiaoxiaobing. All rights reserved.
//

#import "ViewController.h"
#import <CoreText/CoreText.h>
#import "MMTextAttachment.h"
@interface ViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *testLable;
@property (weak, nonatomic) IBOutlet UILabel *testLable1;

@property (weak, nonatomic) IBOutlet UILabel *testLable2;

@property (weak, nonatomic) IBOutlet UILabel *testLable3;
@property (weak, nonatomic) IBOutlet UITextView *testTextView;


@property(nonatomic , strong)NSMutableAttributedString *attributedString;

@end

@implementation ViewController
static NSString *originStr = @"Hello,我是一个测试程序! flush  Hello,我是一个测试程序! flush Hello,我是一个测试程序! flush";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.testLable.numberOfLines = 0;
    self.testLable1.numberOfLines = 0;
    self.testLable2.numberOfLines = 0;
    self.testLable3.numberOfLines = 0;
    [self test11];
//    [self test12];
    self.testTextView.delegate = self;
}
//能够图文混排但是行间距不好弄
- (void)test1
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    //行间距
    //    paragraphStyle.lineHeightMultiple = 1.5;
    paragraphStyle.lineSpacing = 10;
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"I am a test String 我是一个测试字符 I am a test String 我是一个测试字符I am a test String 我是一个测试字符 I am a test String 我是一个测试字符" ];
    MMTextAttachment * textAttachment = [[ MMTextAttachment alloc ] init] ;
    UIImage * smileImage = [ UIImage imageNamed:@"load" ]  ;
    textAttachment.image = smileImage ;
    NSAttributedString * textAttachmentString = [NSAttributedString  attributedStringWithAttachment:textAttachment ] ;
    [string insertAttributedString:textAttachmentString atIndex:0 ];
    
    [string appendAttributedString:textAttachmentString ];
    NSRange range;
    range.location = 0;
    range.length = string.length;
    [string addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    self.testLable.attributedText = string ;
}

- (void)test3
{
    
    //方式一
    
    //创建 NSMutableAttributedString
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString: originStr];
    //添加属性
    //给所有字符设置字体为Zapfino，字体高度为15像素
    [attributedStr addAttribute: NSFontAttributeName value: [UIFont fontWithName: @"Zapfino" size: 15] range: NSMakeRange(0, originStr.length)];
    //分段控制，最开始4个字符颜色设置成蓝色
    [attributedStr addAttribute: NSForegroundColorAttributeName value: [UIColor blueColor] range: NSMakeRange(0, 4)];
    //分段控制，第5个字符开始的3个字符，即第5、6、7字符设置为红色
    [attributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor purpleColor] range: NSMakeRange(4, 3) ];
    //设置背景颜色
    [attributedStr addAttribute: NSBackgroundColorAttributeName value: [UIColor redColor] range: NSMakeRange(0, originStr.length)];
    // 设置字体的链接属性
    [attributedStr addAttribute: NSLigatureAttributeName value:@(1)  range: NSMakeRange(15, 4)];
    
    // 设置字体的间距 上下左右
    [attributedStr addAttribute: NSKernAttributeName value:@(20)  range: NSMakeRange(0, originStr.length)];
    
    // 添加线
    [attributedStr addAttribute:NSStrikethroughStyleAttributeName  value:@(1)  range: NSMakeRange(0, originStr.length)];
    
    // 设置划线颜色
    [attributedStr addAttribute:NSStrikethroughColorAttributeName  value:[UIColor yellowColor]  range: NSMakeRange(0, originStr.length)];
    
    
    // 添下滑加线 NSUnderlineStyleDouble直接写数字代表宽度
    [attributedStr addAttribute:NSUnderlineStyleAttributeName  value:@(NSUnderlineStyleDouble)  range: NSMakeRange(0, originStr.length)];
    
    // 设置下划线颜色
    [attributedStr addAttribute:NSUnderlineColorAttributeName  value:[UIColor yellowColor]  range: NSMakeRange(0, originStr.length)];
    
    // 设置中空
    [attributedStr addAttribute:NSStrokeWidthAttributeName  value:@(3)  range: NSMakeRange(0, originStr.length)];
    
    // 设置填充部分的宽度
    [attributedStr addAttribute:NSStrokeWidthAttributeName  value:@(-3)  range: NSMakeRange(0, originStr.length)];
    
    // 设置填充部分的颜色
    [attributedStr addAttribute:NSStrokeColorAttributeName  value:[UIColor greenColor]  range: NSMakeRange(0, originStr.length)];
    
    // 添加阴影和偏移 （有背景颜色的时候背景会跟着一块偏移）
    NSShadow *shadow1 = [[NSShadow alloc] init];  //NSShadow 对象比较简单，只有3个属性：阴影颜色，模糊半径和偏移
    shadow1.shadowOffset = CGSizeMake(3, 3);      //阴影偏移（X方向偏移和Y方向偏移）
    shadow1.shadowBlurRadius = 0.5;               //模糊半径
    shadow1.shadowColor = [UIColor orangeColor];  //阴影颜色
    
    NSShadow *shadow2 = [[NSShadow alloc] init];
    shadow2.shadowOffset = CGSizeMake(3, 16);
    shadow2.shadowBlurRadius = 2.5;
    shadow2.shadowColor = [UIColor purpleColor];
    
    NSShadow *shadow3 = [[NSShadow alloc] init];
    shadow3.shadowOffset = CGSizeMake(16, 3);
    shadow3.shadowBlurRadius = 4.0;
    shadow3.shadowColor = [UIColor blueColor];
    
    
    // 设置填充部分的颜色
    [attributedStr addAttribute:NSShadowAttributeName  value:shadow2  range: NSMakeRange(0, originStr.length)];
    
    //赋值给显示控件label01的 attributedText
    self.testLable1.attributedText = attributedStr;
    
    //方式二的分段处理
    //第一段
    NSDictionary *attrDict1 = @{ NSFontAttributeName: [UIFont fontWithName: @"Zapfino" size: 15],
                                 NSForegroundColorAttributeName: [UIColor blueColor] };
    NSAttributedString *attrStr1 = [[NSAttributedString alloc] initWithString: [originStr substringWithRange: NSMakeRange(0, 4)] attributes: attrDict1];
    
    //第二段
    NSDictionary *attrDict2 = @{ NSFontAttributeName: [UIFont fontWithName: @"Zapfino" size: 15],
                                 NSForegroundColorAttributeName: [UIColor redColor] };
    NSAttributedString *attrStr2 = [[NSAttributedString alloc] initWithString: [originStr substringWithRange: NSMakeRange(4, 3)] attributes: attrDict2];
    
    //第三段
    NSDictionary *attrDict3 = @{ NSFontAttributeName: [UIFont fontWithName: @"Zapfino" size: 15],
                                 NSForegroundColorAttributeName: [UIColor blackColor] };
    NSAttributedString *attrStr3 = [[NSAttributedString alloc] initWithString: [originStr substringWithRange:
                                                                                NSMakeRange(7, originStr.length - 4 - 3)] attributes: attrDict3];
    //合并
    NSMutableAttributedString *attributedStr03 = [[NSMutableAttributedString alloc] initWithAttributedString: attrStr1];
    [attributedStr03 appendAttributedString: attrStr2];
    [attributedStr03 appendAttributedString: attrStr3];
    
    self.testLable2.attributedText = attributedStr03;
    
    
    // NSFontAttributeName                设置字体属性，默认值：字体：Helvetica(Neue) 字号：12
    // NSForegroundColorAttributeNam      设置字体颜色，取值为 UIColor对象，默认值为黑色
    // NSBackgroundColorAttributeName     设置字体所在区域背景颜色，取值为 UIColor对象，默认值为nil, 透明色
    // NSLigatureAttributeName            设置连体属性，取值为NSNumber 对象(整数)，0 表示没有连体字符，1 表示使用默认的连体字符
    // NSKernAttributeName                设定字符间距，取值为 NSNumber 对象（整数），正值间距加宽，负值间距变窄
    // NSStrikethroughStyleAttributeName  设置删除线，取值为 NSNumber 对象（整数）
    // NSStrikethroughColorAttributeName  设置删除线颜色，取值为 UIColor 对象，默认值为黑色
    // NSUnderlineStyleAttributeName      设置下划线，取值为 NSNumber 对象（整数），枚举常量 NSUnderlineStyle中的值，与删除线类似
    // NSUnderlineColorAttributeName      设置下划线颜色，取值为 UIColor 对象，默认值为黑色
    // NSStrokeWidthAttributeName         设置笔画宽度，取值为 NSNumber 对象（整数），负值填充效果，正值中空效果
    // NSStrokeColorAttributeName         填充部分颜色，不是字体颜色，取值为 UIColor 对象
    // NSShadowAttributeName              设置阴影属性，取值为 NSShadow 对象
    // NSTextEffectAttributeName          设置文本特殊效果，取值为 NSString 对象，目前只有图版印刷效果可用：
    // NSBaselineOffsetAttributeName      设置基线偏移值，取值为 NSNumber （float）,正值上偏，负值下偏
    // NSObliquenessAttributeName         设置字形倾斜度，取值为 NSNumber （float）,正值右倾，负值左倾
    // NSExpansionAttributeName           设置文本横向拉伸属性，取值为 NSNumber （float）,正值横向拉伸文本，负值横向压缩文本
    // NSWritingDirectionAttributeName    设置文字书写方向，从左向右书写或者从右向左书写
    // NSVerticalGlyphFormAttributeName   设置文字排版方向，取值为 NSNumber 对象(整数)，0 表示横排文本，1 表示竖排文本
    // NSLinkAttributeName                设置链接属性，点击后调用浏览器打开指定URL地址
    // NSAttachmentAttributeName          设置文本附件,取值为NSTextAttachment对象,常用于文字图片混排
    // NSParagraphStyleAttributeName      设置文本段落排版格式，取值为 NSParagraphStyle 对象
}
- (void)test4
{
    //NSLigatureAttributeName 设置连体属性，取值为NSNumber 对象(整数)，0 表示没有连体字符，1 表示使用默认的连体字符，
    //                        2 表示使用所有连体符号，默认值为 1（iOS 不支持 2）
    
    NSString *ligatureStr = @"flush";
    
    NSDictionary *attrDict1 = @{ NSLigatureAttributeName: [NSNumber numberWithInt: 0],
                                 NSFontAttributeName: [UIFont fontWithName: @"futura" size: 30] };
    self.testLable2.attributedText = [[NSAttributedString alloc] initWithString: ligatureStr attributes: attrDict1];
    
    NSDictionary *attrDict2 = @{ NSLigatureAttributeName: @(1),
                                 NSFontAttributeName: [UIFont fontWithName: @"futura" size: 30]
                                 };
    self.testLable3.attributedText = [[NSAttributedString alloc] initWithString: ligatureStr attributes: attrDict2];
}
- (void)test5
{
    //NSTextEffectAttributeName 设置文本特殊效果，取值为 NSString 对象，目前只有一个可用的特效：
    //                          NSTextEffectLetterpressStyle（凸版印刷效果），适用于iOS 7.0及以上
    NSString *originStr = @"akdghakjdhakghdahdkahjkhdkhdjkahdjkhdjkahd";
    
    NSDictionary *attrDict1 = @{ NSTextEffectAttributeName: NSTextEffectLetterpressStyle,
                                 NSForegroundColorAttributeName: [UIColor grayColor],
                                 NSFontAttributeName: [UIFont systemFontOfSize:30] };
    self.testLable1.attributedText = [[NSAttributedString alloc] initWithString: originStr attributes: attrDict1];
    
    
    NSDictionary *attrDict2 = @{ //NSTextEffectAttributeName: NSTextEffectLetterpressStyle,
                                NSForegroundColorAttributeName: [UIColor grayColor],
                                NSFontAttributeName: [UIFont systemFontOfSize:30] };
    self.testLable2.attributedText = [[NSAttributedString alloc] initWithString: originStr attributes: attrDict2];
    
    NSDictionary *attrDict3 = @{ NSTextEffectAttributeName: NSTextEffectLetterpressStyle,
                                 NSForegroundColorAttributeName: [UIColor blueColor],
                                 NSFontAttributeName: [UIFont systemFontOfSize:30] };
    self.testLable3.attributedText = [[NSAttributedString alloc] initWithString: originStr attributes: attrDict3];
}
- (void)test6
{
    //NSBaselineOffsetAttributeName 设置基线偏移值，取值为 NSNumber （float）,正值上偏，负值下偏
    
    NSDictionary *attrDict1 = @{ NSBaselineOffsetAttributeName: @(-10),
                                 NSFontAttributeName: [UIFont systemFontOfSize:20] };
    self.testLable1.attributedText = [[NSAttributedString alloc] initWithString: originStr attributes: attrDict1];
    
    
    NSDictionary *attrDict2 = @{ NSBaselineOffsetAttributeName: @(0),
                                 NSFontAttributeName: [UIFont systemFontOfSize:20] };
    self.testLable2.attributedText = [[NSAttributedString alloc] initWithString: originStr attributes: attrDict2];
    
    NSDictionary *attrDict3 = @{ NSBaselineOffsetAttributeName: @(10),
                                 NSFontAttributeName: [UIFont systemFontOfSize:20] };
    self.testLable3.attributedText = [[NSAttributedString alloc] initWithString: originStr attributes: attrDict3];
}
- (void)test7
{
    //NSObliquenessAttributeName 设置字形倾斜度，取值为 NSNumber （float）,正值右倾，负值左倾
    
    NSDictionary *attrDict1 = @{ NSObliquenessAttributeName: @(-0.5),
                                 NSFontAttributeName: [UIFont systemFontOfSize:30] };
    self.testLable1.attributedText = [[NSAttributedString alloc] initWithString: originStr attributes: attrDict1];
    
    
    NSDictionary *attrDict2 = @{ NSObliquenessAttributeName: @(0),
                                 NSFontAttributeName: [UIFont systemFontOfSize:30] };
    self.testLable2.attributedText = [[NSAttributedString alloc] initWithString: originStr attributes: attrDict2];
    
    NSDictionary *attrDict3 = @{ NSObliquenessAttributeName: @(0.8),
                                 NSFontAttributeName: [UIFont systemFontOfSize:30] };
    self.testLable3.attributedText = [[NSAttributedString alloc] initWithString: originStr attributes: attrDict3];
}
- (void)test8
{
    //NSExpansionAttributeName 设置文本横向拉伸属性，取值为 NSNumber （float）,正值横向拉伸文本，负值横向压缩文本
    
    NSDictionary *attrDict1 = @{ NSExpansionAttributeName: @(-1),
                                 NSFontAttributeName: [UIFont systemFontOfSize:20] };
    self.testLable1.attributedText = [[NSAttributedString alloc] initWithString: originStr attributes: attrDict1];
    
    
    NSDictionary *attrDict2 = @{ NSExpansionAttributeName: @(0),
                                 NSFontAttributeName: [UIFont systemFontOfSize:20] };
    self.testLable2.attributedText = [[NSAttributedString alloc] initWithString: originStr attributes: attrDict2];
    
    NSDictionary *attrDict3 = @{ NSExpansionAttributeName: @(0.6),
                                 NSFontAttributeName: [UIFont systemFontOfSize:20] };
    self.testLable3.attributedText = [[NSAttributedString alloc] initWithString: originStr attributes: attrDict3];
}
- (void)test9
{
    //NSWritingDirectionAttributeName 设置文字书写方向，取值为以下组合
    
    //@[@(NSWritingDirectionLeftToRight | NSTextWritingDirectionEmbedding)]
    //@[@(NSWritingDirectionLeftToRight | NSTextWritingDirectionOverride)]
    //@[@(NSWritingDirectionRightToLeft | NSTextWritingDirectionEmbedding)]
    //@[@(NSWritingDirectionRightToLeft | NSTextWritingDirectionOverride)]
    
    NSDictionary *attrDict1 = @{ NSWritingDirectionAttributeName: @[@(NSWritingDirectionLeftToRight | NSTextWritingDirectionEmbedding)],
                                 NSFontAttributeName: [UIFont systemFontOfSize:20] };
    self.testLable1.attributedText = [[NSAttributedString alloc] initWithString: originStr attributes: attrDict1];
    
    NSDictionary *attrDict2 = @{ NSWritingDirectionAttributeName: @[@(NSWritingDirectionRightToLeft | NSTextWritingDirectionOverride)],
                                 NSFontAttributeName: [UIFont systemFontOfSize:20] };
    self.testLable2.attributedText = [[NSAttributedString alloc] initWithString: originStr attributes: attrDict2];
    
    NSDictionary *attrDict3 = @{ NSWritingDirectionAttributeName: @[@(NSWritingDirectionLeftToRight | NSTextWritingDirectionOverride)],
                                 NSFontAttributeName: [UIFont systemFontOfSize:20] };
    self.testLable3.attributedText = [[NSAttributedString alloc] initWithString: originStr attributes: attrDict3];
}
- (void)test10
{
    //NSVerticalGlyphFormAttributeName 设置文字排版防线，取值为 NSNumber 对象(整数)，0 表示横排文本，1 表示竖排文本。
    //                                 在 iOS 中，总是使用横排文本，0 以外的值都未定义
    
    NSDictionary *attrDict1 = @{ NSVerticalGlyphFormAttributeName: @(-10),
                                 NSFontAttributeName: [UIFont systemFontOfSize:20] };
    self.testLable1.attributedText = [[NSAttributedString alloc] initWithString: originStr attributes: attrDict1];
    
    
    NSDictionary *attrDict2 = @{ NSVerticalGlyphFormAttributeName: @(0),
                                 NSFontAttributeName: [UIFont systemFontOfSize:20] };
    self.testLable2.attributedText = [[NSAttributedString alloc] initWithString: originStr attributes: attrDict2];
    
    NSDictionary *attrDict3 = @{ NSVerticalGlyphFormAttributeName: @(10),
                                 NSFontAttributeName: [UIFont systemFontOfSize:20] };
    self.testLable3.attributedText = [[NSAttributedString alloc] initWithString: originStr attributes: attrDict3];
}
- (void)test11
{
    //创建超链接
    //创建 NSMutableAttributedString
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString: self.testTextView.text];
    //给所有字符设置字体为Zapfino，字体高度为15像素
    [attributedStr addAttribute: NSFontAttributeName value: [UIFont systemFontOfSize:20] range: NSMakeRange(0, self.testTextView.text.length)];
    //添加超链接
    [attributedStr addAttribute: NSLinkAttributeName value: [NSURL URLWithString: @"http://www.baidu.com"] range: NSMakeRange(0, 20)];
    
    //分段控制，第0个字符开始的20个字符，即第5、6、7字符设置为红色
    [attributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor purpleColor] range: NSMakeRange(0, 20) ];
    
    self.testTextView.editable = NO;        //必须禁止输入，否则点击将弹出输入键盘
    self.testTextView.scrollEnabled = NO;   //可选
    self.testTextView.delegate = self;      //必须设置，否则代理函数不会被回调
    
    self.testTextView.attributedText = attributedStr;
}
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange{
    NSLog(@"textView is clicked...");
    return NO;
}

- (void)test12
{
    //NSAttachmentAttributeName 设置文本附件,取值为NSTextAttachment对象,常用于文字图片混排
    
    NSTextAttachment *textAttachment01 = [[NSTextAttachment alloc] init];
    textAttachment01.image = [UIImage imageNamed:@"load"];  //设置图片源
    textAttachment01.bounds = CGRectMake(0, 0, 30, 30);          //设置图片位置和大小
    NSMutableAttributedString *attrStr01 = [[NSMutableAttributedString alloc] initWithString: originStr];
    
    [attrStr01 addAttribute: NSFontAttributeName value: [UIFont systemFontOfSize: 25] range: NSMakeRange(0, originStr.length)];
    NSAttributedString *attrStr11 = [NSAttributedString attributedStringWithAttachment: textAttachment01];
    
    [attrStr01 insertAttributedString: attrStr11 atIndex: 2];  //NSTextAttachment占用一个字符长度，插入后原字符串长度增加1
    
    self.testLable1.attributedText = attrStr01;
    
    
    NSTextAttachment *textAttachment02 = [[NSTextAttachment alloc] init];
    textAttachment02.image = [UIImage imageNamed:@"load"];;  //设置图片源
    textAttachment02.bounds = CGRectMake(0, -10, 30, 40);          //设置图片位置和大小
    NSMutableAttributedString *attrStr02 = [[NSMutableAttributedString alloc] initWithString: originStr];
    
    [attrStr02 addAttribute: NSFontAttributeName value: [UIFont systemFontOfSize: 25] range: NSMakeRange(0, originStr.length)];
    NSAttributedString *attrStr12 = [NSAttributedString attributedStringWithAttachment: textAttachment02];
    
    [attrStr02 insertAttributedString: attrStr12 atIndex: 6];
    
    self.testLable2.attributedText = attrStr02;
    
    NSTextAttachment *textAttachment03 = [[NSTextAttachment alloc] init];
    textAttachment03.image = [UIImage imageNamed:@"load"];  //设置图片源
    textAttachment03.bounds = CGRectMake(0, -6, 50, 30);          //设置图片位置和大小
    NSMutableAttributedString *attrStr03 = [[NSMutableAttributedString alloc] initWithString: originStr];
    
    [attrStr03 addAttribute: NSFontAttributeName value: [UIFont systemFontOfSize: 25] range: NSMakeRange(0, originStr.length)];
    NSAttributedString *attrStr13 = [NSAttributedString attributedStringWithAttachment: textAttachment03];
    
    [attrStr03 insertAttributedString: attrStr13 atIndex: 8];
    
    self.testLable3.attributedText = attrStr03;
}
- (void)test13
{
    
}
- (void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length <= 0) {
        textView.attributedText = self.attributedString;
    }
    textView.selectedRange = NSMakeRange(textView.text.length - 1,0);
    NSLog(@"%@",@(textView.text.length));
}

- (NSMutableAttributedString *)attributedString
{
    if (_attributedString == nil)
    {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        //行间距
        //    paragraphStyle.lineHeightMultiple = 1.5;
        paragraphStyle.lineSpacing = 50;
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"I am a test String 我是一个测试字符 I am a test String 我是一个测试字符I am a test String 我是一个测试字符 I am a test String 我是一个测试字符" ];
        MMTextAttachment * textAttachment = [[ MMTextAttachment alloc ] init] ;
        UIImage * smileImage = [ UIImage imageNamed:@"load" ]  ;
        textAttachment.image = smileImage ;
        NSAttributedString * textAttachmentString = [NSAttributedString  attributedStringWithAttachment:textAttachment ] ;
        [string insertAttributedString:textAttachmentString atIndex:0 ];
        
        [string appendAttributedString:textAttachmentString ];
        NSRange range;
        range.location = 0;
        range.length = string.length;
        [string addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
        
        [string addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:30] range:range];
        _attributedString = string ;
    }
    return _attributedString;
}

// alignment               对齐方式，取值枚举常量 NSTextAlignment
// firstLineHeadIndent     首行缩进，取值 float
// headIndent              缩进，取值 float
// tailIndent              尾部缩进，取值 float
// ineHeightMultiple       可变行高,乘因数，取值 float
// maximumLineHeight       最大行高，取值 float
// minimumLineHeight       最小行高，取值 float
// lineSpacing             行距，取值 float
// paragraphSpacing        段距，取值 float
// paragraphSpacingBefore  段首空间，取值 float
//
// baseWritingDirection    句子方向，取值枚举常量 NSWritingDirection
// lineBreakMode           断行方式，取值枚举常量 NSLineBreakMode
// hyphenationFactor       连字符属性，取值 0 - 1

//- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithURL:(NSURL *)url {
//    HYBLoadWebviewController *web = [[HYBLoadWebviewController alloc] initWithUrl:url];
//    web.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:web animated:YES];
//    return;
//}
@end
