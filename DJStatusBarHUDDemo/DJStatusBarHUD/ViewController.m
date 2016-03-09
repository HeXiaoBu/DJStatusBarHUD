//
//  ViewController.m
//  DJStatusBarHUD
//
//  Created by 贺进立 on 16/3/9.
//  Copyright © 2016年 贺进立. All rights reserved.
//

#import "ViewController.h"
#import "DJStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)success {
    [DJStatusBarHUD showSuccess:@"加载成功"];
}
- (IBAction)error {
    [DJStatusBarHUD showError:@"加载失败"];
}
- (IBAction)loading {
    [DJStatusBarHUD showLoading:@"正在加载中..."];
}
- (IBAction)msg {
    [DJStatusBarHUD showMsg:@"显示文字"];
}
- (IBAction)hidden {
    [DJStatusBarHUD hide];
}

@end
