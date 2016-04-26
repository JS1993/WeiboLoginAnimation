//
//  ViewController.m
//  WeiboLoginAnimation
//
//  Created by  江苏 on 16/4/26.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"
#import "ComposeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)addAction:(UIButton *)sender {
    ComposeViewController* comVC=[[ComposeViewController alloc]init];
    
    [self presentViewController:comVC animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}



@end
