//
//  WZTextView.h
//  WZTextView
//
//  Created by wang on 16/9/6.
//  Copyright © 2016年 lnest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WZTextView : UITextView

/**占位文字*/
@property (nonatomic, copy)NSString *placeholderText;

/**占位文字颜色*/
@property (nonatomic, strong)UIColor *placeholderColor;

/**textView文字改变时候的回调*/
@property (nonatomic, copy)void (^bk_textViewDidChange)(NSString * text);

@end
