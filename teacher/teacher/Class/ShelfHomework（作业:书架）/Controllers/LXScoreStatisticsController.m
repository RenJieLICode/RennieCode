//
//  LXScoreStatisticsController.m
//  teacher
//
//  Created by RenJieLI on 16/6/27.
//  Copyright © 2016年 fanshu. All rights reserved.
//

#import "LXScoreStatisticsController.h"
#import "LXPublishHomeworkViewController.h"
#import "LXScoreStatisticsCell.h"
#import "LXJobAnalysisController.h"
@interface LXScoreStatisticsController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@end
static NSString *const statisticsID = @"statistics";
static NSString *const headID = @"head";
@implementation LXScoreStatisticsController
- (IBAction)saveClick:(id)sender
{
    LXPublishHomeworkViewController *vc  = [[LXPublishHomeworkViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"分数统计";
    self.view.backgroundColor = LXGlobalBg;
    self.automaticallyAdjustsScrollViewInsets = NO;
    CGFloat itemWidth = (SCREEN_WIDTH -3*10)/2.0;
    CGFloat itemHeight = itemWidth/3.0*2;
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    flowLayout.minimumInteritemSpacing = 50;
    flowLayout.minimumLineSpacing = 50;
    flowLayout.itemSize = CGSizeMake(itemWidth, itemHeight);
    //    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_WIDTH) collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.alwaysBounceVertical = NO;
    
    [self.view addSubview:collectionView];
    
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([LXScoreStatisticsCell class]) bundle:nil] forCellWithReuseIdentifier:statisticsID];
    [collectionView registerNib:[UINib nibWithNibName:@"LXSupplementaryView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headID];

}

- ( void)scrollViewDidScroll:( UIScrollView *)scrollView;
{
    scrollView.alwaysBounceHorizontal = NO;
    scrollView.scrollEnabled = NO;
    scrollView.showsVerticalScrollIndicator = NO;
}
#pragma mark ---- UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LXScoreStatisticsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:statisticsID forIndexPath:indexPath];
    
    return cell;
}
#pragma mark ------ UICollectionViewDelegate
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    NSString *reuseIdentifier;
    reuseIdentifier = headID;
    UICollectionReusableView *view =  [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:reuseIdentifier   forIndexPath:indexPath];
    UILabel *label = (UILabel *)[view viewWithTag:1];
    label.text = [NSString stringWithFormat:@"2016.06.25:%ld",indexPath.section];
    NSLog(@"%@",NSStringFromCGRect(view.frame));
    return view;
}
//返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size;
    if (section==0) {
        size =CGSizeMake(self.view.bounds.size.width, 30);
        // size={self.view.bounds.size.width,200};
        
    }else{
        size =CGSizeMake(self.view.bounds.size.width, 80);
        
    }
    return size;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    //第一个参数：设置item的宽
    //第二个参数：设置item的高
    return CGSizeMake(75 , 62);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    //上左下右
    return UIEdgeInsetsMake(10 ,30, 10, 30);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LXJobAnalysisController *vc = [[LXJobAnalysisController alloc]init];
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
