//
//  LXSetUpController.m
//  teacher
//
//  Created by RenJieLI on 16/6/23.
//  Copyright © 2016年 fanshu. All rights reserved.
//

#import "LXSetUpController.h"
#import "Masonry.h"
#import "LXSetUpCell.h"
@interface LXSetUpController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSArray *titles;

@end
static NSString *const setUpID = @"setUpCell";
@implementation LXSetUpController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.title = @"设置";
    self.view.backgroundColor = LXGlobalBg;
    UITableView *setUpTableView = [[UITableView alloc]init];
    setUpTableView.dataSource = self;
    setUpTableView.delegate = self;
    setUpTableView.scrollEnabled = NO;
    setUpTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:setUpTableView];
    self.titles = @[@"密码修改",@"清除缓存",@"关于我们"];
    [setUpTableView registerNib:[UINib nibWithNibName:NSStringFromClass([LXSetUpCell class]) bundle:nil] forCellReuseIdentifier:setUpID];
    
    
    [setUpTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64);
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(-300);
    }];
    
    
}
#pragma mark ----- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LXSetUpCell *cell = [tableView dequeueReusableCellWithIdentifier:setUpID];
    cell.titleLable.text = self.titles[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            
            break;
            case 1:
            break;
            
        default:
            
            break;
    }
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
