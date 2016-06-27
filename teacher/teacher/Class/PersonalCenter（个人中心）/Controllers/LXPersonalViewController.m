//
//  LXPersonalViewController.m
//  teacher
//
//  Created by fanshu on 16/6/21.
//  Copyright © 2016年 fanshu. All rights reserved.
//

#import "LXPersonalViewController.h"
#import "Masonry.h"
#import "LXPersonalCell.h"
#import "LXShelfViewController.h"
#import "LXTeasingController.h"
#import "LXSetUpController.h"
@interface LXPersonalViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSArray *firstArr;
@property (nonatomic,strong) NSArray *lastArr;
@end
static NSString *const personalID = @"personal";
@implementation LXPersonalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.   Initialize
    
    [self setUpInitializeUI];
}
/**初始化一些UI*/
-(void)setUpInitializeUI
{
    self.view.backgroundColor = LXGlobalBg;
    self.firstArr = @[@"我的班级",@"我的作业"];
    self.lastArr = @[@"我要吐槽",@"个人设置"];
    //    背景View
    UIView *backgroundView = [[UIView alloc]init];
    backgroundView.backgroundColor = [UIColor redColor];
    [self.view addSubview:backgroundView];
    //  数据tableview
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
//    注册
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LXPersonalCell class]) bundle:nil] forCellReuseIdentifier:personalID];
    //    背景图片
    UIImageView *backgroundImage = [[UIImageView alloc]init];
    
    backgroundImage.image = [UIImage imageNamed:@"bg.png"];
    [backgroundView addSubview:backgroundImage];
    //    头像
    UIImageView *headPortraitImage = [[UIImageView alloc]init];
    headPortraitImage.backgroundColor = [UIColor grayColor];
    [backgroundImage addSubview:headPortraitImage];
    //    信息
    UILabel *classNumber = [[UILabel alloc]init];
    classNumber.text = [NSString stringWithFormat:@"班级数%d |",2];
    [backgroundImage addSubview:classNumber];
    UILabel *completedNumber = [[UILabel alloc]init];
    completedNumber.text = [NSString stringWithFormat:@"已完成作业数%d |",2];
    [backgroundImage addSubview:completedNumber];
    UILabel *unfinishedNumber = [[UILabel alloc]init];
    unfinishedNumber.text = [NSString stringWithFormat:@"待完成作业数%d |",3];
    [backgroundImage addSubview:unfinishedNumber];
    classNumber.textColor = completedNumber.textColor = unfinishedNumber.textColor = [UIColor lightGrayColor];
    [backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(-450);
        
        
    }];
    
    [backgroundImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backgroundView.mas_top).offset(0);
        make.left.equalTo(backgroundView.mas_left).offset(0);
        make.right.equalTo(backgroundView.mas_right).offset(0);
        make.bottom.equalTo(backgroundView.mas_bottom).offset(0);
        
        
    }];
    [headPortraitImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.center.equalTo(backgroundImage);
    }];
    [classNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headPortraitImage.mas_bottom).offset(-20);
        make.left.equalTo(backgroundImage.mas_left).offset(40);
        make.bottom.equalTo(backgroundImage.mas_bottom).offset(20);
    }];
    [completedNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(classNumber);
        make.left.equalTo(classNumber.mas_right).offset(10);
        make.bottom.equalTo(classNumber);
    }];
    [unfinishedNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(completedNumber);
        make.left.equalTo(completedNumber.mas_right).offset(10);
        make.bottom.equalTo(completedNumber);
        
        
    }];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backgroundView.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
    }];
   
}
#pragma mark -------UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 2;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LXPersonalCell *cell = [tableView dequeueReusableCellWithIdentifier:personalID];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section == 0) {
        cell.titleLabel.text = self.firstArr[indexPath.row];
    }else cell.titleLabel.text = self.lastArr[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {//第一组
        if (indexPath.row == 0) {//我的班级
            
        }else {//我的作业
            LXShelfViewController *shelfVC = [[LXShelfViewController alloc]init];
            
            [self.navigationController pushViewController:shelfVC animated:YES];
        }
    }else{//第二组
        if (indexPath.row == 0) {//我要吐槽
            LXTeasingController *teasingVC = [[LXTeasingController alloc]init];
            [self.navigationController pushViewController:teasingVC animated:YES];
            
        }else{//设置
            LXSetUpController *setUpVC = [[LXSetUpController alloc]init];
            [self.navigationController pushViewController:setUpVC animated:YES];
        }
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
   self.navigationController.navigationBar.hidden = NO;

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
