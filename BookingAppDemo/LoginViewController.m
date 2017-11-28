//
//  LoginViewController.m
//  ZhiXing
//
//  Created by zxJun on 2017/11/27.
//  Copyright © 2017年 zxJun. All rights reserved.
//

#import "LoginViewController.h"
#import "MBProgressHUD+NJ.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
- (IBAction)checkLogin;
@property (weak, nonatomic) IBOutlet UIButton *login;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.nameField];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.pwdField];
}

-(void)textChange{
    if (self.nameField.text.length && self.pwdField.text.length) {
        self.loginBtn.enabled = YES;
    }
    else{
        self.loginBtn.enabled = NO;
    }
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

- (IBAction)checkLogin {
    if (![self.nameField.text isEqualToString:@"123"]) {
        [MBProgressHUD showError:@"账号不存在"];
        return;
    }
    if (![self.pwdField.text isEqualToString:@"123"]) {
        [MBProgressHUD showError:@"密码不正确"];
        return;
    }
    [MBProgressHUD showMessage:@"努力加载中"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self performSegueWithIdentifier:@"LoginToRegister" sender:nil];
    });
}
@end
