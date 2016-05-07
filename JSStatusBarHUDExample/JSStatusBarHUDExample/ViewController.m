//
//  ViewController.m
//  JSStatusBarHUDExample
//
//  Created by leo on 5/7/16.
//  Copyright © 2016 leo. All rights reserved.
//

#import "ViewController.h"
#import "JSStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)success:(id)sender {
    [JSStatusBarHUD showSuccess:@"加载成功!"];
}

- (IBAction)error:(id)sender {
    [JSStatusBarHUD showError:@"加载失败!"];
}

- (IBAction)loading:(id)sender {
    [JSStatusBarHUD showLoading:@"正在加载中..."];
}

- (IBAction)hide:(id)sender {
    [JSStatusBarHUD hide];
}

- (IBAction)message:(id)sender {
    [JSStatusBarHUD showMessage:@"普通文字"];
}


@end
