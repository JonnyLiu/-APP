//
//  ViewController.m
//  Ticket
//
//  Created by zxJun on 2017/11/28.
//  Copyright © 2017年 zxJun. All rights reserved.
//

#import "ViewController.h"

#define DEVICE_WIDTH CGRectGetWidth([UIScreen mainScreen].bounds)

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

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
    [self renderUI]; // 渲染主框架
    [self tabItemSelected:0 needAnimation:NO]; // 主框架定位到第几个tab
    
    // 添加一个状态栏背景
    UIView *navbarView = [[UIView alloc]init];
    navbarView.frame = CGRectMake(0, 0, DEVICE_WIDTH, 30);
    navbarView.backgroundColor = [UIColor colorWithHexString:@"#1E90FF"];
    [self.view addSubview:navbarView];

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
- (NSDictionary *)getPageConfigInfo{
    NSDictionary *configInfo = @{
                                 @"topViewBgColor": @"#1E90FF",
                                 @"maskColor": @"#FFFFFF",
                                 @"maskPositionType": @2,
                                 @"type": @0,
                                 @"items": @[@{
                                                @"itemType": @2,
                                                @"title": @"火车票",
                                                @"normalTitleColor": @"#666666",
                                                @"selectTitleColor": @"#FFFFFF",
                                                @"normalIconName": @"train_unselected",
                                                @"selectIconName": @"train_selected",
                                                @"vcName": @"TrainVC"
                                                },
                                            @{
                                                @"itemType":@2,
                                                @"title":@"飞机票",
                                                @"normalTitleColor":@"#666666",
                                                @"selectTitleColor":@"#FFFFFF",
                                                @"normalIconName":@"plane_unselected",
                                                @"selectIconName":@"plane_selected",
                                                @"vcName":@"YXViewPagerSub1ViewController"
                                                },
                                            @{
                                                @"itemType":@2,
                                                @"title":@"汽车/船票",
                                                @"normalTitleColor":@"#666666",
                                                @"selectTitleColor":@"#FFFFFF",
                                                @"normalIconName":@"car_unselected",
                                                @"selectIconName":@"car_selected",
                                                @"vcName":@"YXViewPagerSub2ViewController"
                                                },
                                            @{
                                                @"itemType":@2,
                                                @"title":@"酒店",
                                                @"normalTitleColor":@"#666666",
                                                @"selectTitleColor":@"#FFFFFF",
                                                @"normalIconName":@"hotel_unselected",
                                                @"selectIconName":@"hotel_selected",
                                                @"vcName":@"YXViewPagerSub3ViewController"
                                                },
                                            @{
                                                @"itemType":@2,
                                                @"title":@"专车",
                                                @"normalTitleColor":@"#666666",
                                                @"selectTitleColor":@"#FFFFFF",
                                                @"normalIconName":@"spcar_unselected",
                                                @"selectIconName":@"spcar_selected",
                                                @"vcName":@"YXViewPagerSub4ViewController"
                                                }
                                            ]
                                 };
    return configInfo;
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
