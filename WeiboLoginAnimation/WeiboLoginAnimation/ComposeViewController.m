//
//  ComposeViewController.m
//  WeiboLoginAnimation
//
//  Created by  江苏 on 16/4/26.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ComposeViewController.h"
#import "WeibpButton.h"

@interface ComposeViewController ()

@property(nonatomic,strong)NSMutableArray* buttonArrM;

@property(nonatomic,strong)NSTimer* timer;

@end

@implementation ComposeViewController

-(NSMutableArray *)buttonArrM{
    if (_buttonArrM==nil) {
        _buttonArrM=[NSMutableArray array];
    }
    return _buttonArrM;
}

#pragma mark-创建按钮
-(void)viewDidLoad{
    
    int cols=3;
    
    CGFloat buttonWH=100;
    
    CGFloat margin=([UIScreen mainScreen].bounds.size.width-cols*100)/(cols+1);
    
    CGFloat startY=250;
    
    for (int i=0; i<6; i++) {
        
        int x=margin+i%cols*(buttonWH+margin);
        
        int y=startY+i/cols*(buttonWH+margin);
        
        WeibpButton* btn=[[WeibpButton alloc]init];
        
        btn.frame=CGRectMake(x, y, buttonWH, buttonWH);
        
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_idea"] forState:UIControlStateNormal];
        
        [btn setTitle:@"发表" forState:UIControlStateNormal];
        
        //将按钮的transform属性改变，移到屏幕外，方便返回
        btn.transform=CGAffineTransformMakeTranslation(0, self.view.bounds.size.height);
        
        [self.buttonArrM addObject:btn];
        
        [self.view addSubview:btn];
    }
    
    self.timer=[NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(addButton) userInfo:nil repeats:YES];
}

#pragma mark-- 添加按钮的动画
static int i=0;

-(void)addButton{
   
    if (i==self.buttonArrM.count) {
        
        [self.timer invalidate];
        
        return;
    }
    
    
    WeibpButton* btn=self.buttonArrM[i];
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        btn.transform=CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
    }];
    
    i++;
}


@end
