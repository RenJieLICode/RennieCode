//
//  LXPublishHomeworkViewController.m
//  teacher
//
//  Created by fanshu on 16/6/21.
//  Copyright © 2016年 fanshu. All rights reserved.
//

#import "LXPublishHomeworkViewController.h"
#import "LXShelfCell.h"
@interface LXPublishHomeworkViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;

@end
static NSString *const progressID = @"progress";
@implementation LXPublishHomeworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setUpControls];
   
 

    
}
-(void)setUpControls
{
    self.title = @"复习题";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setRowHeight:74];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.tableView];
    //    注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LXShelfCell class]) bundle:nil] forCellReuseIdentifier:progressID];
    
    UIBarButtonItem *editorItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain  target:self action:@selector(editorAction)];
    editorItem.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = editorItem;
}
-(void)editorAction
{
   
}
#pragma mark ----UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LXShelfCell *cell = [tableView dequeueReusableCellWithIdentifier:progressID];
    return cell;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 删除的操作
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
       
        
    }
    

}

//- (UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}
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
