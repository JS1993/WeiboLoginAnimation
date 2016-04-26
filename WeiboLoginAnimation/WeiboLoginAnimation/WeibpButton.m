//
//  WeibpButton.m
//  WeiboLoginAnimation
//
//  Created by  江苏 on 16/4/26.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "WeibpButton.h"

@implementation WeibpButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpViews];
    }
    return self;
}

-(void)awakeFromNib{
    
    [self setUpViews];
}


#pragma mark--设置view的一些初始状态
-(void)setUpViews{
    
    self.imageView.contentMode=UIViewContentModeCenter;
    
    self.titleLabel.textAlignment=NSTextAlignmentCenter;
    
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

#pragma mark--自定义按钮内部控件的布局
-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.imageView.frame=CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height*0.8);

    self.titleLabel.frame=CGRectMake(0, CGRectGetMaxY(self.imageView.frame), self.bounds.size.width, self.bounds.size.height-self.imageView.bounds.size.height);

}

#pragma mark--取消按钮的高亮状态
-(void)setHighlighted:(BOOL)highlighted{
    
}

#pragma mark--当点击按钮时，稍微放大
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [UIView animateWithDuration:0.2 animations:^{
        self.transform=CGAffineTransformMakeScale(1.2, 1.2);
    }];
    
}

#pragma mark--点击结束时，放大并移除按钮
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [UIView animateWithDuration:0.2 animations:^{
        self.transform=CGAffineTransformMakeScale(2.0, 2.0);
        self.alpha=0.2;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
