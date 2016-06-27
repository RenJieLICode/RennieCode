//
//  LXShelfViewController.m
//  teacher
//
//  Created by RenJieLI on 16/6/24.
//  Copyright © 2016年 fanshu. All rights reserved.
//

#import "LXShelfViewController.h"
#import "LXCompleteViewController.h"
#import "LXUnfinishedViewController.h"
#import "LXPendingController.h"
@interface LXShelfViewController ()

@end

@implementation LXShelfViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"作业";
    
    
    CGFloat y = self.navigationController?64:0;
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    
    // 设置搜索框
    CGFloat searchH = 44;
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, y, screenW, searchH)];
    
    [self.view addSubview:searchBar];
    
    
    // 设置整体内容尺寸（包含标题滚动视图和底部内容滚动视图）
    [self setUpContentViewFrame:^(UIView *contentView) {
        
        CGFloat contentX = 0;
        
        CGFloat contentY = CGRectGetMaxY(searchBar.frame);
        
        CGFloat contentH = screenH - contentY;
        
        contentView.frame = CGRectMake(contentX, contentY, screenW, contentH);
        
    }];
    
    // 添加所有子控制器
    [self setUpAllViewController];
    
    /****** 标题渐变 ******/
    /*
     方式一
     self.isShowTitleGradient = YES;
     self.endR = 1;
     self.endG = 130 / 255.0;
     self.endB = 44 / 255.0;
     */
    
    // *推荐方式(设置标题渐变)
    [self setUpTitleGradient:^(BOOL *isShowTitleGradient, YZTitleColorGradientStyle *titleColorGradientStyle, CGFloat *startR, CGFloat *startG, CGFloat *startB, CGFloat *endR, CGFloat *endG, CGFloat *endB) {
        
        // 不需要设置的属性，可以不管
        *isShowTitleGradient = YES;
        
        // 设置结束时，RGB通道各个值
        *endR = 1;
        *endG = 130 / 255.0;
        *endB = 44 / 255.0;
        
    }];
    
    
    /****** 设置遮盖 ******/
    //    self.isShowTitleCover = YES;
    //    self.coverColor = [UIColor colorWithWhite:0.7 alpha:0.4];
    //    self.coverCornerRadius = 13;
    
    // *推荐方式(设置遮盖)
    [self setUpCoverEffect:^(BOOL *isShowTitleCover, UIColor **coverColor, CGFloat *coverCornerRadius) {
        // 设置是否显示标题蒙版
        *isShowTitleCover = YES;
        
        // 设置蒙版颜色
        *coverColor = [UIColor colorWithWhite:0.7 alpha:0.4];
        
        // 设置蒙版圆角半径
        *coverCornerRadius = 13;
    }];
}

// 添加所有子控制器
- (void)setUpAllViewController
{
    
    // 已完成
    LXCompleteViewController *newReleaseVc = [[LXCompleteViewController alloc] init];
    newReleaseVc.title = @"已完成";
    [self addChildViewController:newReleaseVc];
    
    // 未完成
    LXUnfinishedViewController *alreadyReleaseVc = [[LXUnfinishedViewController alloc] init];
    alreadyReleaseVc.title = @"未完成";
    [self addChildViewController:alreadyReleaseVc];
    
    // 待完成
    LXPendingController *waitingReleaseVc = [[LXPendingController alloc] init];
    waitingReleaseVc.title = @"待完成";
    [self addChildViewController:waitingReleaseVc];
   
    
    
    
}

@end
