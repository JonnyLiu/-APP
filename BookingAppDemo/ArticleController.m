//
//  ArticleController.m
//  BookingAppDemo
//
//  Created by Allen on 11/12/2017.
//  Copyright © 2017 Group3. All rights reserved.
//

#import "ArticleController.h"

@interface ArticleController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation ArticleController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /********** 以下为文章页相关代码 **********/
        self.tableview.rowHeight = 100;
        self.tableview.sectionHeaderHeight = 80;
        self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableview.separatorColor =[UIColor redColor];
        self.tableview.tableFooterView = [[UITableView  alloc] init];
    /********** 以上为文章页相关代码 **********/
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/********** 以下为文章页相关代码 **********/
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

/********** 以上为文章页相关代码 **********/


@end
