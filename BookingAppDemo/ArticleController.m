//
//  ArticleController.m
//  BookingAppDemo
//
//  Created by Allen on 11/12/2017.
//  Copyright © 2017 Group3. All rights reserved.
//

#import "ArticleController.h"

@interface ArticleController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIScrollView *advertisement;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ArticleController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    图片的宽
    CGFloat imageW = self.advertisement.frame.size.width;
    //    CGFloat imageW = 300;
    //    图片高
    CGFloat imageH = self.advertisement.frame.size.height;
    //    图片的Y
    CGFloat imageY = 0;
    //    图片中数
    NSInteger totalCount = 3;
    //   添加3张图片
    for (int i = 0; i < totalCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        //        图片X
        CGFloat imageX = i * imageW;
        //        设置frame
        imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
        //        设置图片
        NSString *name = [NSString stringWithFormat:@"img_0%d", i ];
        imageView.image = [UIImage imageNamed:name];
        //        隐藏指示条
        self.advertisement.showsHorizontalScrollIndicator = NO;
        
        [self.advertisement addSubview:imageView];
    }
    
    //    2.设置scrollview的滚动范围
    CGFloat contentW = totalCount *imageW;
    //不允许在垂直方向上进行滚动
    self.advertisement.contentSize = CGSizeMake(contentW, 0);
    
    //    3.设置分页
    self.advertisement.pagingEnabled = YES;
    
    //    4.监听scrollview的滚动
    self.advertisement.delegate = self;
    
    
    [self addTimer];
    self.tableview.rowHeight = 100;
    self.tableview.sectionHeaderHeight = 80;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableview.separatorColor =[UIColor redColor];
    self.tableview.tableFooterView = [[UITableView  alloc] init];
}


#pragma mark -UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0){
        return 2;
    }else {
        return 3;
    };
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.accessoryType
    = UITableViewCellAccessoryDisclosureIndicator;
    if(indexPath.section == 0){
        if(indexPath.row == 0){
            cell.textLabel.text = @"听说今年年终，流行这样犒劳自己";
            cell.imageView.image = [UIImage  imageNamed:@"timg1"];
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"著名长寿之乡巴马";
            cell.imageView.image = [UIImage  imageNamed:@"timg2"];
        }
    }else if (indexPath.section == 1){
        if(indexPath.row == 0){
            cell.textLabel.text = @"2017最后一个月你想去哪儿看雪？";
            cell.imageView.image = [UIImage  imageNamed:@"timg3"];
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"贵州美食，单纯为了吃你也要来！";
            cell.imageView.image = [UIImage  imageNamed:@"timg4"];
        }else if (indexPath.row == 2){
            cell.textLabel.text = @"冰与火之歌，唯一对中国免签的美国岛屿";
            cell.imageView.image = [UIImage  imageNamed:@"timg5"];
        }
    }
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0){
        return @"热门";
        
    }else{
        return @"推荐";
        
    }
}


- (void)nextImage
{
    int page = (int)self.pageControl.currentPage;
    if (page == 2) {
        page = 0;
    }else
    {
        page++;
    }
    
    //  滚动scrollview
    CGFloat x = page * self.advertisement.frame.size.width;
    self.advertisement.contentOffset = CGPointMake(x, 0);
}

// scrollview滚动的时候调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"滚动中");
    //    计算页码
    //    页码 = (contentoffset.x + scrollView一半宽度)/scrollView宽度
    CGFloat scrollviewW =  scrollView.frame.size.width;
    CGFloat x = scrollView.contentOffset.x;
    int page = (x + scrollviewW / 2) /  scrollviewW;
    self.pageControl.currentPage = page;
}

// 开始拖拽的时候调用
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //    关闭定时器(注意点; 定时器一旦被关闭,无法再开启)
    //    [self.timer invalidate];
    [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //    开启定时器
    [self addTimer];
}

//开启定时器
- (void)addTimer{
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
}

//关闭定时器

- (void)removeTimer
{
    [self.timer invalidate];
}
/*
 
 -(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
 eatDetailVC *detailView = [[eatDetailVC alloc]init];
 [self.navigationController pushViewController:detailView animated:NO];
 }*/


-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}

-(void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
