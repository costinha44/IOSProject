//
//  WebSiteViewController.h
//  projetoIOS
//
//  Created by FLAG on 20/04/18.
//  Copyright © 2018 Andre Costa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface WebSiteViewController : UIViewController<WKUIDelegate>
@property (weak, nonatomic) IBOutlet WKWebView *WebView;
@property NSString *oficialSite;

@end
