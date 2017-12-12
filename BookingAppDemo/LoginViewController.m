//
//  LoginViewController.m
//  BookingAppDemo
//
//  Created by Allen on 11/12/2017.
//  Copyright © 2017 Group3. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
- (IBAction)checkLogin;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.accountField];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.pwdField];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)textChange{
    if (self.accountField.text.length && self.pwdField.text.length) {
        self.loginBtn.enabled = YES;
    }
    else{
        self.loginBtn.enabled = NO;
    }
}

- (IBAction)checkLogin {
    if (![self.accountField.text isEqualToString:@"123"]) {
        UIAlertView *accalertview = [[UIAlertView alloc] initWithTitle:@"账号不存在" message:@"您输入的账号有误" delegate:self cancelButtonTitle:@"注册账号" otherButtonTitles:@"好的", nil];
        [accalertview show];
    }
    else if (![self.pwdField.text isEqualToString:@"123"]) {
        UIAlertView *pwdalertview = [[UIAlertView alloc] initWithTitle:@"密码错误" message:@"您输入的密码有误" delegate:self cancelButtonTitle:@"忘记密码" otherButtonTitles:@"好的", nil];
        [pwdalertview show];
    }
    else {
        [self performSegueWithIdentifier:@"login" sender:nil];
    }
}


@end
