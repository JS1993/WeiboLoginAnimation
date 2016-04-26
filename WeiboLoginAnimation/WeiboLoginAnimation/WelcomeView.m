//
//  WelcomeView.m
//  WeiboLoginAnimation
//
//  Created by  江苏 on 16/4/26.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "WelcomeView.h"

@interface WelcomeView()
@property (strong, nonatomic) IBOutlet UIImageView *headImageView;
@property (strong, nonatomic) IBOutlet UIImageView *sloganImageView;
@property (strong, nonatomic) IBOutlet UILabel *welcomeLabel;


@end

@implementation WelcomeView

#pragma mark--当加入到父控件时，设置动画
-(void)didMoveToSuperview{
    
    //设置头像圆角
    self.headImageView.layer.cornerRadius=50;
    self.headImageView.layer.masksToBounds=YES;
    
    //设置头像位移
    CGFloat changeY=self.welcomeLabel.center.y-self.headImageView.center.y;
    self.headImageView.transform=CGAffineTransformMakeTranslation(0, changeY);
    
    //先将欢迎回来设置alpha为0
    self.welcomeLabel.alpha=0.0;
    
    //设置连环动画
    [UIView animateWithDuration:1.0 animations:^{
        
        self.sloganImageView.alpha=0.0;
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.5 animations:^{
            
            self.headImageView.transform=CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.5 animations:^{
                
                self.welcomeLabel.alpha=1.0;
                
            } completion:^(BOOL finished) {
                //延迟5秒进入主界面
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    
                    [self removeFromSuperview];
                    
                });
            }];
        }];
    }];
}

+(instancetype)welcomeView{
    return [[NSBundle mainBundle]loadNibNamed:@"WelcomeView" owner:nil options:nil][0];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
