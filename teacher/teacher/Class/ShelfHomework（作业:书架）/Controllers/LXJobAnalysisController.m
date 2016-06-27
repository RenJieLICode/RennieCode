//
//  LXJobAnalysisController.m
//  teacher
//
//  Created by RenJieLI on 16/6/27.
//  Copyright © 2016年 fanshu. All rights reserved.
//

#import "LXJobAnalysisController.h"
#import "LXMessageController.h"
@interface LXJobAnalysisController ()

@end

@implementation LXJobAnalysisController
- (IBAction)leaveMessageClick:(id)sender
{
    LXMessageController *messageVC = [[LXMessageController alloc]init];
    [self.navigationController pushViewController:messageVC animated:YES];
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = LXGlobalBg;
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
