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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
