//
//  ViewController.m
//  UIAlertController_demo
//
//  Created by Derek on 20/11/17.
//  Copyright © 2017年 Derek. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //ios 8.0 之前
    //UIAlertView
    
    //NS_CLASS_DEPRECATED_IOS(2_0, 9_0, "UIAlertView is deprecated. Use UIAlertController with a preferredStyle of UIAlertControllerStyleAlert instead") __TVOS_PROHIBITED
    //这句话的意思是UIAlertView is弃用、不宜用，推荐使用UIAlertController
    
    //-------例子-----
    
    UIButton *button_old_UIAlertView=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 120, 30)];
    button_old_UIAlertView.backgroundColor=[UIColor blackColor];
    [button_old_UIAlertView setTitle:@"UIAlertView" forState:UIControlStateNormal];
    button_old_UIAlertView.center=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2-100);
    [button_old_UIAlertView addTarget:self action:@selector(old_UIAlertView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_old_UIAlertView];
    
    
    
    UIButton *button_new_UIAlertController=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 120, 30)];
    button_new_UIAlertController.backgroundColor=[UIColor blackColor];
    [button_new_UIAlertController setTitle:@"UIAlertController" forState:UIControlStateNormal];
    button_new_UIAlertController.center=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [button_new_UIAlertController addTarget:self action:@selector(new_UIAlertController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_new_UIAlertController];
    
    
}

-(void)old_UIAlertView{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"网络失去连接" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
    
    alert.delegate = self;
    
 
    [alert show];
    
}

-(void)new_UIAlertController{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"显示的标题" message:@"标题的提示信息" preferredStyle:UIAlertControllerStyleAlert];
    
    alertController.view.backgroundColor=[UIColor whiteColor];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"点击取消");
        
    }]];
    
    
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"点击确认");
        
    }]];
    
    
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"警告" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"点击警告");
        
    }]];
    
    
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        NSLog(@"添加一个textField就会调用 这个block");
        
    }];
    
    
    
    // 由于它是一个控制器 直接modal出来就好了
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
