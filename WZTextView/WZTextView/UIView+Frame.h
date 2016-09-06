//
//  UIView+Frame.h
//  buDeJie
//
//  Created by wang on 16/8/2.
//  Copyright © 2016年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

// 分类只是实现了方法的申明，这样只是申明了setter和getter方法
@property (nonatomic, assign)CGFloat x;
@property (nonatomic, assign)CGFloat y;
@property (nonatomic, assign)CGFloat width;
@property (nonatomic, assign)CGFloat height;
@property (nonatomic, assign)CGSize size;
@property (nonatomic, assign)CGFloat centerX;
@property (nonatomic, assign)CGFloat centerY;

@end
