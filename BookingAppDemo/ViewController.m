//
//  ViewController.m
//  Ticket
//
//  Created by zxJun on 2017/11/28.
//  Copyright © 2017年 zxJun. All rights reserved.
//

#import "ViewController.h"
#import "FDSlideBar.h"
#import "TableViewCell.h"
#import "FDSlideContentView.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (strong, nonatomic) FDSlideBar *slideBar;
@property (strong, nonatomic) UITableView *tableView;

//@property (weak, nonatomic) IBOutlet UITextField *accountField;
//@property (weak, nonatomic) IBOutlet UITextField *pwdField;
//@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
//- (IBAction)checkLogin;

//@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /********** 以下为首页相关代码 **********/
    self.view.backgroundColor = [UIColor colorWithRed:0 / 255.0 green:153 / 255.0 blue:255 / 255.0 alpha:1.0];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    [self setupSlideBar];    
    [self setupTableView];
    /********** 以上为首页相关代码 **********/
    
    //    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.accountField];
    //    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.pwdField];
    //
    //    self.tableview.rowHeight = 100;
    //    self.tableview.sectionHeaderHeight = 80;
    //    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    //    self.tableview.separatorColor =[UIColor redColor];
    //    self.tableview.tableFooterView = [[UITableView  alloc] init];
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}
-(void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


/********** 以下为首页相关代码 **********/
#pragma mark - Private

// 设置顶部栏slideBar并添加到view
- (void)setupSlideBar {
    FDSlideBar *sliderBar = [[FDSlideBar alloc] init];
    sliderBar.backgroundColor = [UIColor colorWithRed:0 / 255.0 green:153 / 255.0 blue:255 / 255.0 alpha:1.0];
    
    // 初始化各个标题
    sliderBar.itemsTitle = @[@"火车票", @"飞机票", @"汽车/船票", @"酒店", @"专车"];
    
    // 设置颜色等属性
    sliderBar.itemColor = [UIColor whiteColor];
    sliderBar.itemSelectedColor = [UIColor orangeColor];
    sliderBar.sliderColor = [UIColor orangeColor];
    
    // 选中一项时的callback
    [sliderBar slideBarItemSelectedCallback:^(NSUInteger idx) {
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:idx inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
    }];
    [self.view addSubview:sliderBar];
    _slideBar = sliderBar;
    
    FDSlideContentView *content = [[FDSlideContentView alloc] init];
    [self.view addSubview:content];
}

// 设置一个tableView来显示内容
- (void)setupTableView {
    // frame
    CGRect frame = CGRectMake(0, 0, CGRectGetMaxY(self.view.frame) - CGRectGetMaxY(self.slideBar.frame), CGRectGetWidth(self.view.frame));
    self.tableView = [[UITableView alloc] initWithFrame:frame];
    [self.view addSubview:self.tableView];
    
    // 注册cell
    UINib *nib = [UINib nibWithNibName: @"TableViewCell" bundle: nil];
    [self.tableView registerNib:nib forCellReuseIdentifier: @"ContentCell"];
    
    // 把tableview的中心放在view的下方，以便旋转之后正确显示
    self.tableView.center = CGPointMake(CGRectGetWidth(self.view.frame) * 0.5, CGRectGetHeight(self.view.frame) * 0.5 + CGRectGetMaxY(self.slideBar.frame) * 0.5);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 将tableview逆时针旋转90度
    self.tableView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.pagingEnabled = YES;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.slideBar.itemsTitle count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier: @"ContentCell"];
    
    // 将cell里的内容逆时针旋转90度以正确显示
    cell.contentView.transform = CGAffineTransformMakeRotation(M_PI_2);
    cell.text = self.slideBar.itemsTitle[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 返回屏幕宽度
    return CGRectGetWidth(self.view.frame);
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:scrollView.contentOffset];
    
    // 当滑动浏览时选中相应的顶部菜单项
    [self.slideBar selectSlideBarItemAtIndex:indexPath.row];
}

/********** 以上为首页相关代码 **********/


//-(void)textChange{
//    if (self.accountField.text.length && self.pwdField.text.length) {
//        self.loginBtn.enabled = YES;
//    }
//    else{
//        self.loginBtn.enabled = NO;
//    }
//}


//- (IBAction)checkLogin {
//    if (![self.accountField.text isEqualToString:@"123"]) {
//        UIAlertView *accalertview = [[UIAlertView alloc] initWithTitle:@"账号不存在" message:@"您输入的账号有误" delegate:self cancelButtonTitle:@"注册账号" otherButtonTitles:@"好的", nil];
//        [accalertview show];
//    }
//    else if (![self.pwdField.text isEqualToString:@"123"]) {
//        UIAlertView *pwdalertview = [[UIAlertView alloc] initWithTitle:@"密码错误" message:@"您输入的密码有误      " delegate:self cancelButtonTitle:@"忘记密码" otherButtonTitles:@"好的", nil];
//        [pwdalertview show];
//    }
//}

//#pragma mark -UITableViewDataSource
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 2;
//}
//
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    if (section == 0){
//        return 2;
//    }else {
//        return 3;
//    };
//}

//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [[UITableViewCell alloc] init];
//    cell.accessoryType
//    = UITableViewCellAccessoryDisclosureIndicator;
//    if(indexPath.section == 0){
//        if(indexPath.row == 0){
//            cell.textLabel.text = @"听说今年年终，流行这样犒劳自己";
//            cell.imageView.image = [UIImage  imageNamed:@"timg1"];
//        }else if (indexPath.row == 1){
//            cell.textLabel.text = @"著名长寿之乡巴马";
//            cell.imageView.image = [UIImage  imageNamed:@"timg2"];
//        }
//    }else if (indexPath.section == 1){
//        if(indexPath.row == 0){
//            cell.textLabel.text = @"2017最后一个月你想去哪儿看雪？";
//            cell.imageView.image = [UIImage  imageNamed:@"timg3"];
//        }else if (indexPath.row == 1){
//            cell.textLabel.text = @"贵州美食，单纯为了吃你也要来！";
//            cell.imageView.image = [UIImage  imageNamed:@"timg4"];
//        }else if (indexPath.row == 2){
//            cell.textLabel.text = @"冰与火之歌，唯一对中国免签的美国岛屿";
//            cell.imageView.image = [UIImage  imageNamed:@"timg5"];
//        }
//    }
//    return cell;
//}
//
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    if(section == 0){
//        return @"热门";
//        
//    }else{
//        return @"推荐";
//    }
//}



@end
