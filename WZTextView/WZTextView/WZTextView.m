//
//  WZTextView.m
//  WZTextView
//
//  Created by wang on 16/9/6.
//  Copyright © 2016年 lnest. All rights reserved.
//

#import "WZTextView.h"
#import "UIView+Frame.h"
@interface WZTextView ()

/**占位label*/
@property (nonatomic, weak)UILabel *placeholderLabel;

@end

@implementation WZTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor clearColor];
        
        UILabel *placeholderLabel = [[UILabel alloc] init];
        placeholderLabel.backgroundColor = [UIColor clearColor];
        placeholderLabel.numberOfLines = 0;
        [self addSubview:placeholderLabel];
        self.placeholderLabel = placeholderLabel;
        
        self.placeholderColor = [UIColor lightGrayColor];
        self.font = [UIFont systemFontOfSize:14];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewTextDidChange) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}

#pragma mark - 通知监听事件
- (void)textViewTextDidChange
{
    
    
    if (self.bk_textViewDidChange) {
        self.bk_textViewDidChange(self.text);
    }
    
    self.placeholderLabel.hidden = self.hasText;
    
    
}

#pragma mark - 重新布局子控件
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.placeholderLabel.y = 8;
    self.placeholderLabel.x = 5;
    self.placeholderLabel.width = self.width - self.placeholderLabel.x * 2;
    CGSize maxSize = CGSizeMake(self.placeholderLabel.width, MAXFLOAT);
    self.placeholderLabel.height = [self.placeholderText boundingRectWithSize:maxSize options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.placeholderLabel.font} context:nil].size.height;
}

#pragma mark - getter && setter
/**
 *  设置占位文字，设置字体重新布局子控件
 *
 *  @param placeholderText 占位文字字符串
 */
- (void)setPlaceholderText:(NSString *)placeholderText
{
    _placeholderText = [placeholderText copy];
    
    self.placeholderLabel.text = _placeholderText;
    
    [self setNeedsLayout];
}

/**
 *  设置展位文字颜色
 *
 *  @param placeholderColor 颜色
 */
- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    self.placeholderLabel.textColor = placeholderColor;
}

/**
 *  设置字体,设置后重新布局子控件
 *
 *  @param font font
 */
- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    self.placeholderLabel.font = font;
    
    [self setNeedsLayout];
}

#pragma mark - 设置文字和富文本的时候都要调用监听事件
- (void)setText:(NSString *)text
{
    [super setText:text];
    [self textViewTextDidChange];
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
    [super setAttributedText:attributedText];
    [self textViewTextDidChange];
}

#pragma mark - 移除通知
- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:UITextViewTextDidChangeNotification];
}

@end
