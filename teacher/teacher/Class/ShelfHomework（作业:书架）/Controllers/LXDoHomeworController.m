//
//  LXDoHomeworController.m
//  teacher
//
//  Created by RenJieLI on 16/6/27.
//  Copyright © 2016年 fanshu. All rights reserved.
//

#import "LXDoHomeworController.h"
#import "LXScoreStatisticsController.h"
@interface LXDoHomeworController ()

@end

@implementation LXDoHomeworController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = LXGlobalBg;
    UIBarButtonItem *saveItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveAction)];
    saveItem.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = saveItem;
    
}
-(void)saveAction
{
    NSLog(@"暴击了保存按钮");
}
- (IBAction)submitClick:(id)sender
{
    LXScoreStatisticsController *vc = [[LXScoreStatisticsController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
