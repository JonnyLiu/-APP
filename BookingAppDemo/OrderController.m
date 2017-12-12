//
//  OrderController.m
//  BookingAppDemo
//
//  Created by Allen on 12/12/2017.
//  Copyright © 2017 Group3. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OrderController.h"

@interface OrderController () <UITableViewDataSource>

@end

@implementation OrderController

- (void)viewDidLoad {
    [super viewDidLoad];
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

@end
