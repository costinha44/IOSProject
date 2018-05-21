//
//  ViewController.h
//  projetoIOS
//
//  Created by Andre Costa on 3/11/18.
//  Copyright © 2018 Andre Costa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Http.h"
#import "DetailsViewController.h"
#import "AppDelegate.h"


@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property NSNumber *idSerie;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

-(void)TakeAllShows;


@end

