//
//  LXHomeViewController.m
//  teacher
//
//  Created by fanshu on 16/6/21.
//  Copyright © 2016年 fanshu. All rights reserved.
//

#import "LXHomeViewController.h"
#import "SDCycleScrollView.h"
@interface LXHomeViewController ()<UISearchBarDelegate,SDCycleScrollViewDelegate>


@end

@implementation LXHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = LXGlobalBg;
    [self setUpSearch];
    [self setUpAdvertising];
    [self setupHomeworkView];
}
#pragma mark -----  设置轮播图
-(void)setUpAdvertising
{
    UIScrollView *demoContainerView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    demoContainerView.contentSize = CGSizeMake(self.view.frame.size.width, 1200);
    [self.view addSubview:demoContainerView];
    NSArray *imagesURLStrings = @[
                                  @"http://p1.qqyou.com/pic/UploadPic/2013-3/19/2013031923222781617.jpg",
                                  @"http://cdn.duitang.com/uploads/item/201409/27/20140927192649_NxVKT.thumb.700_0.png",
                                  @"http://img4.duitang.com/uploads/item/201409/27/20140927192458_GcRxV.jpeg",
                                  @"http://cdn.duitang.com/uploads/item/201304/20/20130420192413_TeRRP.thumb.700_0.jpeg"];
     CGFloat w = self.view.bounds.size.width;
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, w, 180) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
//    cycleScrollView2.titlesGroup = titles;
    cycleScrollView2.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    [demoContainerView addSubview:cycleScrollView2];
    
    //         --- 模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
    });

}
#pragma mark -----  设置搜索框
-(void)setUpSearch
{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 35)];//allocate titleView
    UIColor *color =  self.navigationController.navigationBar.barTintColor;
    
    [titleView setBackgroundColor:color];
    
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    
    searchBar.delegate = self;
    searchBar.frame = CGRectMake(0, 0, 300, 35);
    searchBar.backgroundColor = color;
    searchBar.layer.cornerRadius = 18;
    searchBar.layer.masksToBounds = YES;
    [searchBar.layer setBorderWidth:8];
    [searchBar.layer setBorderColor:[UIColor whiteColor].CGColor];  //设置边框为白色
    
    searchBar.placeholder = @"请输入班级编号/教师手机号加入班级";
    [titleView addSubview:searchBar];
    
    //Set to titleView
    [self.navigationItem.titleView sizeToFit];
    self.navigationItem.titleView = titleView;
    

    
}
- (void)setupHomeworkView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 264, SCREEN_WIDTH, 160)];
    view.layer.borderColor = [UIColor lightGrayColor].CGColor;
    view.layer.borderWidth = 1;
    [self.view addSubview:view];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 330, SCREEN_WIDTH, 30)];
    label.text = @"还没有加入班级，赶紧输入班级号码加入吧？";
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    [self.view addSubview:label];
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
