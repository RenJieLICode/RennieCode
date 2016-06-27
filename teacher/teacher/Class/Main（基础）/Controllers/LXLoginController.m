//
//  LXLoginController.m
//  teacher
//
//  Created by RenJieLI on 16/6/21.
//  Copyright © 2016年 fanshu. All rights reserved.
//

#import "LXLoginController.h"
#import "LXTabbarController.h"
@interface LXLoginController ()

@end

@implementation LXLoginController
- (IBAction)stateClick:(UIButton *)sender {
   
    LXTabbarController *vc = [[LXTabbarController alloc]init];
    [self presentViewController:vc animated:nil completion:nil];
   
    [[NSNotificationCenter defaultCenter]postNotificationName:@"123" object:sender];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
