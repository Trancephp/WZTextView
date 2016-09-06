//
//  ViewController.m
//  WZTextView
//
//  Created by wang on 16/9/6.
//  Copyright © 2016年 lnest. All rights reserved.
//

#import "ViewController.h"
#import "WZTextView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    CGRect frame = CGRectMake(100, 100, 100, 100);
    
    
    WZTextView *textView = [[WZTextView alloc] initWithFrame:frame];
    textView.backgroundColor = [UIColor lightGrayColor];
    textView.layer.cornerRadius = 5;
    [textView.layer setMasksToBounds:YES];
    [self.view addSubview:textView];
    
    textView.placeholderText = @"苹果香蕉牛奶咖啡";
    
    textView.placeholderColor = [UIColor redColor];
    
    [textView setBk_textViewDidChange:^(NSString *text) {
        NSLog(@"%@",text);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
