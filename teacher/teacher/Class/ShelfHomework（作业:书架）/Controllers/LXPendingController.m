//
//  LXPendingController.m
//  teacher
//
//  Created by RenJieLI on 16/6/24.
//  Copyright © 2016年 fanshu. All rights reserved.
//

#import "LXPendingController.h"
#import "YZDisplayViewHeader.h"
#import "RequesCover.h"
#import "LXShelfCell.h"
@interface LXPendingController ()
@property (nonatomic, weak) RequesCover *cover;
@end
static NSString *const progressID = @"progressCell";
@implementation LXPendingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1];
    /****滚动完成请求数据*******/
    
    // 如果想要滚动完成或者标题点击的时候，加载数据，需要监听通知
    
    // 监听滚动完成或者点击标题，只要滚动完成，当前控制器就会发出通知
    
    // 只需要监听自己发出的，不需要监听所有对象发出的通知，否则会导致一个控制器发出，所有控制器都能监听,造成所有控制器请求数据
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadData:) name:YZDisplayViewClickOrScrollDidFinshNote object:self];
    
    
    // 开发中可以搞个蒙版，一开始遮住当前界面，等请求成功，在把蒙版隐藏.
    RequesCover *cover = [RequesCover requestCover];
    
    [self.view addSubview:cover];
    
    _cover = cover;
    //    注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LXShelfCell class]) bundle:nil] forCellReuseIdentifier:progressID];
    [self.tableView setRowHeight:80];
    
    
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.cover.frame = self.view.bounds;
    
}

// 加载数据
- (void)loadData:(NSNotification *)noti
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSLog(@"%@--请求数据成功",self.title);
        
        [self.cover removeFromSuperview];
        NSLog(@"%@",noti);
        
    });
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    LXShelfCell *cell = [tableView dequeueReusableCellWithIdentifier:progressID];
    
    
    cell.progressLable.text = [NSString stringWithFormat:@"%@ : %ld",self.title,indexPath.row];
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
