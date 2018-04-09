//
//  TrainVC.m
//  BookingAppDemo
//
//  Created by Allen on 10/12/2017.
//  Copyright © 2017 Group3. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TrainVC.h"

@interface TrainVC ()

@end

@implementation TrainVC

- (IBAction)queryBtn:(id)sender {
    UIViewController *vc = [[UIViewController alloc] initWithNibName:@"TrainVC2" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil  这个 方法是在viewdidload之前加载的，以nib文件加载必然会调用此方法，但是代码加载也是会自动调用的，因此可以将一些数组创建，
     标题命名等初始化操作写在这里。
*/
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //从它的nib加载视图之后再做任何其他设置。
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    //处理任何可以重新创建的资源。
}

@end
