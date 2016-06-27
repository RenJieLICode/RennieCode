//
//  LXTabbarController.m
//  teacher
//
//  Created by fanshu on 16/6/21.
//  Copyright © 2016年 fanshu. All rights reserved.
//

#import "LXTabbarController.h"
#import "LXNavigationController.h"
#import "LXHomeViewController.h"
#import "LXShelfViewController.h"
#import "LXPublishHomeworkViewController.h"
#import "LXManagementViewController.h"
#import "LXPersonalViewController.h"


/**
 *
 [UIColor colorWithRed:<#(CGFloat)#> green:<#(CGFloat)#> blue:<#(CGFloat)#> alpha:<#(CGFloat)#>];
 颜色:
 
 24bit颜色: R G B
 * #ff0000
 * #ccee00
 * #000000
 * #ffffff
 
 32bit颜色: ARGB
 * #ff0000ff
 
 常见颜色:
 #ff0000 红色
 #00ff00 绿色
 #0000ff 蓝色
 #000000 黑色
 #ffffff 白色
 
 灰色的特点:RGB一样
 
 1024x1024像素的图片  32bit颜色
 
 1024x1024x32\8 == 1024x1024x4
 1024x1024x24\8 == 1024x1024x3
 */

@interface LXTabbarController ()
@property (nonatomic,strong)UIButton *stateSwitchBtn;

@end
@implementation LXTabbarController

+ (void)initialize
{
    // 通过appearance统一设置所有UITabBarItem的文字属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(responseStatus:) name:@"123" object:nil];
    
    
    
    
    
}
-(void)responseStatus:(NSNotification *)noti{
    
    self.stateSwitchBtn = noti.object ;
    // 添加子控制器
    [self setupChildVc:[[LXHomeViewController alloc] init] title:@"首页" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    if (self.stateSwitchBtn.tag==0) {
        [self setupChildVc:[[LXManagementViewController alloc] init] title:@"班级管理" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
        [self setupChildVc:[[LXShelfViewController alloc] init] title:@"书架" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
        
        [self setupChildVc:[[LXPublishHomeworkViewController alloc] init] title:@"布置作业" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
        
        
    }else{
        [self setupChildVc:[[LXShelfViewController alloc] init] title:@"作业" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
        
        [self setupChildVc:[[LXPublishHomeworkViewController alloc] init] title:@"复习题" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    }
    
    
    
    
    [self setupChildVc:[[LXPersonalViewController alloc] init] title:@"个人中心" image:@"my" selectedImage:@"my_click"];
}
/**
 * 初始化子控制器
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置文字和图片
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    // 包装一个导航控制器, 添加导航控制器为tabbarcontroller的子控制器
    LXNavigationController *nav = [[LXNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}
@end
