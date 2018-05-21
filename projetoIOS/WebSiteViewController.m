//
//  WebSiteViewController.m
//  projetoIOS
//
//  Created by FLAG on 20/04/18.
//  Copyright © 2018 Andre Costa. All rights reserved.
//

#import "WebSiteViewController.h"

@interface WebSiteViewController ()

@end

@implementation WebSiteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.WebView.UIDelegate =self;
    NSURL *url=[[NSURL alloc]initWithString:_oficialSite];
    NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:url];
    [self.WebView loadRequest:urlRequest];
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

@end
