//
//  SearchViewController.h
//  projetoIOS
//
//  Created by Andre Costa on 4/22/18.
//  Copyright © 2018 Andre Costa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Http.h"
#import "ConstrutoresAPI.h"
#import "AppDelegate.h"
#import "DetailsViewController.h"


@interface SearchViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UISearchControllerDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searckBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UISearchController *searchController;
@property NSMutableArray *searchSeries;

-(void)TakeShowsSearch:(NSString *)searchWord;

@end
